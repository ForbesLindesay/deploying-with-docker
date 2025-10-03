#!/bin/bash
set -euo pipefail

version="$1"
echo "building version ${version}"

# Source configuration
source "$(dirname "$0")/config.sh"

npm run build
docker build --platform linux/amd64 -t "${app_name}:${version}" .