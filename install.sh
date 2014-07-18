#!/bin/sh

# This is the cordova-resource-generators install script!
# Are you looking at this in your web browser, and would like to install?
# Just open up your terminal and type:
#
#  curl https://raw.githubusercontent.com/busterc/cordova-resource-generators/master/install.sh | sh
#
# Currently supports Mac OS X

set -e
set -u

# Display everything on stderr.
exec 1>&2

UNAME=$(uname)
if [ "$UNAME" != "Darwin" ] ; then
	echo "Sorry, this OS is not supported yet."
	exit 1
fi

INSTALL_URL="https://raw.githubusercontent.com/busterc/cordova-resource-generators/master"
PREFIX="/usr/local"
INSTALL_BIN="$PREFIX/bin"

# New macs (10.9+) don't ship with /usr/local, however it is still in
# the default PATH. We still install there, we just need to create the
# directory first.
if [ ! -d "$INSTALL_BIN" ] ; then
	sudo mkdir -m 755 "$PREFIX" || true
	sudo mkdir -m 755 "$INSTALL_BIN" || true
fi

GEN_ICONS="/cordova-generate-icons"
GEN_SPLASHES="/cordova-generate-splash-screens"

curl -# -o $INSTALL_BIN$GEN_ICONS $INSTALL_URL$GEN_ICONS
sudo chmod +x $INSTALL_BIN$GEN_ICONS

curl -# -o $INSTALL_BIN$GEN_SPLASHES $INSTALL_URL$GEN_SPLASHES
sudo chmod +x $INSTALL_BIN$GEN_SPLASHES

cat <<"EOF"

# Installation Complete

To generate icons:

  $ cd path/to/your/app
  $ cordova-generate-icons path/to/icon.png

To generate splash screens:

  $ cd path/to/your/app
  $ cordova-generate-splash-screens path/to/icon.png

EOF

