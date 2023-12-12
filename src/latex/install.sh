#!/bin/sh
set -e


SCHEME=${SCHEME:-"full"}
PACKAGES=${PACKAGES:-""}

apt update
apt install -y wget perl-modules libfontconfig1 fontconfig

cd /tmp # working directory of your choice
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz # or curl instead of wget
zcat < install-tl-unx.tar.gz | tar xf -
cd $(ls -d */ | grep install-tl-)
perl ./install-tl --no-interaction --scheme=$SCHEME

TEXLIVE_DIR=$(ls -d /usr/local/texlive/* | grep 20)
TEXLIVE_EXECUTABLES_DIR="$(ls -d $TEXLIVE_DIR/bin/*)"

# Install latex and latexmk
$TEXLIVE_EXECUTABLES_DIR/tlmgr install latex latex-bin latexmk

# Split $PACKAGES string into separate strings using comma and/or space as delimiter and install them
for PACKAGE in $(echo $PACKAGES | tr ', ' '\n'); do
    $TEXLIVE_EXECUTABLES_DIR/tlmgr install $PACKAGE
done


chmod -R 777 /usr/local/texlive/

echo "PATH=\"\$PATH:$TEXLIVE_EXECUTABLES_DIR\"" >> /etc/environment
ls $TEXLIVE_EXECUTABLES_DIR | xargs -I % ln -s $TEXLIVE_EXECUTABLES_DIR/% /usr/local/bin/%
