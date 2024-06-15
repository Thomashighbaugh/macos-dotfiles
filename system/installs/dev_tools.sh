#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Development Tools"

# CLI Tools
# brew_install "Docker" "docker" "--cask"
#b brew_install "Docker Compose" "docker-compose"
brew_install "HTTP Server" "http-server"
brew_install "Redis" "redis"
brew_install "PostgreSQL" "postgresql@14"
brew_install "PHP" "php"
brew_install "MailHog" "mailhog"
brew_install "Minio" "minio/stable/minio"
brew_install "Minio Client" "minio/stable/mc"
brew_install "LuaRocks" "luarocks"
brew_install "bash" "bash"
brew_install "bash-completion" "bash-completion"
brew_install "bat" "bat"
brew_install "composer" "composer"
brew_install "ediitorconfig" "editorconfig"
brew_install "mkcert" "mkcert"

# GUI Tools
brew_install "Visual Studio Code" "visual-studio-code" "--cask"
# brew_install "Jetbrains Toolbox" "jetbrains-toolbox" "--cask"
brew_install "iTerm 2" "iterm2@beta" "--cask"
brew_install "MacDown" "macdown" "--cask"
brew_install "devutils" "devutils" "--cask"
