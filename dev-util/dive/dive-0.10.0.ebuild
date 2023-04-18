# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A tool for exploring each layer in a docker image"
HOMEPAGE="https://github.com/wagoodman/dive"

SRC_URI="
	https://github.com/wagoodman/dive/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ferki/${PN}/releases/download/v${PV}-gentoo-deps/${P}-gentoo-deps.tar.xz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install () {
	dobin dist/dive_linux_amd64/dive
	einstalldocs
}
