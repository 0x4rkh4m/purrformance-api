PYTHON = poetry run python
BLACK = poetry run black
FLAKE8 = poetry run flake8
TEST = poetry run pytest
FASTAPI = poetry run fastapi
CLEAN = find . -type f -name "*.pyc" -delete && find . -type d -name "__pycache__" -delete

.PHONY: install start test lint format clean security all

install:
	@echo "Installing dependencies..."
	poetry install
	@echo "Dependencies installed."

start:
	@echo "Starting the development server..."
	$(FASTAPI) dev src/main.py --reload
	@echo "Server is running."

test:
	@echo "Running tests..."
	$(TEST)
	@echo "Tests completed."

lint:
	@echo "Running code analysis with flake8..."
	$(FLAKE8) src
	@echo "Code analysis completed."

format:
	@echo "Formatting code with black..."
	$(BLACK) src
	@echo "Code formatted."

clean:
	@echo "Cleaning generated files..."
	$(CLEAN)
	@echo "Cleanup completed."

security:
	@echo "Running security analysis with bandit..."
	poetry run bandit -r src
	@echo "Security analysis completed."

all: install lint format test