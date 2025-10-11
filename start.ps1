Write-Host "🚀 Iniciando Oka Sentinel AI..." -ForegroundColor Cyan

# Cria venv se não existir
if (!(Test-Path ".venv\Scripts\python.exe")) {
    Write-Host "🔧 Criando ambiente virtual..." -ForegroundColor Yellow
    python -m venv .venv
}

# Ativa venv
Write-Host "🧠 Ativando ambiente virtual..." -ForegroundColor Yellow
. .\.venv\Scripts\Activate

# Dependências
Write-Host "📦 Instalando dependências..." -ForegroundColor Yellow
pip install -r requirements.txt

# Treino
Write-Host "🤖 Treinando modelo baseline..." -ForegroundColor Yellow
python ml\models\train_baseline.py

# API
Write-Host "⚙️ Iniciando API (porta 8000)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList '-NoExit','-Command','uvicorn apps.api.main:app --reload --port 8000'

Start-Sleep -Seconds 3

# Web
Write-Host "🌐 Iniciando interface Streamlit (porta 8501)..." -ForegroundColor Yellow
streamlit run apps/webapp/Home.py --server.port 8501

Write-Host "✅ Oka Sentinel AI iniciado!" -ForegroundColor Green
