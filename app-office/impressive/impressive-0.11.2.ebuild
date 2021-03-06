# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit eutils python-r1

MY_PN="Impressive"

DESCRIPTION="Stylish way of giving presentations with Python"
HOMEPAGE="http://impressive.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}/${PV%b}/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${PYTHON_DEPS}
	dev-python/pygame[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	x11-apps/xrandr
	app-text/mupdf
	|| ( media-fonts/dejavu media-fonts/corefonts )"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DOCS=(
	changelog.txt
	demo.pdf
)
HTML_DOCS=(
	impressive.html
)

S=${WORKDIR}/${MY_PN}-${PV}

src_install() {
	default
	python_foreach_impl python_doscript ${PN}.py
	doman impressive.1
}

pkg_postinst() {
	elog "The experience with ${PN} can be enhanced by folowing packages:"
	optfeature "starting web or e-mail hyperlinks from PDF documents" x11-misc/xdg-utils
	optfeature "sound and video playback" media-video/mplayer
	optfeature "sound and video playback" media-video/mplayer2
	optfeature "extraction of PDF page titles" app-text/pdftk
}
