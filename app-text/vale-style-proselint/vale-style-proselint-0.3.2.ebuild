# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_STYLE_NAME="proselint"

DESCRIPTION="A Vale-compatible implementation of Python's proselint linter"
HOMEPAGE="https://github.com/errata-ai/proselint"
SRC_URI="https://github.com/errata-ai/proselint/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S=${WORKDIR}/${MY_STYLE_NAME}-${PV}

src_install() {
	insinto "/usr/share/vale/styles"
	doins -r ${MY_STYLE_NAME}
}
