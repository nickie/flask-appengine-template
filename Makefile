.PHONY: setup venv deps keys run deploy

VIRTUALENV=virtualenv
VIRTUALENV_OPTS=--no-site-packages
VIRTUALENV_DIR=venv

setup: venv

venv:
	test -d $(VIRTUALENV_DIR) \
		|| ($(VIRTUALENV) $(VIRTUALENV_OPTS) $(VIRTUALENV_DIR) || true)
	@echo "Don't forget to: source $(VIRTUALENV_DIR)/bin/activate"

deps:
	pip install -Ur requirements_dev.txt

keys:
	./src/application/generate_keys.py

run:
	dev_appserver.py src/

deploy:
	appcfg.py update src/
