#!/usr/bin/env bash
set -e

echo "[CITE2025] Starting containers..."
docker compose up -d

echo "[CITE2025] Waiting for Ollama to be ready..."
sleep 10

echo "[CITE2025] Pulling default models into Ollama (first run may take a while)..."
docker exec ollama ollama pull llama3.1:8b-instruct-q4_K_M || true
docker exec ollama ollama pull phi3:instruct || true
docker exec ollama ollama pull qwen2.5:7b-instruct || true

echo "[CITE2025] Models installed!"
echo "Open http://localhost:3000 in your browser."
