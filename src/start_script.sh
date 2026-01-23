#!/usr/bin/env bash
set -euo pipefail

# IMPORTANT: keep the runtime reproducible.
# Do NOT `git clone` a template repo during container startup.
# If you need template updates, rebuild the image (CircleCI will do it).
exec bash /start.sh
