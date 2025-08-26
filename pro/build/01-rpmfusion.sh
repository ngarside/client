# This is free and unencumbered software released into the public domain.

RELEASE=$(rpm -E %fedora)

dnf --assumeyes install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$RELEASE.noarch.rpm
