#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "Python"

brew_install "bpython" "bpython"
brew_install "ipython" "ipython"
brew_install "pycparser" "pycparser"
brew_install "pyenv" "pyenv"
brew_install "pyenv-virtualenvwrapper" "pyenv-virtualenvwrapper"
brew_install "python-setuptools" "python-setuptools"
brew_install "python-typing-extensions" "python-typing-extensions"
brew_install "Python 3.12" "python@3.12"
brew_install "virtualenvwrapper" "virtualenvwrapper"
brew_install "pip-completion" "pip-completion"
brew_install "pipenv" "pipenv"
brew_install "pipx" "pipx"
brew_install "virtualenvwrapper" "virtualenvwrapper"
brew_install "brotli" "brotli"
brew_install "pillow" "pillow"
brew_install "pip-tools" "pip-tools"
brew_install "pipdeptree" "pipdeptree"
brew_install "pipenv" "pipenv"
