# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A syntax-aware linter for prose built with speed and extensibility in mind"
HOMEPAGE="https://docs.errata.ai/"

EGO_SUM=(
	"github.com/MarvinJWendt/testza v0.1.0/go.mod"
	"github.com/MarvinJWendt/testza v0.2.1/go.mod"
	"github.com/MarvinJWendt/testza v0.2.8/go.mod"
	"github.com/MarvinJWendt/testza v0.2.10"
	"github.com/MarvinJWendt/testza v0.2.10/go.mod"
	"github.com/atomicgo/cursor v0.0.1"
	"github.com/atomicgo/cursor v0.0.1/go.mod"
	"github.com/d5/tengo/v2 v2.10.0"
	"github.com/d5/tengo/v2 v2.10.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/errata-ai/ini v1.63.0"
	"github.com/errata-ai/ini v1.63.0/go.mod"
	"github.com/errata-ai/regexp2 v1.7.0"
	"github.com/errata-ai/regexp2 v1.7.0/go.mod"
	"github.com/gobwas/glob v0.2.3"
	"github.com/gobwas/glob v0.2.3/go.mod"
	"github.com/gookit/color v1.4.2"
	"github.com/gookit/color v1.4.2/go.mod"
	"github.com/jdkato/prose v1.2.1"
	"github.com/jdkato/prose v1.2.1/go.mod"
	"github.com/jdkato/regexp v0.1.0"
	"github.com/jdkato/regexp v0.1.0/go.mod"
	"github.com/mattn/go-runewidth v0.0.7/go.mod"
	"github.com/mattn/go-runewidth v0.0.13"
	"github.com/mattn/go-runewidth v0.0.13/go.mod"
	"github.com/mitchellh/mapstructure v1.4.0"
	"github.com/mitchellh/mapstructure v1.4.0/go.mod"
	"github.com/montanaflynn/stats v0.6.3"
	"github.com/montanaflynn/stats v0.6.3/go.mod"
	"github.com/neurosnap/sentences v1.0.6"
	"github.com/neurosnap/sentences v1.0.6/go.mod"
	"github.com/olekukonko/tablewriter v0.0.4"
	"github.com/olekukonko/tablewriter v0.0.4/go.mod"
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
	"github.com/xo/terminfo v0.0.0-20210125001918-ca9a967f8778"
	"github.com/xo/terminfo v0.0.0-20210125001918-ca9a967f8778/go.mod"
	"github.com/yuin/goldmark v1.4.4"
	"github.com/yuin/goldmark v1.4.4/go.mod"
	"golang.org/x/net v0.0.0-20201224014010-6772e930b67b"
	"golang.org/x/net v0.0.0-20201224014010-6772e930b67b/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210330210617-4fbd30eecc44/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20211013075003-97ac67df715c"
	"golang.org/x/sys v0.0.0-20211013075003-97ac67df715c/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d/go.mod"
	"golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
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

LICENSE="MIT"
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
	dobin bin/vale
	default_src_install
}
