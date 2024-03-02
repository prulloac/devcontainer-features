#!/bin/bash -i

set -e

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

curl -fsSL https://bun.sh/install | bash 

echo '# bun' >> /etc/profile.d/bun.sh
echo 'export BUN_INSTALL="$HOME/.bun"' >> /etc/profile.d/bun.sh
echo 'export PATH=$BUN_INSTALL/bin:$PATH' >> /etc/profile.d/bun.sh

echo 'Done!'
