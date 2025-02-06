# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 systemd

DESCRIPTION="Clipboard management"
HOMEPAGE="https://github.com/cdown/clipmenu"
EGIT_REPO_URI="https://github.com/cdown/clipmenu"
EGIT_BRANCH="develop"

LICENSE="MIT"
SLOT="0"
IUSE="+dmenu fzf rofi"
REQUIRED_USE="?? ( dmenu fzf rofi )"

DEPEND="
	x11-base/xorg-server[xvfb]
	x11-libs/libX11
	x11-libs/libXfixes
	x11-misc/xsel
"

RDEPEND="
	${DEPEND}
	dmenu? ( x11-misc/dmenu )
	fzf? ( app-shells/fzf )
	rofi? ( x11-misc/rofi )
"

src_prepare() {
	default

	if use rofi ; then
		sed -i 's|"dmenu"|"rofi"|g' src/config.c || die "sed failed"
	elif use fzf ; then
		sed -i 's|"dmenu"|"fzf"|g'  src/config.c || die "sed failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	einstalldocs
}

pkg_postinst() {
	if systemd_is_booted || has_version sys-apps/systemd; then
		einfo ""
		einfo "Make sure to import \$DISPLAY when using the systemd unit for clipmenud."
		einfo "Please see the README for more details."
	fi

	if ! use dmenu && ! use fzf && ! use rofi ; then
		ewarn ""
		ewarn "Clipmenu has been installed without a launcher."
		ewarn "You will need to set \$CM_LAUNCHER to a dmenu-compatible app for clipmenu to work."
		ewarn "Please refer to the documents for more info."
	fi
}
