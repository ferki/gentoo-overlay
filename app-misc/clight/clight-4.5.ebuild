# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

MY_PN="${PN^}"
S="${WORKDIR}/${P^}"

DESCRIPTION="A C daemon that turns your webcam into a light sensor"
HOMEPAGE="https://github.com/FedeDP/Clight"
SRC_URI="https://github.com/FedeDP/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion geoclue upower"

PATCHES=(
	"${FILESDIR}/clight-gentoo-skip-manpage-compression.patch"
)

DEPEND="
	dev-libs/libconfig
	dev-libs/popt
	sci-libs/gsl
	|| ( sys-auth/elogind sys-apps/systemd )
"

RDEPEND="
	${DEPEND}
	>=app-misc/clightd-5.0
	geoclue? ( app-misc/geoclue:2.0 )
	upower? ( sys-power/upower )
"

BDEPEND="
	${DEPEND}
	>=dev-libs/libmodule-5.0.0
	dev-util/cmake
	sys-apps/dbus
	virtual/pkgconfig
	bash-completion? ( app-shells/bash-completion )
"

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
