# <p align="center">Client</p>

Base images for OSTree-based client systems.

> **Do not use this image! This is built only for my own use, I don't recommend anyone using artifacts from this repo directly, rather use it as a base to fork and create your own.**

A minimal base image for Fedora Silverblue. This strips out most unnecessary packages (Firefox, desktop backgrounds, etc) while leaving a useable but very minimal desktop base which can be built upon.

# <p align="center">Commands</p>

# Installation

Rebase from an existing tag.

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/ngarside/silverblue:latest
```

# Upgrading

Manually upgrade to a new tag.

```
rpm-ostree upgrade
```

# Uninstall All Flatpaks & Data

This will delete all user data stored by Flatpaks!

```
flatpak remove --all --delete-data --noninteractive
```

# <p align="center">License</p>

This is free and unencumbered software released into the public domain.

Exception of Mountains.png image which is used from https://basicappleguy.com/basicappleblog/mountains-beyond-mountains
