# CITE2025 — District Local AI (CPU-only · Offline-friendly)

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Runs Offline](https://img.shields.io/badge/Mode-Offline%20Capable-blue)
![CPU Only](https://img.shields.io/badge/Hardware-CPU--only-lightgrey)

**One-command local AI for schools**: Ollama + Open WebUI running entirely on-prem and CPU-only.  
Fast enough for demos on an 11th-gen i7 / 32GB RAM — and **no student data ever leaves your network.**

**Project link:** https://github.com/DURMAXLBZ/CITE2025  
**Scan to open:**  
<img src="qr_github.png" width="180" alt="QR to GitHub" />

---

## ⚠️ Prerequisites (Required)

Before running the Quick Start below, **please ensure your system already has:**

- **Docker**
- **Docker Compose V2** 
- **Git**
- **curl**

💡 *If you're using a fresh Ubuntu install, install these first.*

---

## 🚀 Quick Start

```bash
# Copy and paste the following to download the repo:
git clone https://github.com/DURMAXLBZ/CITE2025.git
cd CITE2025

# Start containers (Ollama + Open WebUI)
docker compose up -d

# Run the following
chmod +x run_demo.sh
./run_demo.sh

# Open in your browser:
http://localhost:3000
```
🎬 Demo Video — See CITE2025 in Action

A complete walkthrough showing exactly what happens when you run the CITE2025 one-command setup on real district hardware.

CPU-only Ollama deployment

Automatic OpenWebUI launch

One-command local AI environment

100% offline-friendly

No student data transmitted or stored externally

Fast startup on standard district hardware

📥 Download the demo video (MP4)
https://github.com/DURMAXLBZ/CITE2025/releases/latest/download/CITE2025.mp4
