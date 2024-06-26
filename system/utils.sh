#!/usr/bin/env bash

verify_os() {

  declare -r MINIMUM_MACOS_VERSION="10.10"

  local os_name="$(get_os)"
  local os_version="$(get_os_version)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check if the OS is `macOS` and
  # it's above the required version.

  if [ "$os_name" == "macos" ]; then

    if is_supported_version "$os_version" "$MINIMUM_MACOS_VERSION"; then
      return 0
    else
      printf "Sorry, this script is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
    fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  else
    printf "Sorry, this script is intended only for macOS"
  fi

  return 1

}

answer_is_yes() {
  [[ $REPLY =~ ^[Yy]$ ]] &&
    return 0 ||
    return 1
}

ask() {
  print_question "$1"
  read -r
}

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -r -n 1
  printf "\n"
}

ask_for_sudo() {

  sudo -v &>/dev/null

  # Update existing `sudo` time stamp
  # until this script has finished.
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &>/dev/null &
}

cmd_exists() {
  command -v "$1" &>/dev/null
}

kill_all_subprocesses() {

  local i=""

  for i in $(jobs -p); do
    kill "$i"
    wait "$i" &>/dev/null
  done

}

execute() {

  local -r CMDS="$1"
  local -r MSG="${2:-$1}"
  local -r TMP_FILE="$(mktemp /tmp/XXXXX)"

  local exitCode=0
  local cmdsPID=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # If the current process is ended,
  # also end all its subprocesses.

  set_trap "EXIT" "kill_all_subprocesses"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Execute commands in background
  # shellcheck disable=SC2261

  eval "$CMDS" \
    &>/dev/null \
    2>"$TMP_FILE" &

  cmdsPID=$!

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Show a spinner if the commands
  # require more time to complete.

  show_spinner "$cmdsPID" "$CMDS" "$MSG"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait for the commands to no longer be executing
  # in the background, and then get their exit code.

  wait "$cmdsPID" &>/dev/null
  exitCode=$?

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Print output based on what happened.

  print_result $exitCode "$MSG"

  if [ $exitCode -ne 0 ]; then
    print_error_stream <"$TMP_FILE"
  fi

  rm -rf "$TMP_FILE"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  return $exitCode

}

get_answer() {
  printf "%s" "$REPLY"
}

get_os() {

  local os=""
  local kernelName=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  kernelName="$(uname -s)"

  if [ "$kernelName" == "Darwin" ]; then
    os="macos"
  elif [ "$kernelName" == "Linux" ] &&
    [ -e "/etc/os-release" ]; then
    os="$(
      . /etc/os-release
      printf "%s" "$ID"
    )"
  else
    os="$kernelName"
  fi

  printf "%s" "$os"

}

get_os_version() {

  local os=""
  local version=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  os="$(get_os)"

  if [ "$os" == "macos" ]; then
    version="$(sw_vers -productVersion)"
  elif [ -e "/etc/os-release" ]; then
    version="$(
      . /etc/os-release
      printf "%s" "$VERSION_ID"
    )"
  fi

  printf "%s" "$version"

}

is_git_repository() {
  git rev-parse &>/dev/null
}

