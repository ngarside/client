# This is free and unencumbered software released into the public domain.

RELEASE=$(rpm -E %fedora)

rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$RELEASE.noarch.rpm
