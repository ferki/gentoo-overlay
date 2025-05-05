# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Programming in YAML"
HOMEPAGE="https://yamlscript.org/"
SRC_URI="
	https://github.com/yaml/yamlscript/releases/download/${PV}/ys-${PV}-linux-x64.tar.xz
	libyamlscript? ( https://github.com/yaml/yamlscript/releases/download/${PV}/libyamlscript-${PV}-linux-x64.tar.xz )
"

S="${WORKDIR}/ys-${PV}-linux-x64"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libyamlscript"

RDEPEND="sys-libs/zlib"

QA_PRESTRIPPED="
	/usr/bin/ys-${PV}
	/usr/lib64/libyamlscript.so.${PV}
"

QA_SONAME="/usr/lib64/libyamlscript.so.${PV}"

src_compile() {
	:
}

src_install() {
	local ys="ys-${PV}"

	dobin "${ys}"

	dosym "${ys}" /usr/bin/ys-0
	dosym "${ys}" /usr/bin/ys

	if use libyamlscript; then
		dolib.so "${WORKDIR}/libyamlscript-${PV}-linux-x64/libyamlscript.so.${PV}"

		dosym "libyamlscript.so.${PV}" /usr/lib64/libyamlscript.so.0
		dosym "libyamlscript.so.${PV}" /usr/lib64/libyamlscript.so

	fi
}
