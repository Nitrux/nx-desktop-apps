#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)
git_commit=$(git rev-parse --short HEAD)

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://nxos.org" \
	"Package: nx-desktop-apps-arm64" \
	"Version: 0.0.1-$git_commit" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $deps" \
	"Conflicts: nx-desktop-apps, nx-desktop-apps-legacy, nx-desktop-apps-minimal, nx-desktop-apps-legacy-minimal" \
	"Architecture: all" \
	"Description: NX Desktop Apps metapackage for Nitrux."

equivs-build configuration
