# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend
inherit distutils-r1 git-r3

DESCRIPTION="Implementation of the Happy Eyeballs Algorithm described in RFC 6555."
HOMEPAGE="https://github.com/sethmlarson/rfc6555"
EGIT_REPO_URI="https://github.com/sethmlarson/${PN}.git"
EGIT_COMMIT="1a181b432312731f6742a5eb558dae4761d32361"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
BDEPEND="${BDEPEND}
	test? ( dev-python/mock[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
