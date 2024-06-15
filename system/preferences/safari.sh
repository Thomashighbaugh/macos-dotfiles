#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Safari"

execute "defaults write com.apple.Safari AutoOpenSafeDownloads -bool false" \
	"Disable opening 'safe' files automatically"

execute "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true" \
	"Set backspace key to go to the previous page in history"

execute "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
         defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
         defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true" \
	"Enable the 'Develop' menu and the 'Web Inspector'"

execute "defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false" \
	"Set search type to 'Contains' instead of 'Starts With'"

execute "defaults write com.apple.Safari HomePage -string 'about:blank'" \
	"Set home page to 'about:blank'"

execute "defaults write com.apple.Safari IncludeInternalDebugMenu -bool true" \
	"Enable 'Debug' menu"

execute "defaults write com.apple.Safari ShowFavoritesBar -bool false" \
	"Hide bookmarks bar by default"

execute "defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true" \
	"Show the full URL in the address bar"

execute "defaults write com.apple.Safari SuppressSearchSuggestions -bool true && \
         defaults write com.apple.Safari UniversalSearchEnabled -bool false" \
	"Don’t send search queries to Apple"

execute "defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true" \
	"Enable continuous spellchecking"
execute "defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false" \
	"Disable auto-correct"

execute "defaults write -g WebKitDeveloperExtras -bool true" \
	"Add a context menu item for showing the 'Web Inspector' in web views"

execute "defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true && \
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true" \
	"Press Tab to highlight each item on a web page"

execute "defaults write com.apple.Safari ShowSidebarInTopSites -bool false" \
	"Hide Safari’s sidebar in Top Sites"

execute "defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2" \ 
"Disable Safari’s thumbnail cache for History and Top Sites"
execute "defaults write com.apple.Safari AutoFillFromAddressBook -bool false && \
defaults write com.apple.Safari AutoFillPasswords -bool false && \
defaults write com.apple.Safari AutoFillCreditCardData -bool false && \
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false" \
	"Disable AutoFill"
execute "defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
" \
  "Block Popup Windows"

execute "defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true" \
  "Enable Do Not Track"

execute "defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25" \
	"Disable the standard delay in rendering a web page."

killall "Safari" &>/dev/null
