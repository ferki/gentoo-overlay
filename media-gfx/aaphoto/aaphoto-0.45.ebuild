# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Automatic color correction and resizing of photos"
HOMEPAGE="http://log69.com/aaphoto.html https://github.com/log69/aaphoto"
SRC_URI="http://log69.com/downloads/${PN}_sources_${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	media-libs/libjpeg-turbo
	media-libs/libpng:0=
	sys-libs/zlib
"
DEPEND="${RDEPEND}"

pkg_setup() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		tc-has-openmp || die "Please switch to an openmp compatible compiler"
	fi
}
