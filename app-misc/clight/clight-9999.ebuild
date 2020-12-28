# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 xdg-utils

MY_PN="${PN^}"

DESCRIPTION="A C daemon that turns your webcam into a light sensor"
HOMEPAGE="https://github.com/FedeDP/Clight"

EGIT_REPO_URI="https://github.com/FedeDP/${MY_PN}"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
IUSE="bash-completion geoclue upower"

DEPEND="
	dev-libs/libconfig
	dev-libs/popt
	sci-libs/gsl
	|| ( sys-auth/elogind sys-apps/systemd )
"

RDEPEND="
	${DEPEND}
	app-misc/clightd
	geoclue? ( app-misc/geoclue )
	upower? ( sys-power/upower )
"

BDEPEND="
	${DEPEND}
	dev-libs/libmodule
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
