#!/usr/bin/env bash
set -euo pipefail

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

echo "Starting Ollama..."
docker compose up -d ollama

echo "Waiting for Ollama API..."
until curl -fsS http://localhost:11434/api/tags >/dev/null 2>&1; do sleep 1; done

# Llama 3.1 8B (known-good)
try_pull "llama3.1:8b-instruct-q4_K_M"

# Phi-3 (try a few possibilities)
try_pull \
  "phi3:mini-4k-instruct-q4_K_M" \
  "phi3:mini-128k-instruct-q4_K_M" \
  "phi3:mini-4k-instruct" \
  "phi3:mini-128k-instruct"

# Qwen 2.5 7B (fallbacks)
try_pull \
  "qwen2.5:7b-instruct-q4_K_M" \
  "qwen2.5:7b-instruct-q4_0" \
  "qwen2:7b-instruct-q4_K_M"

echo "Starting WebUI..."
docker compose up -d openwebui
echo "Done. Open http://localhost:3000"
