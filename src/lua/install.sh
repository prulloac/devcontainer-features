#!/bin/bash -i

set -e

VERSION="${VERSION:-"5.4.7"}"
USE_APT="${USEAPT:-"false"}"


if [ "${USE_APT}" = "true" ]; then
    # Use apt to install lua
    # remove the patch from version semver, to keep only major.minor
    VERSION=$(echo $VERSION | cut -d. -f1,2)
	apt update -y
	apt install -y lua${VERSION}
else
    # build and install lua from source
	apt update -y
    apt install -y curl make gcc tar
    curl -L -R -O https://www.lua.org/ftp/lua-${VERSION}.tar.gz
    tar zxf lua-${VERSION}.tar.gz
    cd lua-${VERSION}
    make all test
    make all install
fi

echo 'Done!'
