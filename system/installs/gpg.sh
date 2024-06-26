#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• GPG"

brew_install "GPG" "gpg"
brew_install "Pinentry" "pinentry-mac"
brew_install "GPGme" "gpgme"
brew_install "libgpg-error" "libgpg-error"
