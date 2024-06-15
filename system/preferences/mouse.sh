#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Mouse "

execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true && \
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 && \
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1" \
	"Trackpad: enable tap to click for this user and for the login screen"

execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2 && \
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && \
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1 && \
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true" \
	"Trackpad: map bottom right corner to right-click"

execute "defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false" \ 
"Disable Natural Scrolling"





killall "SystemUIServer" &>/dev/null
