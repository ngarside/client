# This is free and unencumbered software released into the public domain.

FROM quay.io/fedora/fedora-kinoite:42

SHELL ["/bin/bash", "-c"]

RUN --mount=target=/tmp/git set -euo pipefail && \
	for file in /tmp/git/common/*.sh; do bash "$file" || exit; done

RUN --mount=target=/tmp/git set -euo pipefail && \
	for file in /tmp/git/pro/*.sh; do bash "$file" || exit; done

RUN rpm-ostree cleanup --repomd && \
	ostree container commit
