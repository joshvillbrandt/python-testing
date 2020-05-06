default: build test

build:
	docker-compose build

shell:
	docker-compose run app /bin/bash

test:
	docker-compose run app pytest -rA

lint:
	docker-compose run app flake8 app tests
