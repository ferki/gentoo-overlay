# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="A linter for prose"
HOMEPAGE="http://proselint.com"
SRC_URI="https://github.com/amperser/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND=""
RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	sed -i '/^exclude/d' "${S}/pyproject.toml" || die 'Can not remove exclude'
	default
}

python_test() {
	local gentoo_tests_dir="${S}/gentoo_tests"
	mkdir -p "${gentoo_tests_dir}"
	esetup.py install --skip-build --root="${gentoo_tests_dir}"
	PATH="${gentoo_tests_dir}/usr/bin:$PATH" pytest
}
