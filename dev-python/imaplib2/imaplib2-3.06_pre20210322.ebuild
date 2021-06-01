# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend
inherit distutils-r1 git-r3

DESCRIPTION="Threaded Python IMAP4 client."
HOMEPAGE="https://github.com/jazzband/imaplib2"
EGIT_REPO_URI="https://github.com/EvaSDK/${PN}.git"
EGIT_BRANCH="fix_packaging"
EGIT_COMMIT="8ab2554bb73cb367c141d63d96044ad4719300c0"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
