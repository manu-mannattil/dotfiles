" Author:     Jaiired Gorski
" Upstream:   https://github.com/jaredgorski/fogbell
" Changes:    1. Removed all mismatches between xterm256 and GUI colors.
"             2. Tweaked colors of statuslines and vertical splits.
"             3. Renaming of variables and changes in non-monochrome colors.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "fogbell"

" Highlighting function
" ---------------------

" https://github.com/tomasiser/vim-code-dark and https://github.com/chriskempson/base16-vim
fun! <sid>hi(group, fg, bg, attr)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" .  a:fg.cterm256
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" .  a:bg.cterm256
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" Color variables
" ---------------

let s:voidBlack1 = {'gui': '#1C1C1C', 'cterm256': '234'}
let s:voidBlack2 = {'gui': '#262626', 'cterm256': '235'}
let s:voidGray1 = {'gui': '#3A3A3A', 'cterm256': '237'}
let s:voidGray2 = {'gui': '#4E4E4E', 'cterm256': '239'}
let s:voidGray3 = {'gui': '#6C6C6C', 'cterm256': '242'}
let s:voidGray4 = {'gui': '#B2B2B2', 'cterm256': '249'}
let s:voidSteel = {'gui': '#D0D0D0', 'cterm256': '252'}
let s:voidBlue = {'gui': '#87AFAF', 'cterm256': '109'}
let s:voidGreen = {'gui': '#5FAF87', 'cterm256': '72'}
let s:voidGold = {'gui': '#FFAF00', 'cterm256': '214'}
let s:voidRed1 = {'gui': '#FF5F00', 'cterm256': '202'}
let s:voidRed2 = {'gui': '#FF0000', 'cterm256': '196'}
let s:voidSpecial1 = {'gui': '#afaf00', 'cterm256': '142'}
let s:none = {'gui': 'NONE', 'cterm256': 'NONE'}

" Definitions
" -----------

" call <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE)

" Editor
call <sid>hi('ColorColumn', s:none, s:voidGray1, 'none')
call <sid>hi('Cursor', s:voidBlack1, s:voidRed1, 'none')
call <sid>hi('CursorColumn', s:none, s:voidGray1, 'none')
call <sid>hi('CursorLine', s:none, s:voidGray1, 'none')
call <sid>hi('CursorLineNr', s:voidSteel, s:voidGray1, 'none')
call <sid>hi('Directory', s:voidSteel, s:voidBlack1, 'none')
call <sid>hi('FoldColumn', s:none, s:voidBlack2, 'none')
call <sid>hi('Folded', s:voidGray3, s:none, 'none')
call <sid>hi('IncSearch', s:voidBlack1, s:voidGold, 'none')
call <sid>hi('LineNr', s:voidGray3, s:voidBlack2, 'none')
call <sid>hi('MatchParen', s:voidSteel, s:voidGray3, 'none')
call <sid>hi('Normal', s:voidSteel, s:voidBlack1, 'none')
call <sid>hi('Pmenu', s:none, s:voidBlack2, 'none')
call <sid>hi('PmenuSel', s:none, s:voidGray2, 'none')
call <sid>hi('PmenuThumb', s:none, s:voidGray1, 'none')
call <sid>hi('Search', s:voidBlack1, s:voidGold, 'none')
call <sid>hi('SignColumn', s:none, s:voidBlack2, 'none')
call <sid>hi('StatusLine', s:voidBlack1, s:voidSteel, 'none')
call <sid>hi('StatusLineNC', s:voidSteel, s:voidGray1, 'none')
call <sid>hi('VertSplit', s:voidGray3, s:voidGray3, 'none')
call <sid>hi('Visual', s:none, s:voidGray2, 'none')

