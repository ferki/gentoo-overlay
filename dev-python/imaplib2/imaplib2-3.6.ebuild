# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Threaded Python IMAP4 client"
HOMEPAGE="https://github.com/jazzband/imaplib2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
