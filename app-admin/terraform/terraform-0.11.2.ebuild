# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_VENDOR=( "golang.org/x/tools 9bd2f44 github.com/golang/tools" )

inherit golang-vcs-snapshot

MY_PV="${PV/_/-}"
COMMIT_HASH="a6008b8a48a749c7c167453b9cf55ffd572b9a5d"
EGO_PN="github.com/hashicorp/terraform"
DESCRIPTION="A tool for building, changing, and combining infrastructure safely/efficiently"
HOMEPAGE="https://www.terraform.io"
SRC_URI="https://${EGO_PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"
RESTRICT="mirror strip"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples fish-completion terraform-bundle zsh-completion"

RDEPEND="!arm? ( fish-completion? ( app-shells/fish ) )
	zsh-completion? ( app-shells/zsh )"

DOCS=( {CHANGELOG,README}.md )

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"
	local PATH="${G}/bin:$PATH"
	local GOLDFLAGS="-s -w \
		-X main.GitCommit=${COMMIT_HASH} \
		-X ${EGO_PN}/terraform.VersionPrerelease="

	ebegin "Building stringer locally"
	pushd vendor/golang.org/x/tools/cmd/stringer > /dev/null || die
	go build -v -ldflags "-s -w" \
		-o "${G}"/bin/stringer || die
	popd > /dev/null || die
	eend $?

	emake fmtcheck generate

	go install -v -ldflags \
		"${GOLDFLAGS}" || die

	if use terraform-bundle; then
		go build -v -ldflags "-s -w" \
		./tools/terraform-bundle || die
	fi
}

src_test() {
	local PATH="${G}/bin:$PATH"
	default
}

src_install() {
	dobin "${G}"/bin/terraform
	einstalldocs

	if use terraform-bundle; then
		dobin terraform-bundle
		newdoc tools/terraform-bundle/README.md \
			terraform-bundle.md
	fi

	if use examples; then
		docinto examples
		dodoc -r examples/*
		docompress -x /usr/share/doc/${PF}/examples
	fi

	if use fish-completion; then
		insinto /usr/share/fish/functions/
		doins contrib/fish-completion/terraform.fish
	fi

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins contrib/zsh-completion/_terraform
	fi
}