" General
call <sid>hi('Boolean', s:voidSteel, s:none, 'none')
call <sid>hi('Character', s:voidSteel, s:none, 'none')
call <sid>hi('Comment', s:voidGray3, s:none, 'none')
call <sid>hi('Conditional', s:voidSteel, s:none, 'none')
call <sid>hi('Constant', s:voidSteel, s:none, 'none')
call <sid>hi('Define', s:voidSteel, s:none, 'none')
call <sid>hi('DiffAdd', s:voidBlack1, s:voidGreen, 'none')
call <sid>hi('DiffChange', s:voidBlack1, s:voidGold, 'none')
call <sid>hi('DiffDelete', s:voidSteel, s:voidRed1, 'none')
call <sid>hi('DiffText', s:voidGray1, s:voidBlue, 'none')
call <sid>hi('ErrorMsg', s:voidBlack1, s:voidRed1, 'none')
call <sid>hi('Float', s:voidSteel, s:none, 'none')
call <sid>hi('Function', s:voidSteel, s:none, 'none')
call <sid>hi('Identifier', s:voidSteel, s:none, 'none')
call <sid>hi('Keyword', s:voidSteel, s:none, 'none')
call <sid>hi('Label', s:voidSteel, s:none, 'none')
call <sid>hi('MoreMsg', s:voidSteel, s:voidBlack1, 'none')
call <sid>hi('NonText', s:voidGray3, s:none, 'none')
call <sid>hi('Number', s:voidSteel, s:none, 'none')
call <sid>hi('Operator', s:voidSteel, s:none, 'none')
call <sid>hi('PreProc', s:voidSteel, s:none, 'none')
call <sid>hi('Question', s:voidRed1, s:none, 'none')
call <sid>hi('Special', s:voidSteel, s:none, 'none')
call <sid>hi('SpecialKey', s:voidSteel, s:none, 'none')
call <sid>hi('SpellBad', s:voidRed2, s:none, 'underline')
call <sid>hi('SpellCap', s:voidSteel, s:none, 'underline')
call <sid>hi('SpellLocal', s:voidSteel, s:none, 'underline')
call <sid>hi('Statement', s:voidSteel, s:none, 'none')
call <sid>hi('StorageClass', s:voidSteel, s:none, 'none')
call <sid>hi('String', s:voidSteel, s:none, 'none')
call <sid>hi('Tag', s:voidSteel, s:none, 'none')
call <sid>hi('Title', s:none, s:none, 'bold')
call <sid>hi('Todo', s:voidGray3, s:none, 'inverse,bold')
call <sid>hi('Type', s:none, s:none, 'none')
call <sid>hi('Underlined', s:none, s:none, 'underline')
call <sid>hi('WarningMsg', s:voidBlack1, s:voidRed1, 'none')
call <sid>hi('WildMenu', s:voidSteel, s:voidGray2, 'none')

" Diff Mode
if &diff
  call <sid>hi('DiffAdd', s:voidBlack1, s:voidGreen, 'none')
  call <sid>hi('DiffChange', s:voidBlack1, s:voidGold, 'none')
  call <sid>hi('DiffDelete', s:voidRed2, s:voidRed1, 'none')
  call <sid>hi('DiffText', s:voidGray1, s:voidBlue, 'none')
else
  call <sid>hi('DiffAdd', s:voidGreen, s:none, 'none')
  call <sid>hi('DiffChange', s:voidGold, s:none, 'none')
  call <sid>hi('DiffDelete', s:voidRed2, s:none, 'none')
  call <sid>hi('DiffText', s:voidSteel, s:voidBlue, 'none')
endif

" Languages
" ---------

" C
call <sid>hi('cConstant', s:voidSteel, s:none, 'none')
call <sid>hi('cFormat', s:voidSteel, s:none, 'none')
call <sid>hi('cMulti', s:voidSteel, s:none, 'none')
call <sid>hi('cNumbers', s:voidSteel, s:none, 'none')
call <sid>hi('cOperator', s:voidSteel, s:none, 'none')
call <sid>hi('cSpecial', s:voidSteel, s:none, 'none')
call <sid>hi('cSpecialCharacter', s:voidSteel, s:none, 'none')
call <sid>hi('cStatement', s:voidSteel, s:none, 'none')
call <sid>hi('cStorageClass', s:voidSteel, s:none, 'none')
call <sid>hi('cString', s:voidSteel, s:none, 'none')
call <sid>hi('cStructure', s:voidSteel, s:none, 'none')
call <sid>hi('cType', s:voidSteel, s:none, 'none')

