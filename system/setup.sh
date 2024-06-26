#!/usr/bin/env bash

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

	# Ensure that the following actions
	# are made relative to this file's path.

	cd "$(dirname "${BASH_SOURCE[0]}")" ||
		exit 1

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Load utils

	if [ -x "utils.sh" ]; then
		. "utils.sh" || exit 1
	fi

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Ensure the OS is macOS and
	# it's above the required version.

	verify_os ||
		exit 1

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	ask_for_sudo

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	sudo spctl --master-disable

	./debloat.sh

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	./set_hostname.sh

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	./create_directories.sh

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	./installs/main.sh

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	./preferences/main.sh

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	./restart.sh

}

main "$@"
