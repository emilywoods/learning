.DEFAULT_GOAL := help

.PHONY: install
install: venv ## sets up venv and installs the python app to it
	.venv/bin/pip install --upgrade pip
	.venv/bin/pip install -r requirements.txt

.PHONY: run
run: install ## start app
	.venv/bin/python app.py

.PHONY: docker_build
docker_build:
	docker build -t "my-favourite-tree:latest" . ## build with tag "my-favourite-tree:latest"

.PHONY: docker_run
docker_run: docker_build
	docker run -p 5000:5000 my-favourite-tree:latest ## run image with tag "my-favourite-tree:latest"

.PHONY: build_and_deploy
build_and_deploy: docker_build # build and deploy the application to minikube
	kubectl apply -f manifest.yaml

.PHONY: help
help:
	@echo ""
	@echo "Available targets:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.PHONY: clean
clean: ## clean up afterwards
	rm -rf .venv;

venv:
	python3 -m venv .venv
