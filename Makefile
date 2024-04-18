DOTFILES=${HOME}/dotfiles

all: brew skhd bat bat bpytop htop kitty yabai starship ripgrep zsh

brew:
	brew bundle --file="$(DOTFILES)/extra/homebrew/Brewfile"
skhd:
	ln -svf "$(DOTFILES)/files/.config/skhd/skhdrc" "$(HOME)/.skhdrc"
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
yabai:
	ln -svf "$(DOTFILES)/files/.config/yabai/yabairc" "$(HOME)/.yabairc"
starship:
	ln -svf "$(DOTFILES)/files/.config/starship.toml" "$(HOME)/.config/starship.toml"
ripgrep:
	mkdir -p "$(HOME)/.config/ripgrep" 
	ln -svf "$(DOTFILES)/files/.config/ripgrep/rc" "$(HOME)/.config/ripgrep/rc"
zsh:
	ln -svf "$(DOTFILES)/files/zshrc" "$(HOME)/.zshrc"
	curl -sS https://starship.rs/install.sh | sh


.PHONY: all brew skhd bat htop bpytop kitty yabai starship ripgrep zsh 
