#
# This file is the scripts recipe.
#

SUMMARY = "Simple scripts application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
FILES_${PN} += "/lib/*"

SRC_URI = "file://Makefile \
	file://ArtyHW.dtbo \
	file://spichild.dtbo \
	file://bitstream.sh \
	file://overlay.sh \
	file://oled.bit \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	 	install -d ${D}/lib/firmware
		install -m 0755 ArtyHW.dtbo ${D}/lib/firmware
		install -m 0755 spichild.dtbo ${D}/lib/firmware
		install -m 0755 oled.bit ${D}/lib/firmware
		install -m 0755 bitstream.sh ${D}${bindir} 
		install -m 0755 overlay.sh ${D}${bindir}
}