" C++
call <sid>hi('cppConstant', s:voidSteel, s:none, 'none')
call <sid>hi('cppFormat', s:voidSteel, s:none, 'none')
call <sid>hi('cppMulti', s:voidSteel, s:none, 'none')
call <sid>hi('cppNumbers', s:voidSteel, s:none, 'none')
call <sid>hi('cppOperator', s:voidSteel, s:none, 'none')
call <sid>hi('cppSpecial', s:voidSteel, s:none, 'none')
call <sid>hi('cppSpecialCharacter', s:voidSteel, s:none, 'none')
call <sid>hi('cppStatement', s:voidSteel, s:none, 'none')
call <sid>hi('cppStorageClass', s:voidSteel, s:none, 'none')
call <sid>hi('cppString', s:voidSteel, s:none, 'none')
call <sid>hi('cppStructure', s:voidSteel, s:none, 'none')
call <sid>hi('cppType', s:voidSteel, s:none, 'none')

" CSS
call <sid>hi('cssAttr', s:voidSteel, s:none, 'none')
call <sid>hi('cssAttrRegion', s:voidSteel, s:none, 'none')
call <sid>hi('cssBraces', s:voidSteel, s:none, 'none')
call <sid>hi('cssBrowserPrefix', s:voidSteel, s:none, 'none')
call <sid>hi('cssClassName', s:voidSteel, s:none, 'none')
call <sid>hi('cssClassNameDot', s:voidSteel, s:none, 'none')
call <sid>hi('cssClassSelectorDot', s:voidSteel, s:none, 'none')
call <sid>hi('cssColor', s:voidSteel, s:none, 'none')
call <sid>hi('cssCommonAttr', s:voidSteel, s:none, 'none')
call <sid>hi('cssCustomProperty', s:voidSteel, s:none, 'none')
call <sid>hi('cssDefinition', s:voidSteel, s:none, 'none')
call <sid>hi('cssFunction', s:voidSteel, s:none, 'none')
call <sid>hi('cssFunctionName', s:voidSteel, s:none, 'none')
call <sid>hi('cssIdentifier', s:voidSteel, s:none, 'none')
call <sid>hi('cssImportant', s:voidSteel, s:none, 'none')
call <sid>hi('cssInclude', s:voidSteel, s:none, 'none')
call <sid>hi('cssMedia', s:voidSteel, s:none, 'none')
call <sid>hi('cssMediaBlock', s:voidSteel, s:none, 'none')
call <sid>hi('cssProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssGeneratedContentProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssTextProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssAnimationProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssUIProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssTransformProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssTransitionProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssPrintProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssPositioningProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssBoxProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssFontDescriptorProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssFlexibleBoxProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssBorderOutlineProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssBackgroundProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssMarginProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssListProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssTableProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssFontProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssPaddingProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssDimensionProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssRenderProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssColorProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssGeneratedContentProp', s:voidSteel, s:none, 'none')
call <sid>hi('cssPropDefinition', s:voidSteel, s:none, 'none')
call <sid>hi('cssPseudoClass', s:voidSteel, s:none, 'none')
call <sid>hi('cssPseudoClassId', s:voidSteel, s:none, 'none')
call <sid>hi('cssPseudoClassLang', s:voidSteel, s:none, 'none')
call <sid>hi('cssSelectorOperator', s:voidSteel, s:none, 'none')
call <sid>hi('cssTagName', s:voidSteel, s:none, 'none')
call <sid>hi('cssURL', s:voidSteel, s:none, 'none')
call <sid>hi('cssUnitDecorators', s:voidSteel, s:none, 'none')
call <sid>hi('cssUnits', s:voidSteel, s:none, 'none')
call <sid>hi('cssValueLength', s:voidSteel, s:none, 'none')
call <sid>hi('cssValueNumber', s:voidSteel, s:none, 'none')
call <sid>hi('cssValueKeyword', s:voidSteel, s:none, 'none')
call <sid>hi('cssVendor', s:voidSteel, s:none, 'none')

" HTML
call <sid>hi('htmlArg', s:voidSteel, s:none, 'none')
call <sid>hi('htmlEndTag', s:voidSteel, s:none, 'none')
call <sid>hi('htmlSpecialChar', s:voidSteel, s:none, 'none')
call <sid>hi('htmlSpecialTagName', s:voidSteel, s:none, 'none')
call <sid>hi('htmlTag', s:voidSteel, s:none, 'none')
call <sid>hi('htmlTagName', s:voidSteel, s:none, 'none')

