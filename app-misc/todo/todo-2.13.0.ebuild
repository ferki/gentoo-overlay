# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

DESCRIPTION="A CLI-based TODO list manager"
HOMEPAGE="http://todotxt.org"
SRC_URI="https://github.com/todotxt/${PN}.txt-cli/archive/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}.txt-cli-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="app-shells/bash"

DOCS=( README.md LICENSE todo.cfg )

src_prepare() {
	default

	# fix version string
	sed -i -e "s/@DEV_VERSION@/${PV}/" todo.sh || die

	# TODO_DIR variable is bogus
	sed -i -e '/export TODO_DIR/d' todo.cfg || die
	sed -i -e '4i export TODO_DIR="$HOME/.todo"' todo.cfg || die
}

src_install() {
	dobin "${PN}.sh"
	newbashcomp "${PN}_completion" "${PN}.sh"
	einstalldocs
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		einfo 'While todo.sh should work out of the box,'
		einfo 'please check the CONFIGURATION section of the README at:'
		einfo
		einfo "  /usr/share/doc/${PF}/README.md.bz2"
	fi
}
