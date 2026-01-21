#!/usr/bin/env bash
set -euo pipefail

# Load .env locally if present (CI uses GitHub secret env)
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

: "${DATABASE_URL:?DATABASE_URL is not set}"

goose -dir sql/schema turso "$DATABASE_URL" up
