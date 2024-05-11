# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..12} )
PYTHON_REQ_USE="sqlite,ssl?"
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="Powerful IMAP/Maildir synchronization and reader support"
HOMEPAGE="https://github.com/OfflineIMAP/offlineimap3"
EGIT_REPO_URI="https://github.com/OfflineIMAP/${PN}.git"

LICENSE="GPL-2+"
SLOT="0"
IUSE="doc kerberos ssl"

RDEPEND="
	kerberos? ( dev-python/gssapi[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/distro[${PYTHON_USEDEP}]
	>=dev-python/imaplib2-2.57[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/rfc6555[${PYTHON_USEDEP}]
	doc? ( app-text/asciidoc )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_prepare() {
	sed -i "/^__version__/ s/\"\(.*\)\"/\"${PV}\"/" offlineimap/__init__.py
	sed -i "s/^description-file/description_file/" setup.cfg
	mv test/credentials.conf.sample test/credentials.conf
	rm test/tests/test_01_basic.py
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
