# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
PYTHON_REQ_USE="sqlite,ssl?"
DISTUTILS_USE_PEP517=setuptools

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/OfflineIMAP/${PN}.git"
	EGIT_BRANCH="master"
	VCS_ECLASS="git-r3"
else
	SRC_URI="https://github.com/OfflineIMAP/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit distutils-r1 ${VCS_ECLASS}

DESCRIPTION="Powerful IMAP/Maildir synchronization and reader support"
HOMEPAGE="https://github.com/OfflineIMAP/offlineimap3"

LICENSE="GPL-2+"
SLOT="0"
IUSE="doc kerberos keyring ssl"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/distro[${PYTHON_USEDEP}]
	>=dev-python/imaplib2-3.5[${PYTHON_USEDEP}]
	dev-python/rfc6555[${PYTHON_USEDEP}]
	kerberos? ( dev-python/gssapi[${PYTHON_USEDEP}] )
	keyring? ( dev-python/keyring[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPEND}"
BDEPEND="
	doc? ( app-text/asciidoc )
	test? (
		${RDEPEND}
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES="${FILESDIR}/${PN}-8.0.1-fix-build.patch"

src_prepare() {
	sed -i "/^__version__/ s/\"\(.*\)\"/\"${PV}\"/" offlineimap/__init__.py || die "Can not set version"
	mv test/credentials.conf.sample test/credentials.conf || die "Can not rename test credentials"
	rm test/tests/test_01_basic.py || die "Can not remove network tests"
	distutils-r1_src_prepare
}

src_compile() {
	distutils-r1_src_compile
	use doc && emake -C docs man
}

src_install() {
	distutils-r1_src_install
	dodoc offlineimap.conf offlineimap.conf.minimal
	use doc && doman docs/{offlineimap.1,offlineimapui.7}
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog "You will need to configure offlineimap by creating ~/.offlineimaprc"
		elog "Sample configurations are in /usr/share/doc/${PF}/"
		elog ""
		elog "If you connect via ssl/tls and don't use CA cert checking, it will"
		elog "display the server's cert fingerprint and require you to add it to the"
		elog "configuration file to be sure it connects to the same server every"
		elog "time. This serves to help fixing CVE-2010-4532 (offlineimap doesn't"
		elog "check SSL server certificate) in cases where you have no CA cert."
	fi
}
