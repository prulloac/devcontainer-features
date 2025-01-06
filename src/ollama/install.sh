#!/bin/bash -i

set -e

PULL=${PULL:-""}

# Checks if packages are installed and installs them if not
check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

# make sure we have curl
check_packages ca-certificates curl

curl -fsSL https://ollama.com/install.sh | sh

# Make sure it can run
ollama --version

# Save requested models for later. They can't be installed now because the user may be incorrect.
mkdir -p "/usr/local/share/ollama"
echo "$PULL" | tr ',' '\n' > "/usr/local/share/ollama/models.txt"
cat << "EOF" > "/usr/local/share/ollama/init.sh"
#!/bin/sh
set -e
echo "Pulling models" 1>&2
# Ollama should already be running
cat /usr/local/share/ollama/models.txt | xargs -I % sh -c "ollama pull %"
EOF
chmod +x "/usr/local/share/ollama/init.sh"

echo 'Done!'
