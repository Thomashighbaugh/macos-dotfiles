#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Git"

brew_install "Git" "git"
brew_install "GitHub CLI" "gh"
brew_install "GitArchiveAll" "git-archive-all"
brew_install "GitFilterRepo" "git-filter-repo"
brew_install "GitFixup" "git-fixup"
brew_install "GitGrab" "git-grab"
brew_install "GitMachete" "git-machete"
brew_install "GitSizer" "git-sizer"
brew_install "GitTrim" "git-trim"
brew_install "github-keygen" "github-keygen"
brew_install "Gitlint" "gitlint"
brew_install "git-credential-manager" "git-credential-manager" "--cask"
brew_install "git-it" "git-it" "--cask"
