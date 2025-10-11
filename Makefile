init:
	python -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt
train:
	python ml/models/train_baseline.py
up:
	docker compose up --build
test:
	pytest -q || echo "Adicione testes em ./tests"
