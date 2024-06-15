#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• Media Tools"

brew_install "FFmpeg" "ffmpeg"
brew_install "Cleanshot X" "cleanshot" "--cask"
brew_install "yt-dlp" "yt-dlp"
brew_install "VLC" "vlc" "--cask"
brew_install "Spotify" "spotify" "--cask"
brew_install "Pango" "pango"
brew_install "Pandoc" "pandoc"
brew_install "FLAC" "flac"
brew_install "Cairo" "cairo"
brew_install "gdk-pixbuf" "gdk-pixbuf"
brew_install "ghostscript" "ghostscript"
brew_install "giflib" "giflib"
brew_install "GraphicsMagick" "graphicsmagick"
brew_install "iconsur" "iconsur"
brew_install "icoutils" "icoutils"
brew_install "imagemagick" "imagemagick"
brew_install "imgproxy"  "imgproxy"

brew_install "jpeg-turbo" "jpeg-turbo"
brew_install "jpeg-xl" "jpeg-xl"
brew_install "graphite2" "graphite2"

brew_install "libpng" "libpng"
brew_install "libtiff" "libtiff"
brew_install "libtool" "libtool"
brew_install "libxml2" "libxml2"
brew_install "pngquant" "pngquant"
brew_install "poppler" "poppler"
brew_install "webp" "webp"
brew_install "webp-quicklook" "webp-quicklook"
brew_install "webp-pixbuf-loader" "webp-pixbuf-loader"
brew_install "gifcapture" "gifcapture" "--cask"
brew_install "gifox" "gifox" "--cask"
brew_install "gifski" "gifski" "--cask"
brew_install "gifsicle" "gifsicle" "--cask"
brew_install "giflib" "giflib"
brew_install "imagemagick" "imagemagick"
brew_install "optipng" "optipng"
brew_install "pngcrush" "pngcrush"
brew_install "oxipng" "oxipng"
brew_install "pngpcheck" "pngcheck"
brew_install "imageoptim-cli" "imageoptim-cli"
brew_instal "jppeg-turbo" "jpeg"
bbrew_install "gmic" "gmic"


