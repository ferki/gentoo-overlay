# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils git-r3

DESCRIPTION="Unix command line queue utility."
HOMEPAGE="https://github.com/chneukirchen/nq"
EGIT_REPO_URI="https://github.com/chneukirchen/nq.git"

if [ "${PV#9999}" == "${PV}" ] ; then
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="CC0-1.0"
SLOT="0/${PV}"
IUSE=""
