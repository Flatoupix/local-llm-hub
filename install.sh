#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"

mkdir -p "$INSTALL_DIR"
for name in modelhub gemma4 qwen3; do
  ln -sf "${SCRIPT_DIR}/modelhub" "${INSTALL_DIR}/${name}"
done

echo "Installed modelhub, gemma4, qwen3 into ${INSTALL_DIR}"

