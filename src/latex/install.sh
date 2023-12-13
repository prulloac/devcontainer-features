#!/bin/sh
set -e


SCHEME=${SCHEME:-"basic"}
PACKAGES=${PACKAGES:-""}

check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}


check_packages ca-certificates perl wget perl-modules libfontconfig1 fontconfig

cd /tmp # working directory of your choice
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz # or curl instead of wget
zcat < install-tl-unx.tar.gz | tar xf -
cd $(ls -d */ | grep install-tl-)
perl ./install-tl --no-interaction --scheme=$SCHEME

TEXLIVE_DIR=$(ls -d /usr/local/texlive/* | grep 20)
TEXLIVE_EXECUTABLES_DIR="$(ls -d $TEXLIVE_DIR/bin/*)"

# Install latex and latexmk
$TEXLIVE_EXECUTABLES_DIR/tlmgr install latex latex-bin latexmk

# Split $PACKAGES string into separate strings using comma as delimiter, trim the resulting strings after split, and install them
echo $PACKAGES | tr ',' '\n' | xargs -I % sh -c "$TEXLIVE_EXECUTABLES_DIR/tlmgr install %"


chmod -R 777 /usr/local/texlive/

echo "PATH=\"\$PATH:$TEXLIVE_EXECUTABLES_DIR\"" >> /etc/environment
ls $TEXLIVE_EXECUTABLES_DIR | xargs -I % ln -s $TEXLIVE_EXECUTABLES_DIR/% /usr/local/bin/%

# cleanup

rm -rf /var/lib/apt/lists/*
cd /tmp
rm -rf $(ls -d */ | grep install-tl-)
rm -rf install-tl-unx.tar.gz

echo "Done!"