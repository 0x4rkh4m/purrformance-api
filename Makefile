PYTHON = poetry run python
BLACK = poetry run black
FLAKE8 = poetry run flake8
TEST = poetry run pytest
CLEAN = find . -type f -name "*.pyc" -delete && find . -type d -name "__pycache__" -delete

.PHONY: install start test lint format clean

install:
	@echo "Instalando dependencias..."
	poetry install
	@echo "Dependencias instaladas."

start:
	@echo "Iniciando el servidor de desarrollo..."
	poetry fastapi dev src/main.py
	@echo "Servidor en ejecución"

test:
	@echo "Ejecutando pruebas..."
	$(TEST)
	@echo "Pruebas completadas."

lint:
	@echo "Ejecutando análisis de código con flake8..."
	$(FLAKE8) src
	@echo "Análisis completado."

format:
	@echo "Formateando el código con black..."
	$(BLACK) src
	@echo "Código formateado."

clean:
	@echo "Limpiando archivos generados..."
	$(CLEAN)
	@echo "Limpieza completada."

security:
	@echo "Ejecutando análisis de seguridad con bandit..."
	poetry run bandit -r src
	@echo "Análisis de seguridad completado."

all: install lint format test

# Default target
all
