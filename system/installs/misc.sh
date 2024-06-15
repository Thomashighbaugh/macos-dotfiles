#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Miscellaneous"

brew_install "BitWarden" "bitwarden" "--cask"
brew_install "MacForge" "macforge" "--cask"
brew_install "macfuse" "macfuse" "--cask"
brew_install "Dropbox" "dropbox@beta" "--cask"
brew_install "Alt Tab" "alt-tab" "--cask"
brew_install "Hidden Bar" "hiddenbar" "--cask"
brew_install "Transmission" "transmission@beta" "--cask"
brew_install "Discord" "discord" "--cask"
brew_install "Telegram" "telegram-desktop" "--cask"
