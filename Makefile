DOTFILES=${HOME}/dotfiles

all: macos 

macos:
	bash "${DOTFILES}/system/setup.sh"


.PHONY: all macos 
