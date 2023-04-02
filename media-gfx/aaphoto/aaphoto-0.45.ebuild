# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

GIT_COMMIT="ebe21c4"

DESCRIPTION="Automatic color correction and resizing of photos"
HOMEPAGE="https://web.archive.org/web/20220728233436/http://log69.com/aaphoto_en.html https://github.com/log69/aaphoto"
SRC_URI="https://github.com/log69/${PN}/tarball/${GIT_COMMIT} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	media-libs/libjpeg-turbo
	media-libs/libpng:0=
	sys-libs/zlib
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/log69-${PN}-${GIT_COMMIT}"

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && tc-check-openmp
}
