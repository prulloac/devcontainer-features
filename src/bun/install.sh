#!/bin/bash -i

set -e

USE_NPM="${USENPM:-"false"}"


if [ "${USE_NPM}" = "false" ]; then

	check_packages() {
		if ! dpkg -s "$@" >/dev/null 2>&1; then
			if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
				echo "Running apt-get update..."
				apt-get update -y
			fi
			apt-get -y install --no-install-recommends "$@"
		fi
	}

	check_packages ca-certificates curl unzip

	export BUN_INSTALL=/usr/local
	curl -fsSL https://bun.sh/install | bash 

	echo '# bun' >> /etc/bash.bashrc
	echo 'export BUN_INSTALL="$HOME/.bun"' >> /etc/bash.bashrc
	echo 'export PATH=$BUN_INSTALL/bin:$PATH' >> /etc/bash.bashrc

	if [ -x "$(command -v zsh)" ]; then
		echo '# bun' >> /home/$_REMOTE_USER/.zshenv
		echo 'export BUN_INSTALL="$HOME/.bun"' >> /home/$_REMOTE_USER/.zshenv
		echo 'export PATH=$BUN_INSTALL/bin:$PATH' >> /home/$_REMOTE_USER/.zshenv
	fi

else
	source ./library_scripts.sh

	ensure_nanolayer nanolayer_location "v0.5.6"

	$nanolayer_location \
		install \
		devcontainer-feature \
		"ghcr.io/devcontainers/features/node:1"

	npm install --global bun

	echo '# bun' >> /etc/bash.bashrc
	echo 'export BUN_INSTALL="$HOME/.bun"' >> /etc/bash.bashrc
	echo 'export PATH=$BUN_INSTALL/bin:$PATH' >> /etc/bash.bashrc

	echo '# bun' >> /home/$_REMOTE_USER/.zshenv
	echo 'export BUN_INSTALL="$HOME/.bun"' >> /home/$_REMOTE_USER/.zshenv
	echo 'export PATH=$BUN_INSTALL/bin:$PATH' >> /home/$_REMOTE_USER/.zshenv

fi

echo 'Done!'
