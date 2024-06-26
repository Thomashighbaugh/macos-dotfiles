#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• CTF Tools"

brew_install "aircrack-ng" "aircrack-ng"
brew_instll "cryptography" "cryptography"
brew_install "aircrack-ng" "aircrack-ng"
brew_install "bfg" "bfg"
brew_install "binutils" "binutils"
brew_install "binwalk" "binwalk"
brew_install "cifer" "cifer"
brew_install "dex2jar" "dex2jar"
brew_install "dns2tcp" "dns2tcp"
brew_install "fcrackzip" "fcrackzip"
brew_install "foremost" "foremost"
brew_install "hashpump" "hashpump"
brew_install "hydra" "hydra"
brew_install "john" "john"
brew_install "knock" "knock"
brew_install "netpbm" "netpbm"
brew_install "nmap" "nmap"
brew_install "pngcheck" "pngcheck"
brew_install "socat" "socat"
brew_install "sqlmap" "sqlmap"
brew_install "tcpflow" "tcpflow"
brew_install "tcpreplay" "tcpreplay"
brew_install "tcptrace" "tcptrace"
brew_install "ucspi-tcp" "ucspi-tcp"
brew_install "xpdf" "xpdf"
brew_install "xz" "xz"
brew_install "zstd" "zstd"
brew_install "lz4" "lz4"
brew_install "lzo" "lzo"
brew_install "inetutils" "inetutils"
brew_install "openssl@3" "openssl@3"

brew_install "tor-browser" "tor-browser" "--cask"
