#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes install akmod-nvidia xorg-x11-drv-nvidia

mkdir /tmp/pki
echo -e "$KMOD_PRIVATEKEY" > /tmp/pki/kmod_privatekey.rsa
echo -e "$KMOD_PUBLICKEY" > /tmp/pki/kmod_publickey.rsa

openssl x509 -in /tmp/pki/kmod_publickey.rsa -outform der -out /tmp/pki/kmod_publickey.der

cat > /etc/rpm/macros.nvidia-kmod <<EOF
%_kmodtool_signmodules_privkey /tmp/pki/kmod_privatekey.rsa
%_kmodtool_signmodules_pubkey /tmp/pki/kmod_publickey.der
%_with_kmod_nvidia_open 1
EOF

KERNEL=$(rpm -qa kernel | grep -oP '(?<=kernel-).*')

akmods --force --kernels $KERNEL --rebuild

rm --force --recursive /tmp/pki

PACKAGE=$(find /var/cache/akmods/nvidia -type f -name kmod*)

dnf --assumeyes install $PACKAGE
