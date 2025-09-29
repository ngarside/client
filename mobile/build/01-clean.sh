#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

rpm-ostree override remove \
	fedora-workstation-backgrounds \
	gnome-classic-session \
	gnome-disk-utility \
	gnome-shell-extension-apps-menu \
	gnome-shell-extension-background-logo \
	gnome-shell-extension-common \
	gnome-shell-extension-launch-new-instance \
	gnome-shell-extension-places-menu \
	gnome-shell-extension-window-list \
	gnome-system-monitor \
	gnome-tour \
	malcontent \
	yelp \
	yelp-libs \
	yelp-xsl
