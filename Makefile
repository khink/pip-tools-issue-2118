ENV = env
BIN = $(ENV)/bin
PYTHON_VERSION = 3.11
PYTHON = $(BIN)/python$(PYTHON_VERSION)

$(ENV):
	$(shell which python$(PYTHON_VERSION)) -m venv $(ENV)
	$(PYTHON) -m pip install --upgrade pip wheel setuptools pip-tools

clean:
	rm -f -r env/

.PHONY: requirements
requirements: $(ENV)
	CUSTOM_COMPILE_COMMAND="make requirements" $(BIN)/pip-compile --resolver=backtracking --generate-hashes --allow-unsafe --output-file requirements.txt requirements.in
