#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

export PATH="~/.asdf/bin:$PATH"

print_info "• Node.js"

brew_install "nvm" "nvm"
mkdir ~/.nvm && zsh
nvm install node
npm i -g pnpm
pnpm i -g yarn
