HOSTNAME := $(shell hostname)
USER_ID := $(shell id -u)
GROUP_ID := $(shell id -g)

localenv:
	@if [ "$(shell docker image inspect --format='exists' fastapi-starter-template:latest)" != "exists" ]; then docker-compose build; fi;

compose: localenv
	docker compose up

down:
	docker compose down

test:
	poetry run pytest tests/

rm:
	docker rmi --force fastapi-starter-template || true
	git clean -xdf

.PHONY: devcontainer compose down rm
