# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A syntax-aware linter for prose built with speed and extensibility in mind"
HOMEPAGE="https://vale.sh/docs/"

EGO_SUM=(
	"github.com/MarvinJWendt/testza v0.1.0/go.mod"
	"github.com/MarvinJWendt/testza v0.2.1/go.mod"
	"github.com/MarvinJWendt/testza v0.2.8/go.mod"
	"github.com/MarvinJWendt/testza v0.2.10"
	"github.com/MarvinJWendt/testza v0.2.10/go.mod"
	"github.com/atomicgo/cursor v0.0.1"
	"github.com/atomicgo/cursor v0.0.1/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/d5/tengo/v2 v2.10.0"
	"github.com/d5/tengo/v2 v2.10.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dsnet/compress v0.0.2-0.20210315054119-f66993602bf5"
	"github.com/dsnet/compress v0.0.2-0.20210315054119-f66993602bf5/go.mod"
	"github.com/dsnet/golib v0.0.0-20171103203638-1ea166775780/go.mod"
	"github.com/errata-ai/ini v1.63.0"
	"github.com/errata-ai/ini v1.63.0/go.mod"
	"github.com/errata-ai/regexp2 v1.7.0"
	"github.com/errata-ai/regexp2 v1.7.0/go.mod"
	"github.com/frankban/quicktest v1.14.3"
	"github.com/frankban/quicktest v1.14.3/go.mod"
	"github.com/gobwas/glob v0.2.3"
	"github.com/gobwas/glob v0.2.3/go.mod"
	"github.com/golang/snappy v0.0.4"
	"github.com/golang/snappy v0.0.4/go.mod"
	"github.com/google/go-cmp v0.5.5/go.mod"
	"github.com/google/go-cmp v0.5.7"
	"github.com/google/go-cmp v0.5.7/go.mod"
	"github.com/gookit/color v1.4.2"
	"github.com/gookit/color v1.4.2/go.mod"
	"github.com/jdkato/prose v1.2.1"
	"github.com/jdkato/prose v1.2.1/go.mod"
	"github.com/jdkato/regexp v0.1.0"
	"github.com/jdkato/regexp v0.1.0/go.mod"
	"github.com/jdkato/titlecase v0.0.0-20220120021253-0158ddd948b8"
	"github.com/jdkato/titlecase v0.0.0-20220120021253-0158ddd948b8/go.mod"
	"github.com/karrick/godirwalk v1.16.1"
	"github.com/karrick/godirwalk v1.16.1/go.mod"
	"github.com/klauspost/compress v1.4.1/go.mod"
	"github.com/klauspost/cpuid v1.2.0/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.3.0"
	"github.com/kr/pretty v0.3.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/mattn/go-runewidth v0.0.7/go.mod"
	"github.com/mattn/go-runewidth v0.0.13"
	"github.com/mattn/go-runewidth v0.0.13/go.mod"
	"github.com/mholt/archiver v3.1.1+incompatible"
	"github.com/mholt/archiver v3.1.1+incompatible/go.mod"
	"github.com/mitchellh/mapstructure v1.4.0"
	"github.com/mitchellh/mapstructure v1.4.0/go.mod"
	"github.com/montanaflynn/stats v0.6.3"
	"github.com/montanaflynn/stats v0.6.3/go.mod"
	"github.com/neurosnap/sentences v1.0.6"
	"github.com/neurosnap/sentences v1.0.6/go.mod"
	"github.com/niklasfasching/go-org v1.6.5"
	"github.com/niklasfasching/go-org v1.6.5/go.mod"
	"github.com/nwaples/rardecode v1.1.0"
	"github.com/nwaples/rardecode v1.1.0/go.mod"
	"github.com/olekukonko/tablewriter v0.0.4"
	"github.com/olekukonko/tablewriter v0.0.4/go.mod"
	"github.com/otiai10/copy v1.7.0"
	"github.com/otiai10/copy v1.7.0/go.mod"
	"github.com/otiai10/curr v0.0.0-20150429015615-9b4961190c95/go.mod"
	"github.com/otiai10/curr v1.0.0/go.mod"
	"github.com/otiai10/mint v1.3.0/go.mod"
	"github.com/otiai10/mint v1.3.3"
	"github.com/otiai10/mint v1.3.3/go.mod"
	"github.com/pierrec/lz4 v2.6.1+incompatible"
	"github.com/pierrec/lz4 v2.6.1+incompatible/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/pterm/pterm v0.12.27/go.mod"
	"github.com/pterm/pterm v0.12.29/go.mod"
	"github.com/pterm/pterm v0.12.30/go.mod"
	"github.com/pterm/pterm v0.12.31/go.mod"
	"github.com/pterm/pterm v0.12.33"
	"github.com/pterm/pterm v0.12.33/go.mod"
	"github.com/remeh/sizedwaitgroup v1.0.0"
	"github.com/remeh/sizedwaitgroup v1.0.0/go.mod"
	"github.com/rivo/uniseg v0.2.0"
	"github.com/rivo/uniseg v0.2.0/go.mod"
	"github.com/rogpeppe/go-internal v1.6.1"
	"github.com/rogpeppe/go-internal v1.6.1/go.mod"
	"github.com/shogo82148/go-shuffle v0.0.0-20180218125048-27e6095f230d"
	"github.com/shogo82148/go-shuffle v0.0.0-20180218125048-27e6095f230d/go.mod"
	"github.com/spf13/cast v1.3.1"
	"github.com/spf13/cast v1.3.1/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/ulikunitz/xz v0.5.8/go.mod"
	"github.com/ulikunitz/xz v0.5.10"
	"github.com/ulikunitz/xz v0.5.10/go.mod"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8"
	"github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8/go.mod"
	"github.com/xo/terminfo v0.0.0-20210125001918-ca9a967f8778"
	"github.com/xo/terminfo v0.0.0-20210125001918-ca9a967f8778/go.mod"
	"github.com/yuin/goldmark v1.4.12"
	"github.com/yuin/goldmark v1.4.12/go.mod"
	"golang.org/x/net v0.0.0-20211015210444-4f30a5c0130f"
	"golang.org/x/net v0.0.0-20211015210444-4f30a5c0130f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210330210617-4fbd30eecc44/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20211013075003-97ac67df715c/go.mod"
	"golang.org/x/sys v0.0.0-20220319134239-a9b59b0215f8"
	"golang.org/x/sys v0.0.0-20220319134239-a9b59b0215f8/go.mod"
	"golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d/go.mod"
	"golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/neurosnap/sentences.v1 v1.0.6"
	"gopkg.in/neurosnap/sentences.v1 v1.0.6/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b/go.mod"
)

go-module_set_globals

SRC_URI="
	https://github.com/errata-ai/vale/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"

LICENSE="Apache-2.0 BSD BSD-2 MIT public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE="asciidoc rst +styles xml"

RESTRICT="test"

RDEPEND="
	asciidoc? ( dev-ruby/asciidoctor )
	rst? ( dev-python/docutils )
	styles? (
		app-text/vale-style-alex
		app-text/vale-style-Google
		app-text/vale-style-Joblint
		app-text/vale-style-Microsoft
		app-text/vale-style-proselint
		app-text/vale-style-Readability
		app-text/vale-style-write-good
	)
	xml? ( dev-libs/libxslt )
"

src_prepare() {
	sed -i "s/\$(LAST_TAG)/v${PV}/" Makefile || die 'sed failed'
	default
}

src_compile() {
	emake build os=linux
}

src_install() {
	dodoc "${FILESDIR}/vale.ini.example"
	dobin bin/vale
	default_src_install
}

pkg_postinst() {
	elog "Vale requires a configuration file. If you don't have one yet,"
	elog "consider copying the example file into your home directory:"
	elog ""
	elog "    cp /usr/share/doc/${P}/vale.ini.example ~/.vale.ini"
}
