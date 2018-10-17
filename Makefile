.PHONY: clean clean-test clean-pyc clean-build  help image local-run local-run-interactive
.DEFAULT_GOAL := help
PYTHON_PKG_NAME=$(shell python setup.py --name)
TAG ?= dummy-python

help:
	@echo "devenv - Creates the dev environment"
	@echo "clean - clean the current environment"
	@echo "lint - Run flake8 linter"
	@echo "coverage - check code coverage"
	@echo "test - runs all unit tests"
	@echo "unittest - run unit tests quickly with the default Python"
	@echo "install - Installs the package"

clean: clean-build clean-pyc clean-test ## remove all build, test, coverage and Python artifacts

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -fr .tox/
	rm -fr .venv/
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache
	rm -fr logs/*

# Sets up the dev virtualenv
devenv: clean
	tox --recreate -e devenv

lint:
	tox -e flake8

test: unittest lint

unittest:
	tox --recreate -e py27

dist: clean
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist

install: clean ## install the package to the active Python's site-packages
	python setup.py install

image:
	docker build --no-cache=false -t $(TAG) .

local-run: image
	docker run --init $(TAG) virtualenv_run/bin/python dummy_python/dummy_python.py

local-run-interactive: image
	docker run --init -it $(TAG) bash
