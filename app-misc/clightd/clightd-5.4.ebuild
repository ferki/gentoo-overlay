# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN^}"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/FedeDP/${MY_PN}"
	EGIT_BRANCH="master"
	VCS_ECLASS="git-r3"
else
	SRC_URI="https://github.com/FedeDP/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${P^}"
	KEYWORDS="~amd64 ~x86"
fi

inherit cmake ${VCS_ECLASS}

DESCRIPTION="A linux bus interface for screen settings (brightness, gamma, etc.)"
HOMEPAGE="https://github.com/FedeDP/Clightd"

LICENSE="GPL-3"
SLOT="0"
IUSE="ddc dpms gamma screen yoctolight"

DEPEND="
	>=dev-libs/libmodule-5.0.0
	sys-auth/polkit
	virtual/jpeg
	virtual/libudev
	|| ( sys-auth/elogind sys-apps/systemd )
	ddc? ( >=app-misc/ddcutil-0.9.5 )
	dpms? (
		dev-libs/wayland
		x11-libs/libdrm
		x11-libs/libXext
		x11-libs/libX11
	)
	gamma? (
		dev-libs/wayland
		x11-libs/libdrm
		x11-libs/libXrandr
		x11-libs/libX11
	)
	screen? (
		x11-libs/libX11
	)
	yoctolight? (
		virtual/libusb:1
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
		-DENABLE_YOCTOLIGHT=$(usex yoctolight)
	)

	cmake_src_configure
}