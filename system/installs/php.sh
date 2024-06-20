#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "composer" "composer"
brew_install "php" "php"
brew_install "php@8.1" "php@8.1"
brew_install "phpbrew" "phpbrew"
