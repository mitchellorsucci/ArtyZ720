#
# This file is the ArtyZ720demo recipe.
#

SUMMARY = "Simple ArtyZ720demo application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://artyz7demo.c \
	file://ArtyZ7.c \
	file://ArtyZ7.h \
	file://ChrFont0.h \
	file://gpio-fpga-driver.c \
	file://gpio-fpga.h \
	file://pwm-fpga-driver.c \
	file://pwm-fpga.h \
	file://uio-user.c \
	file://uio-user.h \
	file://bitstream.sh \
	file://overlay.sh \
	file://ArtyHW.dtbo \
	file://spichild.dtbo \
	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 ArtyZ720demo ${D}${bindir}
}
