// Thunderbird user.js
// ===================
//
// Most preferences from Firefox's user.js are valid Thunderbird
// preferences too.  So here, in this file, we only keep
// Thunderbird-specific preferences.  Firefox's user.js will be merged
// with this file by the setup.sh script.
//
// Resources
// ---------
//
// https://www.betterbird.eu/expert-tips/
// https://github.com/HorlogeSkynet/thunderbird-user.js
// https://github.com/arkenfox/user.js/issues/646#issuecomment-466434739
// https://gitlab.torproject.org/legacy/gitolite/torbirdy/-/blob/HEAD/components/torbirdy.js
//

// Prevent hostname leaks.
user_pref("mail.smtpserver.default.hello_argument", "[192.168.1.1]");

// Use plain text.
user_pref("mail.identity.default.compose_html", false);
user_pref("mail.html_compose", false);
user_pref("mail.default_html_action", 1);

// Don't hardwrap text.
user_pref("mailnews.wraplength", 0);

// Don't ask to be the default client.
user_pref("mail.shell.checkDefaultClient", false);
user_pref("mail.shell.checkDefaultMail", false);

// Don't replace sender's name/email with anything else.
user_pref("mail.showCondensedAddresses", false);

// Disable startpage.
user_pref("mailnews.start_page.enabled", false);

// Image permissions.
// 1 = allow all images to load, regardless of origin.
// 2 = block all images from loading.
// 3 = prevent third-party images from loading
user_pref("permissions.default.image", 2);

// Disable remote content loading.
user_pref("mailnews.message_display.disable_remote_image", true);

// Use system titlebar.
user_pref("mail.tabs.drawInTitlebar", false);

// Always keep threads open (i.e., uncollapsed).
user_pref("mailnews.thread_expand_all", true);

// Custom date/time formatting.
// https://unicode.org/reports/tr35/tr35-dates.html#Date_Field_Symbol_Table
// https://enterprise.thunderbird.net/manage-updates-policies-and-customization/thunderbird-preferences-enterprise/customize-thunderbirds-date-and-time-formats
// 1 = short date, 2 = long date, 3 = year/month separated by slash, 4 = just day.
// Dates in messages from this week, e.g., "Fri 10:23 AM".
user_pref("mail.ui.display.dateformat.thisweek", 4);

// Always display the timezone of sender.
user_pref("mailnews.display.date_senders_timezone", true);

// Internal custom pref to ensure that we've reach the end without syntax errors.
user_pref("_user.js.parrot", "SUCCESS: Thunderbird is not dead, he's, he's restin'!");
