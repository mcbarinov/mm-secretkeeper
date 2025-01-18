version := `uv run python -c 'import tomllib; print(tomllib.load(open("pyproject.toml", "rb"))["project"]["version"])'`

default: dev

clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache build dist src/*.egg-info

build: clean
    uv build --wheel

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

publish: build lint audit test
    git diff-index --quiet HEAD
    uvx twine upload dist/**
    git tag -a 'v{{version}}' -m 'v{{version}}'
    git push origin v{{version}}


dev:
    fastapi dev src/mm_secretkeeper/http_server.py --port 3000
