#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• NeoVim"

git clone https://github.com/Thomashighbaugh/nvim-forge ~/.config/nvim

brew_install "neovim" "neovim"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "Vim Plugins"

$(resolve_bin "nvim") -E -s <<-EOF
	    :source ~/.vimrc
	    :PlugInstall
	    :PlugClean
	    :qa
EOF

print_success "Vim plugins installed"
