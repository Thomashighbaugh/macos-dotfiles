#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "utils.sh" &&
	cd ..

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
brew_install "stow" "stow"
create_symlinks() {
	echo "Creating symbolic links"
	# Make directories in .config if they don't exist
	mkdir -p "$HOME/.config/bat"
	mkdir -p "$HOME/.config/bat/themes"
	mkdir -p "$HOME/.config/htop"
	local -r files=(
		".zshrc"
		".zshenv"
		".bashrc"
		".bash_profile"
		".inputrc"
		".config"
		".config/bat/config"
		".config/bat/themes/*"
		".config/htop/htoprc"
		".config/ripgrep/rc"
	)
	local -r source_dir="$HOME/dotfiles/files"
	local -r target_dir="$HOME"
	for file in "${files[@]}"; do
		ln -svf "$source_dir/$file" "$target_dir/$file"
	done
	print_success "Symbolic links created"
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	print_info "• Create symbolic links"
	create_symlinks
}

main
