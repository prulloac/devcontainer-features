#!/bin/bash -i

set -e

PRE_COMMIT_VERSION="${VERSION:-"latest"}"

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.5"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/homebrew-package:1" \
    --option package='pre-commit' --option version="$PRE_COMMIT_VERSION"

echo 'Done!'
