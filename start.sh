#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Refresh .env from 1Password before starting
if command -v op &>/dev/null && [ -f .env.tpl ]; then
  op inject -i .env.tpl -o .env --force 2>/dev/null || echo "[start.sh] op inject failed, using existing .env"
fi

exec /Users/jhughes/.nvm/versions/node/v22.19.0/bin/node dist/index.js
