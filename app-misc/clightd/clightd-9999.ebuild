# Copyright 2020-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN^}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/FedeDP/${MY_PN}"
else
	SRC_URI="https://github.com/FedeDP/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${P^}"
	KEYWORDS="~amd64 ~x86"
fi

inherit cmake

DESCRIPTION="A linux bus interface for screen settings (brightness, gamma, etc.)"
HOMEPAGE="https://github.com/FedeDP/Clightd"

LICENSE="GPL-3"
SLOT="0"
IUSE="ddc dpms gamma pipewire screen yoctolight"

DEPEND="
	dev-libs/libmodule
	media-libs/libjpeg-turbo
	net-libs/libiio
	sys-apps/dbus
	sys-auth/polkit
	virtual/libudev
	|| ( sys-auth/elogind sys-apps/systemd )
	ddc? (
		app-misc/ddcutil
	)
	dpms? (
		dev-libs/wayland
		dev-util/wayland-scanner
		x11-libs/libdrm
		x11-libs/libXext
		x11-libs/libX11
	)
	gamma? (
		dev-libs/wayland
		dev-util/wayland-scanner
		x11-libs/libdrm
		x11-libs/libXrandr
		x11-libs/libX11
	)
	pipewire? (
		media-video/pipewire
	)
	screen? (
		dev-libs/wayland
		dev-util/wayland-scanner
		x11-libs/libX11
	)
	yoctolight? (
		virtual/libusb:1
	)
"

RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=() useflag

	for useflag in ddc dpms gamma screen yoctolight; do
		mycmakeargs+=( -DENABLE_${useflag^^}=$(usex $useflag) )
	done

	if use ddc; then
		mycmakeargs+=( -DMODULE_LOAD_DIR=/etc/modules-load.d )
	fi

	cmake_src_configure
}

src_install() {
	cmake_src_install

	keepdir /etc/"${PN}"/sensors.d
}
