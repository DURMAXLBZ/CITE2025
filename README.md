# CITE2025 — District Local AI (CPU-only · Offline-friendly)

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Runs Offline](https://img.shields.io/badge/Mode-Offline%20Capable-blue)
![CPU Only](https://img.shields.io/badge/Hardware-CPU--only-lightgrey)

**One-command local AI for schools**: Ollama + Open WebUI running on an 11th-gen i7 / 32GB RAM (or older). Private, fast enough for demos, and no student data leaves your network.

**Project link:** https://github.com/DURMAXLBZ/CITE2025  
**Scan to open:**  
<img src="qr_github.png" width="180" alt="QR to GitHub" />

---

## Quick Start

```bash
git clone https://github.com/DURMAXLBZ/CITE2025.git
cd CITE2025
docker compose up -d
./scripts/bootstrap.sh
# Open http://localhost:3000
