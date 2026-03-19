#!/usr/bin/env sh
# Backwards-compatible wrapper. Prefer: bun run generate -- <dir> [config.json]
cd "$(dirname "$0")" || exit 1
exec bun scripts/generate.ts "$@"
