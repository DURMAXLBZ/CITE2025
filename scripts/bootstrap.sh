#!/usr/bin/env bash
set -euo pipefail

# Models sized for CPU-only, fast-enough on 11th-gen i7:
# - Llama 3.1 8B Instruct (Q4_K_M) – balanced
# - Phi-3 Mini Instruct (Q4_K_M) – tiny, very quick
# - Qwen2.5 7B Instruct (Q4_K_M) – strong reasoning for its size

MODELS=(
  "llama3.1:8b-instruct-q4_K_M"
  "phi3:instruct-q4_K_M"
  "qwen2.5:7b-instruct-q4_K_M"
)

echo "Starting Ollama..."
docker compose up -d ollama

echo "Waiting for Ollama API..."
until curl -fsS http://localhost:11434/api/tags >/dev/null 2>&1; do
  sleep 1
done

for m in "${MODELS[@]}"; do
  echo "Pulling $m ..."
  docker exec -it ollama ollama pull "$m"
done

echo "All models pulled."
echo "Starting WebUI..."
docker compose up -d openwebui

echo "Done. Open http://localhost:3000"
