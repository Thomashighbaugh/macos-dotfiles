DOTFILES=${HOME}/dotfiles

all: brew  bat bat bpytop htop kitty  starship ripgrep zsh macos

brew:
	brew bundle --file="$(DOTFILES)/extra/homebrew/Brewfile"
bat:
	bat cache --build
	mkdir -p "$(HOME)/.config/bat"
	ln -svf "$(DOTFILES)/files/.config/bat/config" "$(HOME)/.config/bat/config"
bpytop:
	mkdir -p "$(HOME)/.config/bpytop"
	ln -svf "$(DOTFILES)/files/.config/bpytop/bpytop.conf" "$(HOME)/.config/bpytop/bpytop.conf"
htop:
	mkdir -p "$(HOME)/.config/htop"
	ln -svf "$(DOTFILES)/files/.config/htop/htop.conf" "$(HOME)/.config/htop/htop.conf"
kitty: 
	mkdir -p "$(HOME)/.config/kitty"
	ln -svf "$(DOTFILES)/files/.config/kitty/kitty.conf" "$(HOME)/.config/kitty/kitty.conf"
starship:
	ln -svf "$(DOTFILES)/files/.config/starship.toml" "$(HOME)/.config/starship.toml"
ripgrep:
	mkdir -p "$(HOME)/.config/ripgrep" 
	ln -svf "$(DOTFILES)/files/.config/ripgrep/rc" "$(HOME)/.config/ripgrep/rc"
macos:
	bash "${DOTFILES}/system/setup.sh"
zsh:
	ln -svf "$(DOTFILES)/files/zshrc" "$(HOME)/.zshrc"
	curl -sS https://starship.rs/install.sh | sh


.PHONY: all brew bat htop bpytop kitty macos starship ripgrep zsh 
