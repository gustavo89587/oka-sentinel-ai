<div align="center">

# 🛡️ Oka Sentinel AI  
**Detecção de Phishing & URLs Maliciosas com ML + Explainability + MLOps**

[![CI](https://img.shields.io/github/actions/workflow/status/gustavo89587/oka-sentinel-ai/ci.yml?label=CI&logo=github)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](LICENSE)
[![Made with Python](https://img.shields.io/badge/Python-3.11-blue.svg)](#)
[![FastAPI](https://img.shields.io/badge/FastAPI-🚀-green.svg)](#)
[![Streamlit](https://img.shields.io/badge/Streamlit-app-red.svg)](#)

**Autor:** Gustavo Okamoto de Carvalho — [Okamoto Security Labs](https://github.com/gustavo89587) · [LinkedIn](https://www.linkedin.com/in/gustavo-okamoto-de-carvalho-ti) · <a href="mailto:gugaokamoto1@gmail.com">gugaokamoto1@gmail.com</a>

</div>

## ✨ Pitch (15s)
Plataforma open‑source que combina **ML clássico** + **LLM (opcional)** para detectar **phishing** (texto, e‑mail, URL e imagem de página), classificar **URLs maliciosas** e sinalizar **anomalias** — com **explainability (SHAP)**, **dashboard** e **pipeline MLOps**. 

---

## 🧱 Arquitetura
```
apps/
  webapp/   # Streamlit (demo e dashboard)
  api/      # FastAPI: /predict, /health
ml/
  features/ models/ data/ evaluation/ registry/
infra/
  docker/ ci/ helm/
scripts/ tests/ docs/
```
![Arquitetura](docs/assets/architecture.png)

---

## 🚀 Demo Rápida
```bash
make train      # treina baseline (dados sintéticos de exemplo)
make up         # sobe API (FastAPI) em :8000 e Web (Streamlit) em :8501
```
- API: http://localhost:8000/docs  
- Web: http://localhost:8501

---

## 📊 Métricas (baseline sintético)
- Foco em **Recall alto** com **Precisão aceitável** (evitar falsos‑negativos).
- ROC‑AUC esperado em >0.90 em dataset sintético balanceado.
![Precision-Recall (dummy)](docs/assets/metrics_pr.png)

---

## 🔍 Explainability
- **Top features** por predição (SHAP) e JSON com atributos de URL.
- Permite inspecionar por que uma URL foi marcada como suspeita.

---

## 🧪 Testes & Qualidade
- `pytest` básico (placeholder) em `./tests`  
- Recomendado: ruff, black e mypy (ativados no CI)

---

## 🛡️ Segurança da Demo
- **Sem** acesso a páginas maliciosas reais.
- Dados **sintéticos** + listas sanitizadas em modo demo.
- Sanitização de input e rate limiting recomendados (hardening fora do MVP).

---

## 🧰 Como Rodar (sem Docker)
```bash
python -m venv .venv && source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
python ml/models/train_baseline.py
uvicorn apps.api.main:app --reload --port 8000
# Em outro terminal:
streamlit run apps/webapp/Home.py --server.port 8501
```

## 🐳 Docker
```bash
docker compose up --build
```

---

## 🗺️ Roadmap Curto
- Feedback loop (corrigir rótulo → retrain agendado)
- MLflow tracking/registry
- Integração LLM (racional curto) e OCR opcional
- Active learning semanal

---

## 👤 Sobre
Criado por **Gustavo Okamoto de Carvalho** — [Okamoto Security Labs](https://github.com/gustavo89587) · [LinkedIn](https://www.linkedin.com/in/gustavo-okamoto-de-carvalho-ti) · <a href="mailto:gugaokamoto1@gmail.com">gugaokamoto1@gmail.com</a>  
Se isso te ajudou, deixa uma ⭐ no repo e me chama para trocar ideia sobre **Cybersecurity + IA**.

## 📄 Licença
MIT — veja `LICENSE`.
