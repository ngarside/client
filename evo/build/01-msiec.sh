#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes install dkms kernel-devel tlp tlp-rdw

git clone https://github.com/ngarside/msi-ec.git \
	--branch feature/prestige-13-a1mg \
	--depth 1 \
	/tmp/msi-ec

LWD=$PWD
cd /tmp/msi-ec

KERNEL=$(rpm -qa kernel | grep -oP '(?<=kernel-).*')
make KERNELRELEASE=$KERNEL
make KERNELRELEASE=$KERNEL dkms-install

cd $LWD
rm --recursive /tmp/msi-ec
