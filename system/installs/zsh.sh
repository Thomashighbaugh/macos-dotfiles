#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
  . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_default_shell_to_zsh() {

  declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zshrc.local"

  local configs=""
  local pathConfig=""

  local shellPath=""
  local brewPrefix=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Try to get the path of the `Bash`
  # version installed through `Homebrew`.

  brewPrefix="$(brew_prefix)" ||
    return 1

  pathConfig="PATH=\"$brewPrefix/bin:\$PATH\""
  configs="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

$pathConfig
export PATH
"

  shellPath="$brewPrefix/bin/zsh"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Add the path of the `Zsh` version installed through `Homebrew`
  # to the list of login shells from the `/etc/shells` file.
  #
  # This needs to be done because applications use this file to
  # determine whether a shell is valid (e.g.: `chsh` consults the
  # `/etc/shells` to determine whether an unprivileged user may
  # change the login shell for her own account).
  #
  # http://www.linuxfromscratch.org/blfs/view/7.4/postlfs/etcshells.html

  if ! grep "$shellPath" </etc/shells &>/dev/null; then
    execute \
      "printf '%s\n' '$shellPath' | sudo tee -a /etc/shells" \
      "Zsh (add '$shellPath' in '/etc/shells')" ||
      return 1
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  chsh -s "$shellPath" &>/dev/null
  print_result $? "Zsh (use latest version)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # If needed, add the necessary configs in the
  # local shell configuration file.

  if ! grep "^$pathConfig" <"$LOCAL_SHELL_CONFIG_FILE" &>/dev/null; then
    execute \
      "printf '%s' '$configs' >> $LOCAL_SHELL_CONFIG_FILE \
                && . $LOCAL_SHELL_CONFIG_FILE" \
      "Zsh (update $LOCAL_SHELL_CONFIG_FILE)"
  fi

}

# #install_zsh_plugin() {
#   local git_url=$1
#   local plugin_name=$2
#   local plugin_folder="$HOME/.config/zsh/.oh-my-zsh/custom/plugins/${plugin_name}"
#   if [ ! -d "${plugin_folder}" ]; then
#     echo "[-] installing zsh plugin ${plugin_name}"
#     git clone "${git_url}" "${plugin_folder}"
#   else
#     echo "[-] zsh plugin ${plugin_name} already exists => skipping"
#   fi
# }

zsh() {

  print_info "• Shell Configuration"

  brew_install "zsh" "zsh" &&
    change_default_shell_to_zsh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_info "ZSH Plugin Installations"

  brew_install "zsh-async" "zsh-async"
  brew_install "zsh-autocomplete" "zsh-autocomplete"
  brew_install "zsh-autopair" "zsh-autopair"
  brew_install "zsh-autosuggestions" "zsh-autosuggestions"
  brew_install "zsh-completions" "zsh-completions"
  brew_install "zsh-fast-syntax-highlighting" "zsh-fast-syntax-highlighting"
  brew_install "zsh-history-substring-search" "zsh-history-substring-search"
  brew_install "zsh-navigation-tools" "zsh-navigation-tools"
  brew_install "zsh-you-should-use" "zsh-you-should-use"
  brew_install "pure" "pure"
  brew_install "zsh-autosuggestions" "zsh-autosuggestions"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

zsh
