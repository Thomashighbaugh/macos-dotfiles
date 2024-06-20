#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Rust"

if type rustc >/dev/null 2>&1; then
	print_info "Rust already installed => skipping"
else
	execute "curl https://sh.rustup.rs -sSf | sh -s -- -y" \
		"Rust"
fi
brew_install "c2rust" "c2rust"
brew_install "cargo-all" "cargo-all"
brew_install "cargo-binutils" "cargo-binutils"
brew_install "cargo-bundle" "cargo-bundle"
brew_install "cargo-crev" "cargo-crev"
brew_install "cargo-deny" "cargo-deny"
brew_install "cargo-deps" "cargo-deps"
brew_install "cargo-edit" "cargo-edit"
brew_install "cargo-fuzz" "cargo-fuzz"
brew_install "cargo-generate" "cargo-generate"
brew_install "cargo-instruments" "cargo-instruments"
brew_install "cargo-llvm-cov" "cargo-llvm-cov"
brew_install "cargo-llvm-lines" "cargo-llvm-lines"
brew_install "cargo-make" "cargo-make"
brew_install "cargo-sweep" "cargo-sweep"
brew_install "cargo-udeps" "cargo-udeps"
brew_install "cargo-watch" "cargo-watch"
brew_install "rust-analyzer" "rust-analyzer"
brew_install "rust-parallel" "rust-parallel"
brew_install "rustc-completion" "rustc-completion"
brew_install "rustscan" "rustscan"
