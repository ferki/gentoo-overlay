# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Sound Open Firmware (SOF) firmware and topology binaries"
HOMEPAGE="https://www.sofproject.org https://github.com/thesofproject/sof-bin"
EGIT_REPO_URI="https://github.com/thesofproject/sof-bin.git"
EGIT_BRANCH="stable-v${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	rm -rf "lib/firmware/intel/sof/v${PV}/public-signed"
	mv lib/firmware/intel/sof/v"${PV}"/intel-signed/* lib/firmware/intel/sof/v"${PV}"/

	for file in $(find lib/firmware/intel/sof/v${PV} -name "*.ri"); do
		mv "${file}" "${file//-v${PV}/}"
	done

	find "lib/firmware/intel/sof/v${PV}" -type f ! -name "*.ri" -delete

	mv "lib/firmware/intel/sof-tplg-v${PV}" "lib/firmware/intel/sof-tplg"
	default
}

src_install() {
	insinto /lib/firmware/intel/sof
	doins -r lib/firmware/intel/sof/v"${PV}"/*

	insinto /lib/firmware/intel
	doins -r lib/firmware/intel/sof-tplg
}