" JavaScript
call <sid>hi('javaScript', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptFunction', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptIdentifier', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptMember', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptNull', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptNumber', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptNumber', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptParens', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptSpecial', s:voidSteel, s:none, 'none')
call <sid>hi('javaScriptStringS', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptArrayMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptArrayStaticMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptArrowFunc', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptAsyncFuncKeyword', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptAwaitFuncKeyword', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptBraces', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptBrackets', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptCacheMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptClassExtends', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptClassKeyword', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptClassName', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptClassSuperName', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptDOMElemAttrs', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptDOMEventMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptDOMNodeMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptDOMStorageMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptDateMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptDefault', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptDocNamedParamType', s:voidGray4, s:none, 'none')
call <sid>hi('javascriptDocNotation', s:voidGray4, s:none, 'none')
call <sid>hi('javascriptDocParamName', s:voidGray4, s:none, 'none')
call <sid>hi('javascriptDocParamType', s:voidGray4, s:none, 'none')
call <sid>hi('javascriptDocTags', s:voidGray4, s:none, 'none')
call <sid>hi('javascriptEndColons', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptExport', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptHeadersMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptIdentifierName', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptImport', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptLabel', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptLogicSymbols', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptMathStaticMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptObjectLabel', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptOperator', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptPropertyName', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptStringMethod', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptVariable', s:voidSteel, s:none, 'none')
call <sid>hi('javascriptYield', s:voidSteel, s:none, 'none')
call <sid>hi('jsArrowFunction', s:voidSteel, s:none, 'none')
call <sid>hi('jsClassDefinition', s:voidSteel, s:none, 'none')
call <sid>hi('jsClassKeyword', s:voidSteel, s:none, 'none')
call <sid>hi('jsDecorator', s:voidSteel, s:none, 'none')
call <sid>hi('jsDestructuringBlock', s:voidSteel, s:none, 'none')
call <sid>hi('jsExportDefault', s:voidSteel, s:none, 'none')
call <sid>hi('jsExtendsKeyword', s:voidSteel, s:none, 'none')
call <sid>hi('jsFuncArgs', s:voidSteel, s:none, 'none')
call <sid>hi('jsFuncCall', s:voidSteel, s:none, 'none')
call <sid>hi('jsFunction', s:voidSteel, s:none, 'none')
call <sid>hi('jsGlobalObjects', s:voidSteel, s:none, 'none')
call <sid>hi('jsModuleKeyword', s:voidSteel, s:none, 'none')
call <sid>hi('jsNull', s:voidSteel, s:none, 'none')
call <sid>hi('jsObjectBraces', s:voidSteel, s:none, 'none')
call <sid>hi('jsObjectKey', s:voidSteel, s:none, 'none')
call <sid>hi('jsObjectStringKey', s:voidSteel, s:none, 'none')
call <sid>hi('jsRegexpString', s:voidSteel, s:none, 'none')
call <sid>hi('jsReturn', s:voidSteel, s:none, 'none')
call <sid>hi('jsSpecial', s:voidSteel, s:none, 'none')
call <sid>hi('jsSuper', s:voidSteel, s:none, 'none')
call <sid>hi('jsTemplateBraces', s:voidSteel, s:none, 'none')
call <sid>hi('jsTemplateString', s:voidSteel, s:none, 'none')
call <sid>hi('jsThis', s:voidSteel, s:none, 'none')
call <sid>hi('jsVariableDef', s:voidSteel, s:none, 'none')

" JSX
call <sid>hi('jsxAttrib', s:voidSteel, s:none, 'none')
call <sid>hi('jsxAttributeBraces', s:voidSteel, s:none, 'none')
call <sid>hi('jsxCloseString', s:voidSteel, s:none, 'none')
call <sid>hi('jsxCloseTag', s:voidSteel, s:none, 'none')
call <sid>hi('jsxString', s:voidSteel, s:none, 'none')
call <sid>hi('jsxTag', s:voidSteel, s:none, 'none')
call <sid>hi('jsxTagName', s:voidSteel, s:none, 'none')

