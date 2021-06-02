# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )
PYTHON_REQ_USE="sqlite,ssl?"
inherit distutils-r1 git-r3
DISTUTILS_USE_SETUPTOOLS=no

DESCRIPTION="Powerful IMAP/Maildir synchronization and reader support"
HOMEPAGE="https://github.com/OfflineIMAP/offlineimap3"
EGIT_REPO_URI="https://github.com/OfflineIMAP/${PN}.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc kerberos ssl"

DEPEND="doc? ( app-text/asciidoc )"
RDEPEND="
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	>=dev-python/imaplib2-2.57[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/rfc6555[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.9[${PYTHON_USEDEP}]
	kerberos? ( dev-python/gssapi[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_prepare() {
	sed -i "/^__version__/ s/\"\(.*\)\"/\"${PV}\"/" offlineimap/__init__.py
	mv test/credentials.conf.sample test/credentials.conf
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
