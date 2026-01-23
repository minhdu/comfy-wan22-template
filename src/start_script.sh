#!/usr/bin/env bash
set -euo pipefail

# Optional GPU self-test (runs only when NVIDIA driver is present)
if command -v nvidia-smi >/dev/null 2>&1; then
  echo "[startup] NVIDIA detected, testing TensorRT Builder..."
  /opt/venv/bin/python - <<'PY' || true
import tensorrt as trt
print("TRT", trt.__version__, trt.__file__)
trt.Builder(trt.Logger())
print("Builder OK")
PY
else
  echo "[startup] No NVIDIA driver detected; skipping TensorRT Builder test."
fi

# IMPORTANT: keep the runtime reproducible.
# Do NOT `git clone` a template repo during container startup.
# If you need template updates, rebuild the image (CircleCI will do it).
exec bash /start.sh
