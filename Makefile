.PHONY: help push lab01 lab02 lab03 lab04

TODAY := $(shell date +"%m-%d")

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

push: ## pushes changes to git
	git add -A
	git commit -m "update repo $(TODAY)" --allow-empty
	git pull origin main
	git push origin main

lab01: ## lab01
	otter assign --no-run-tests src/lab01/lab01.ipynb .otter-build
	mkdir -p lab01
	mv .otter-build/student/* lab01/
	rm -rf .otter-build

lab04: ## lab04
	otter assign --no-run-tests src/lab04/lab04.ipynb .otter-build
	mkdir -p lab04
	mv .otter-build/student/* lab04/
	rm -rf .otter-build
