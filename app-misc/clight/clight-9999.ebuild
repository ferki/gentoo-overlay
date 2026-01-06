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

inherit cmake xdg

DESCRIPTION="A C daemon that turns your webcam into a light sensor"
HOMEPAGE="https://github.com/FedeDP/Clight"

LICENSE="GPL-3"
SLOT="0"
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
	sys-apps/dbus
	virtual/pkgconfig
	bash-completion? ( app-shells/bash-completion )
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_SYSCONFDIR="${EPREFIX}/etc"
	)

	cmake_src_configure
}
