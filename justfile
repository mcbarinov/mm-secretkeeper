default: dev

clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache build dist src/*.egg-info

sync:
    uv sync

format:
    uv run ruff check --select I --fix src tests
    uv run ruff format src tests

lint: format
    uv run ruff check src tests
    uv run mypy src

audit:
    uv run pip-audit
    uv run bandit -r -c "pyproject.toml" src

test:
    uv run pytest tests

dev:
    fastapi dev src/app/server/server.py --port 3000 # uv run uvicorn --reload --port 3000 --log-level warning app.main:server


