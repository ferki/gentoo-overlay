# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig toolchain-funcs

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.suckless.org/${PN}"
else
	SRC_URI="https://dl.suckless.org/tools/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Simple generic tabbed fronted to xembed aware applications"
HOMEPAGE="https://tools.suckless.org/tabbed/"

LICENSE="MIT"
SLOT="0"

RDEPEND="
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXft
"
DEPEND="
	x11-base/xorg-proto
	${RDEPEND}
"

src_prepare() {
	default
	sed config.mk \
		-e '/^CC/d' \
		-e 's|/usr/local|/usr|g' \
		-e 's|^CFLAGS.*|CFLAGS += -std=c99 -pedantic -Wall $(INCS) $(CPPFLAGS)|g' \
		-e 's|^LDFLAGS.*|LDFLAGS += $(CFLAGS) $(LIBS)|g' \
		-e 's|^INCS.*|INCS = -I. -I/usr/include -I/usr/include/freetype2|g' \
		-e 's|^LIBS.*|LIBS = -lX11 -lfontconfig -lXft|g' \
		-e 's|{|(|g;s|}|)|g' \
		-i || die

	sed Makefile \
		-e 's|{|(|g;s|}|)|g' \
		-e '/^[[:space:]]*@echo/d' \
		-e 's|^	@|	|g' \
		-i || die

	restore_config config.h
}

src_compile() {
	emake CC="$(tc-getCC)"
}
src_install() {
	default
	save_config config.h
}
