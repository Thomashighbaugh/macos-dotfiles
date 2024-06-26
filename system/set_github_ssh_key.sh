#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
	. "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_ssh_configs() {

	printf "%s\n" \
		"Host github.com" \
		"  IdentityFile $1" \
		"  LogLevel ERROR" >>~/.ssh/config

	print_result $? "Add SSH configs"

}

copy_public_ssh_key_to_clipboard() {

	pbcopy <"$1"
	print_result $? "Copy public SSH key to clipboard"
}

generate_ssh_keys() {

	ask "Please provide an email address: " && printf "\n"
	ssh-keygen -t rsa -b 4096 -C "$(get_answer)" -f "$1"

	print_result $? "Generate SSH keys"

}

open_github_ssh_page() {

	declare -r GITHUB_SSH_URL="https://github.com/settings/ssh"

	if cmd_exists "open"; then
		open "$GITHUB_SSH_URL"
	else
		print_warning "Please add the public SSH key to GitHub ($GITHUB_SSH_URL)"
	fi

}

set_github_ssh_key() {

	local sshKeyFileName="$HOME/.ssh/github"

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# If there is already a file with that
	# name, generate another, unique, file name.

	if [ -f "$sshKeyFileName" ]; then
		sshKeyFileName="$(mktemp -u "$HOME/.ssh/github_XXXXX")"
	fi

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	generate_ssh_keys "$sshKeyFileName"
	add_ssh_configs "$sshKeyFileName"
	copy_public_ssh_key_to_clipboard "${sshKeyFileName}.pub"
	open_github_ssh_page
	test_ssh_connection &&
		rm "${sshKeyFileName}.pub"

}

test_ssh_connection() {

	while true; do

		ssh -T git@github.com &>/dev/null
		[ $? -eq 1 ] && break

		sleep 5

	done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

	print_info "• Set up GitHub SSH keys"

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	if ! is_git_repository; then
		print_error "Not a Git repository"
		exit 1
	fi

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	ssh -T git@github.com &>/dev/null

	if [ $? -ne 1 ]; then
		set_github_ssh_key
	fi

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	print_result $? "Set up GitHub SSH keys"

}

main
