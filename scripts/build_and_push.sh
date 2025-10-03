#!/bin/bash
set -euo pipefail

version="$1"

# Call build.sh
sh $(dirname "$0")/build.sh "$version"

# Call push.sh
sh $(dirname "$0")/push.sh "$version"