@echo off
setlocal enabledelayedexpansion
title Oka Sentinel AI

echo 🚀 Iniciando Oka Sentinel AI...

REM cria venv se nao existir
if not exist ".venv\Scripts\python.exe" (
  echo 🔧 Criando ambiente virtual...
  py -3 -m venv .venv 2>nul || python -m venv .venv
)

set PYVENV=.venv\Scripts\python.exe

echo 📦 Instalando dependencias...
"%PYVENV%" -m pip install -r requirements.txt

echo 🤖 Treinando baseline...
"%PYVENV%" ml\models\train_baseline.py

echo ⚙️ Subindo API (porta 8000)...
start "Oka API" "%PYVENV%" -m uvicorn apps.api.main:app --reload --port 8000

timeout /t 3 >nul

echo 🌐 Abrindo Streamlit (porta 8501)...
"%PYVENV%" -m streamlit run apps/webapp/Home.py --server.port 8501

echo ✅ Oka Sentinel AI iniciado!
