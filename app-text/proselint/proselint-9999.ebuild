# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=poetry

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/amperser/${PN}.git"
	EGIT_BRANCH="main"
else
	SRC_URI="https://github.com/amperser/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit distutils-r1

DESCRIPTION="A linter for prose"
HOMEPAGE="http://proselint.com"

LICENSE="BSD"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND=""
RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
