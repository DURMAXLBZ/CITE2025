#!/usr/bin/env bash
set -euo pipefail

# Detect docker compose command (supports both new and old style)
if docker compose version >/dev/null 2>&1; then
  DC="docker compose"
elif command -v docker-compose >/dev/null 2>&1; then
  DC="docker-compose"
else
  echo "ERROR: Neither 'docker compose' nor 'docker-compose' is installed." >&2
  exit 1
fi

try_pull() {
  local name
  for name in "$@"; do
    echo "Trying to pull: $name"
    if docker exec -i ollama ollama pull "$name"; then
      echo "Pulled: $name"
      return 0
    fi
  done
  echo "WARNING: none of these tags worked: $*" >&2
  return 0  # don't fail the whole script
}

echo "[CITE2025] Starting Ollama container..."
$DC up -d ollama

echo "[CITE2025] Waiting for Ollama API on http://localhost:11434..."
until curl -fsS http://localhost:11434/api/tags >/dev/null 2>&1; do
  sleep 1
done

echo "[CITE2025] Pulling default models (this runs only once per machine)..."

# Llama 3.1 8B – main teaching / demo model
try_pull \
  "llama3.1:8b-instruct-q4_K_M" \
  "llama3.1:latest"

# Phi-3 – small and fast
try_pull \
  "phi3:instruct" \
  "phi3:latest"

# Qwen 2.5 – multilingual / coding capable
try_pull \
  "qwen2.5:7b-instruct" \
  "qwen2.5:latest"

echo "[CITE2025] Starting Open WebUI..."
$DC up -d openwebui

echo
echo "[CITE2025] Done! Open:  http://localhost:3000"
echo "If you don't see models in the dropdown, go to Settings → Models and click 'Sync from Ollama'."
