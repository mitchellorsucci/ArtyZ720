DESCRIPTION = "PETALINUX image definition for Xilinx boards"
LICENSE = "MIT"

require recipes-core/images/petalinux-image-common.inc 

inherit extrausers
IMAGE_LINGUAS = " "

IMAGE_INSTALL = "\
		kernel-modules \
		i2c-tools \
		mtd-utils \
		bash \
		util-linux \
		canutils \
		openssh-sftp-server \
		wget \
		bash-completion \
		git \
		git-bash-completion \
		gitweb \
		git-perltools \
		git-dev \
		git-dbg \
		grep \
		gzip \
		pciutils \
		unzip \
		vim \
		vim-syntax \
		vim-common \
		vim-vimrc \
		vim-tools \
		make \
		run-postinsts \
		which \
		gdb \
		packagegroup-core-boot \
		packagegroup-core-buildessential \
		packagegroup-core-ssh-dropbear \
		tcf-agent \
		valgrind \
		bridge-utils \
		ArtyZ720demo \
		scripts \
		"
EXTRA_USERS_PARAMS = "usermod -P root root;"
