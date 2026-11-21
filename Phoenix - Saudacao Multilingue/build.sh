#!/usr/bin/env bash
set -euo pipefail

export MIX_ENV=prod

mix deps.get --only prod
mix release --overwrite
