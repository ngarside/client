# This is free and unencumbered software released into the public domain.

dnf --assumeyes install akmod-nvidia xorg-x11-drv-nvidia

echo "%_with_kmod_nvidia_open 1" > /etc/rpm/macros.nvidia-kmod

KERNEL=$(rpm -qa kernel | grep -oP '(?<=kernel-).*')

akmods --force --kernels $KERNEL --rebuild

PACKAGE=$(find /var/cache/akmods/nvidia -type f -name kmod*)

dnf --assumeyes install $PACKAGE
