# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Static checker for GitHub Actions workflow files"
HOMEPAGE="https://github.com/rhysd/actionlint"
SRC_URI="
	https://github.com/rhysd/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ferki/${PN}/releases/download/v${PV}-gentoo-deps/${P}-gentoo-deps.tar.xz
"

LICENSE="Apache-2.0 BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"
RESTRICT="test"
PROPERTIES="test_network"

BDEPEND="doc? ( app-text/ronn-ng )"

DOCS=( {CHANGELOG,README}.md docs/{checks,config,usage}.md )

src_compile() {
	LDFLAGS="-s -w -X github.com/rhysd/actionlint.version=${PV}"

	go build -ldflags "${LDFLAGS}" ./cmd/actionlint || die "build failed"

	use doc && emake man
}

src_install() {
	einstalldocs
	dobin actionlint
	use doc && doman man/actionlint.1
}
