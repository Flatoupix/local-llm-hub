#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rm -f "${INSTALL_DIR:-$HOME/.local/bin}/qwen-local"

"${SCRIPT_DIR}/modelhub" install
