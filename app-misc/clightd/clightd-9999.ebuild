# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3 xdg-utils

MY_PN="${PN^}"

DESCRIPTION="A linux bus interface for screen settings (brightness, gamma, etc.)"
HOMEPAGE="https://github.com/FedeDP/Clightd"

EGIT_REPO_URI="https://github.com/FedeDP/${MY_PN}"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
IUSE="ddc dpms gamma screen"

DEPEND="
	|| ( sys-auth/elogind sys-apps/systemd )
	virtual/libudev
	>=dev-libs/libmodule-5.0.0
	sys-auth/polkit
	ddc? ( >=app-misc/ddcutil-0.9.5 )
	dpms? (
		x11-libs/libXext
		x11-libs/libX11
	)
	gamma? (
		x11-libs/libXrandr
		x11-libs/libX11
	)
	screen? (
		x11-libs/libX11
	)
"

RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_DDC=$(usex ddc)
		-DENABLE_DPMS=$(usex dpms)
		-DENABLE_GAMMA=$(usex gamma)
		-DENABLE_SCREEN=$(usex screen)
	)

	cmake-utils_src_configure
}
