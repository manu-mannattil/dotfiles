" fzf.vim customizations

if exists('g:loaded_my_fzf') || !exists('g:loaded_fzf_vim') || !executable('fzf')
  finish
endif

let g:loaded_my_fzf = 1

" Replace buffer navigation mappings from ~/.vimrc with fzf versions.
" Find files under the current directory recursively.
" (Equivalent to ,E if 'autochdir' is set.)
nnoremap ,e :Files <C-R>=expand('%:p:h')<CR><CR>
" Find files under the directory of the current file recursively.
nnoremap ,E :Files<CR>
" Find buffers.
nnoremap ,b :Buffers<CR>
" Look at history (past).
nnoremap ,p :History<CR>

" Additional fzf mappings (not in ~/.vimrc)
" Look at sarch history.
nnoremap ,/ :History/<CR>
" Look at command history.
nnoremap ,: :History:<CR>

" Hack to replace :rg with :Rg.
cnoreabbrev <expr> rg (getcmdtype() ==# ':' && getcmdline() ==# 'rg') ? 'Rg' : 'rg'

" Build a ripgrep command to obey wildignore patterns.
function! s:fzf_default_command() abort
  let cmd = ['rg', '--follow', '--files']

  for pattern in split(&wildignore, ',')
    let cleaned = substitute(pattern, '^\*/', '', '')
    call extend(cmd, ['--glob', shellescape('!' . cleaned)])
  endfor

  return join(cmd, ' ')
endfunction
" This sets the environment variable FZF_DEFAULT_COMMAND to the value of
" s:fzf_default_command() when this file is first read, i.e., whatever
" the value of &wildignore that was available then will be used.
let $FZF_DEFAULT_COMMAND = s:fzf_default_command()

" Filter files from :History.
let s:filter_patt = [
      \ '*/.*',
      \ '*/.*/*',
      \ '*/doc/*.txt',
      \ '/etc/*',
      \ '/tmp/*',
      \ '/usr/*',
      \ '/var/*',
      \ ]

" Adapted from fzf#vim#_recent_files() in autoload/fzf.vim.
" Unlike the function defined there, this function returns absolute
" paths, which is better IMHO.
function! s:oldfiles()
  let files = fzf#vim#_uniq(filter([expand('%')], 'len(v:val)')
        \ + filter(map(fzf#vim#_buflisted_sorted(), 'bufname(v:val)'), 'len(v:val)')
        \ + filter(copy(v:oldfiles), "filereadable(fnamemodify(v:val, ':p'))"))

  " Weed out files from s:filter_patt.
  return filter(files, {_, v -> empty(filter(copy(s:filter_patt), 'v =~# glob2regpat(v:val)'))})
endfunction

" Adapted from plugin/fzf.vim.
function! s:history(arg, extra, bang)
  let bang = a:bang || a:arg[len(a:arg)-1] == '!'
  if a:arg[0] == ':'
    call fzf#vim#command_history(bang)
  elseif a:arg[0] == '/'
    call fzf#vim#search_history(bang)
  else " v:oldfiles with filter
    call fzf#run(fzf#wrap({
          \ 'source': s:oldfiles(),
          \ 'options': ['-m', '--header-lines', !empty(expand('%')), '--prompt', 'Hist> '],
          \ 'sink': 'edit'
          \}, bang))
  endif
endfunction

command! -bang -nargs=* History call s:history(<q-args>, fzf#vim#with_preview(), <bang>0)
