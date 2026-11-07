#!/bin/bash
# Rode como root em Debian/Ubuntu (VM ou GitHub Actions). Não toca em discos: só gera um arquivo .iso.
set -euo pipefail
apt-get update && apt-get install -y live-build xorriso squashfs-tools
lb clean --purge || true
lb config
lb build
mv live-image-amd64.hybrid.iso lumora-1.0-amd64.iso
sha256sum lumora-1.0-amd64.iso | tee lumora-1.0-amd64.iso.sha256
