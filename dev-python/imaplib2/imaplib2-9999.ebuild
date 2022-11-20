# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Threaded Python IMAP4 client."
HOMEPAGE="https://github.com/jazzband/imaplib2"
EGIT_REPO_URI="https://github.com/jazzband/${PN}.git"

LICENSE="MIT"
SLOT="0"
