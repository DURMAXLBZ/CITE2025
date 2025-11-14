# CITE2025 — District Local AI (CPU-only · Offline-friendly)

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Runs Offline](https://img.shields.io/badge/Mode-Offline%20Capable-blue)
![CPU Only](https://img.shields.io/badge/Hardware-CPU--only-lightgrey)

**One-command local AI for schools**: Ollama + Open WebUI running entirely on-prem, CPU-only, and offline-capable.  
Designed for district IT teams who want safe, private AI with **zero cloud dependency**.

Fast enough for demos on an **11th-gen i7 / 32GB RAM** (or older).  
**Absolutely no student data leaves your network.**

---

## 📌 Project Link

**GitHub:** https://github.com/DURMAXLBZ/CITE2025  
**QR Code:**  
<img src="qr_github.png" width="180" alt="QR to GitHub" />

---

# 🚀 Quick Start (Clean Ubuntu Install)

These commands work on **any fresh Ubuntu Desktop or Server** (22.04, 24.04, 25.04, etc).

### 1. Install dependencies (Docker + Compose + Git + Curl)

```bash
sudo apt update -y
sudo apt install -y git curl docker.io docker-compose
sudo systemctl enable --now docker