is_supported_version() {

  # shellcheck disable=SC2206
  declare -a v1=(${1//./ })
  # shellcheck disable=SC2206
  declare -a v2=(${2//./ })
  local i=""

  # Fill empty positions in v1 with zeros.
  for ((i = ${#v1[@]}; i < ${#v2[@]}; i++)); do
    v1[i]=0
  done

  for ((i = 0; i < ${#v1[@]}; i++)); do

    # Fill empty positions in v2 with zeros.
    if [[ -z ${v2[i]} ]]; then
      v2[i]=0
    fi

    if ((10#${v1[i]} < 10#${v2[i]})); then
      return 1
    elif ((10#${v1[i]} > 10#${v2[i]})); then
      return 0
    fi

  done

}

mkd() {
  if [ -n "$1" ]; then
    if [ -e "$1" ]; then
      if [ ! -d "$1" ]; then
        print_error "$1 - a file with the same name already exists!"
      else
        print_success "$1"
      fi
    else
      execute "mkdir -p $1" "$1"
    fi
  fi
}

print_error() {
  print_in_red "   [✖] $1 $2\n"
}

print_error_stream() {
  while read -r line; do
    print_error "↳ ERROR: $line"
  done
}

print_in_color() {
  printf "%b" \
    "$(tput setaf "$2" 2>/dev/null)" \
    "$1" \
    "$(tput sgr0 2>/dev/null)"
}

print_in_green() {
  print_in_color "$1" 2
}

print_in_purple() {
  print_in_color "$1" 5
}

print_in_red() {
  print_in_color "$1" 1
}

print_in_yellow() {
  print_in_color "$1" 3
}

print_info() {
  print_in_purple "\n $1\n\n"
}

print_question() {
  print_in_yellow "   [?] $1"
}

print_result() {

  if [ "$1" -eq 0 ]; then
    print_success "$2"
  else
    print_error "$2"
  fi

  return "$1"

}

print_success() {
  print_in_green "   [✔] $1\n"
}

print_warning() {
  print_in_yellow "   [!] $1\n"
}

set_trap() {

  trap -p "$1" | grep "$2" &>/dev/null ||
    trap '$2' "$1"

}

skip_questions() {

  while :; do
    case $1 in
    -y | --yes) return 0 ;;
    *) break ;;
    esac
    shift 1
  done

  return 1

}

show_spinner() {

  local -r FRAMES='/-\|'

  # shellcheck disable=SC2034
  local -r NUMBER_OR_FRAMES=${#FRAMES}

  local -r CMDS="$2"
  local -r MSG="$3"
  local -r PID="$1"

  local i=0
  local frameText=""

  # Display spinner while the commands are being executed.

  while kill -0 "$PID" &>/dev/null; do

    frameText="   [${FRAMES:i++%NUMBER_OR_FRAMES:1}] $MSG"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Print frame text.

    printf "%s" "$frameText"

    sleep 0.2

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Clear frame text.

    printf "\r"
  done
}

resolve_bin() {

  local command=""

  if cmd_exists "$1"; then
    command="$1"
  elif [[ "$(arch)" == "arm64" ]]; then
    command="/opt/homebrew/bin/$1"
  else
    command="/usr/local/bin/$1"
  fi

  echo "$command"
}

brewCommand=$(resolve_bin "brew")

brew_install() {

  declare -r ARGUMENTS="$3"
  declare -r FORMULA="$2"
  declare -r FORMULA_READABLE_NAME="$1"
  declare -r TAP_VALUE="$4"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # If `brew tap` needs to be executed,
  # check if it executed correctly.

  if [ -n "$TAP_VALUE" ]; then
    if ! brew_tap "$TAP_VALUE"; then
      print_error "$FORMULA_READABLE_NAME ('$brewCommand tap $TAP_VALUE' failed)"
      return 1
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Install the specified formula.

  # shellcheck disable=SC2086
  if $brewCommand list "$FORMULA" &>/dev/null; then
    print_success "$FORMULA_READABLE_NAME"
  else
    execute \
      "$brewCommand install $FORMULA $ARGUMENTS" \
      "$FORMULA_READABLE_NAME"
  fi

}

brew_prefix() {

  local path=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if path="$($brewCommand --prefix 2>/dev/null)"; then
    printf "%s" "$path"
    return 0
  else
    print_error "Homebrew (get prefix)"
    return 1
  fi

}

brew_tap() {
  $brewCommand tap "$1" &>/dev/null
}

brew_update() {

  execute \
    "$brewCommand update" \
    "Homebrew (update)"

}

brew_upgrade() {

  execute \
    "$brewCommand upgrade" \
    "Homebrew (upgrade)"

}

brew_external_sources() {
  execute \
    "$brewCommand tap homebrew/bundle" \
    "homebrew/bundle tapped"

  execute \
    "$brewCommand tap homebrew/services" \
    "homebrew/services tapped"
  execute \
    "$brewCommand tap camspiers/taps" \
    "camspiers/taps tapped"

  execute \
    "$brewCommand tap Rigellute/tap" \
    "Rigellute/tap tapped"

  execute \
    "$brewCommand tap Schniz/tap" \
    "Schniz/tap tapped"

  execute \
    "$brewCommand tap rlue/utils" \
    "rlue/utils tapped"

  execute \
    "$brewCommand tap koekeishiya/formulae" \
    "koekeishiya/formulae tapped"

  execute \
    "$brewCommand tap cmacrae/formulae" \
    "cmacrae/formulae tapped"

}