" Ruby
call <sid>hi('rubyBlockParameter', s:voidSteel, s:none, 'none')
call <sid>hi('rubyClass', s:voidSteel, s:none, 'none')
call <sid>hi('rubyClassVariable', s:voidSteel, s:none, 'none')
call <sid>hi('rubyConstant', s:voidSteel, s:none, 'none')
call <sid>hi('rubyControl', s:voidSteel, s:none, 'none')
call <sid>hi('rubyEscape', s:voidSteel, s:none, 'none')
call <sid>hi('rubyException', s:voidSteel, s:none, 'none')
call <sid>hi('rubyFunction', s:voidSteel, s:none, 'none')
call <sid>hi('rubyGlobalVariable', s:voidSteel, s:none, 'none')
call <sid>hi('rubyInclude', s:voidSteel, s:none, 'none')
call <sid>hi('rubyInstanceVariable', s:voidSteel, s:none, 'none')
call <sid>hi('rubyInterpolationDelimiter', s:none, s:none, 'none')
call <sid>hi('rubyOperator', s:voidSteel, s:none, 'none')
call <sid>hi('rubyPseudoVariable', s:voidSteel, s:none, 'none')
call <sid>hi('rubyRegexp', s:voidSteel, s:none, 'none')
call <sid>hi('rubyRegexpDelimiter', s:voidSteel, s:none, 'none')
call <sid>hi('rubyStringDelimiter', s:voidSteel, s:none, 'none')
call <sid>hi('rubySymbol', s:voidSteel, s:none, 'none')

" Ruby (Embedded)
call <sid>hi('erubyComment', s:voidGray3, s:none, 'none')
call <sid>hi('erubyDelimiter', s:none, s:none, 'none')
call <sid>hi('erubyRailsMethod', s:voidSteel, s:none, 'none')

" Ruby on Rails
call <sid>hi('rubyRailsARAssociationMethod', s:voidSteel, s:none, 'none')
call <sid>hi('rubyRailsARMethod', s:voidSteel, s:none, 'none')
call <sid>hi('rubyRailsMethod', s:voidSteel, s:none, 'none')
call <sid>hi('rubyRailsRenderMethod', s:voidSteel, s:none, 'none')
call <sid>hi('rubyRailsUserClass', s:voidSteel, s:none, 'none')

" XML
call <sid>hi('xmlAttrib', s:voidSteel, s:none, 'none')
call <sid>hi('xmlEndTag', s:voidSteel, s:none, 'none')
call <sid>hi('xmlTag', s:voidSteel, s:none, 'none')
call <sid>hi('xmlTagName', s:voidSteel, s:none, 'none')

" YAML
call <sid>hi('yamlAlias', s:voidSteel, s:none, 'none')
call <sid>hi('yamlAnchor', s:voidSteel, s:none, 'none')
call <sid>hi('yamlDocumentHeader', s:voidSteel, s:none, 'none')
call <sid>hi('yamlKey', s:voidSteel, s:none, 'none')

" TeX
" call <sid>hi('texMath', s:voidSpecial1, s:none, 'none')
" hi link texBoldStyle texMath
" hi link texEmphStyle texMath
" hi link texError Question
" hi link texItalStyle texMath
" hi link texMath texMath
" hi link texMathText texMath
" hi link texMathZone texMath
" hi link texStatement texMath
" hi link texTypeStyle texMath
" hi link texSpecialChar texMath
" hi link texDelimiter texMath
" hi link texRefZone texMath

" Plugins
" -------

" todo.txt
call <sid>hi('TodoContext', s:voidSteel, s:none, 'none')
call <sid>hi('TodoDate', s:voidSteel, s:none, 'none')
call <sid>hi('TodoDone', s:voidGray3, s:none, 'none')
call <sid>hi('TodoPriorityA', s:voidSteel, s:none, 'none')
call <sid>hi('TodoPriorityB', s:voidSteel, s:none, 'none')
call <sid>hi('TodoPriorityC', s:voidSteel, s:none, 'none')
call <sid>hi('TodoProject', s:voidSteel, s:none, 'none')

" Buftabline
call <sid>hi('BufTabLineActive', s:voidSteel, s:voidGray2, 'none')
call <sid>hi('BufTabLineCurrent', s:voidBlack1, s:voidGray4, 'none')
call <sid>hi('BufTabLineFill', s:voidBlack1, s:voidBlack1, 'none')
call <sid>hi('BufTabLineHidden', s:voidGray3, s:voidBlack2, 'none')

" fzf
" let $FZF_DEFAULT_OPTS = '--color=dark,bg:234,fg:252,hl:220,hl+:220' .  $FZF_DEFAULT_OPTS

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment', '', 'regular'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement', '', 'regular'],
  \ }
