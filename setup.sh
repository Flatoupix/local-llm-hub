#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required."
  exit 1
fi

if ! command -v llama-server >/dev/null 2>&1; then
  HOMEBREW_NO_INSTALL_CLEANUP=1 HOMEBREW_NO_ENV_HINTS=1 brew install llama.cpp
else
  echo "llama-server already installed"
fi

echo
echo "Done."
echo "Next:"
echo "  ./install.sh"
echo "  modelhub continue sync"
