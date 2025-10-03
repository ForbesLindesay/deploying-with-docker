#!/bin/bash
set -euo pipefail

version="$1"
env="$2"

# Validate environment
if [ "$env" != "staging" ] && [ "$env" != "production" ]; then
  echo "Error: Environment must be 'staging' or 'production', got '$env'"
  exit 1
fi

echo "deploying version ${version} to ${env}"

# Source configuration
source "$(dirname "$0")/config.sh"

gcloud run deploy "${app_name}-${env}" \
  --image "${docker_registry}/${app_name}:${version}" \
  --region "${region}" \
  --project "${project}" \
  --platform managed \
  --allow-unauthenticated \
  --set-env-vars "ENVIRONMENT=${env},SOME_API_KEY=api_key"
