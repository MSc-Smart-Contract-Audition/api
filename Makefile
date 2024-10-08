# Define the Python interpreter and the virtual environment directory
PYTHON := python3
VENV := .venv

# Define the source directory
SRC_DIR := .

# Define the requirements file
REQUIREMENTS := requirements.txt

# Target for creating a virtual environment
$(VENV)/bin/activate:
	$(PYTHON) -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip

# Target for installing dependencies
.PHONY: install
install: $(VENV)/bin/activate
	$(VENV)/bin/pip install -r $(REQUIREMENTS)

# Target for running the API server
.PHONY: run
run: $(VENV)/bin/activate
	$(VENV)/bin/uvicorn main:app --host 0.0.0.0 --port 8000 --reload

# Target for cleaning the virtual environment
.PHONY: clean
clean:
	rm -rf $(VENV)

# Default target
.DEFAULT_GOAL := run
