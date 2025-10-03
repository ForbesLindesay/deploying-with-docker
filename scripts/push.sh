#!/bin/bash
set -euo pipefail

version="$1"
echo "pushing version ${version}"

# Source configuration
source "$(dirname "$0")/config.sh"

gcloud auth configure-docker \
  "${docker_host}"

docker tag \
  "${app_name}:${version}" \
  "${docker_registry}/${app_name}:${version}"

docker push \
  "${docker_registry}/${app_name}:${version}"
