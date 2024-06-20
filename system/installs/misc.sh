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
brew_install "dmg2img" "dmg2img"
brew_install "aspell" "aspell"
brew_install "pinentry" "pinentry"
brew_install "pinentry-mac" "pinentry-mac"
brew_install "alt-tab" "alt-tab" "--cask"
brew_install "Discord" "discord" "--cask"
brew_install "hiddenbar" "hiddenbar" "--cask"
brew_install "macforge" "macforge" "--cask"
brew_install "macfuse" "macfuse" "--cask"
brew_install "maczip" "maczip" "--cask"
brew_install "opencore-configurator" "opencore-configurator" "--cask"
brew_install "r-name" "r-name" "--cask"
brew_install "telegram-desktop" "telegram-desktop" "--cask"
brew_install "transmission@nightly" "transmission@nightly" "--cask"
