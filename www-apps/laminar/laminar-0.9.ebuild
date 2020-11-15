# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

CMAKE_IN_SOURCE_BUILD=1

DESCRIPTION="Fast and lightweight Continuous Integration"
HOMEPAGE="https://laminar.ohwg.net https://github.com/ohwgiles/laminar"
SRC_URI="
	https://github.com/ohwgiles/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://cdnjs.cloudflare.com/ajax/libs/vue/2.3.4/vue.min.js
	https://cdnjs.cloudflare.com/ajax/libs/vue-router/2.7.0/vue-router.min.js
	https://raw.githubusercontent.com/drudru/ansi_up/v1.3.0/ansi_up.js
	https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js
"

LICENSE="GPL-3 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	acct-group/laminar
	acct-user/laminar
	dev-db/sqlite
	dev-libs/boost
	>=dev-libs/capnproto-0.7
	dev-libs/rapidjson
"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_unpack() {
	unpack "${P}.tar.gz"

	mkdir "${S}/js"

	local js

	for js in vue.min.js vue-router.min.js ansi_up.js Chart.min.js; do
		cp "${DISTDIR}/${js}" "${S}/js/"
	done
}

src_prepare() {
	sed -i '/DOWNLOAD\|EXPECTED/d' "${S}/CMakeLists.txt" || die 'Failed to strip downloads'

	sed -i '/install.*laminar.conf/d' "${S}/CMakeLists.txt" || die 'Failed to strip config install'

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DLAMINAR_VERSION=${PV}
	)

	cmake_src_configure
}

src_install() {
	newconfd etc/laminar.conf laminar

	newinitd "${FILESDIR}/laminar.initd" laminar

	cmake_src_install
}
