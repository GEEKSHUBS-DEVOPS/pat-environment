start:
	echo "Launch containers"
	docker compose -f ./deploy/develop/docker-compose.yaml up -d
	docker compose -f ./deploy/develop/docker-compose.yaml logs -f

restart:
	echo "Destroy containers"
	docker compose -f ./deploy/develop/docker-compose.yaml down --remove-orphans
	echo "Launch containers"
	docker compose -f ./deploy/develop/docker-compose.yaml up -d
	docker compose -f ./deploy/develop/docker-compose.yaml logs -f

nest-cli:
	docker compose -f ./deploy/tools/docker-compose.yaml run -it --rm nest-cli

angular-cli:
	docker compose -f ./deploy/tools/docker-compose.yaml run -it --rm angular-cli

install:
	docker compose -f ./deploy/tools/docker-compose.yaml run -it --rm -w /app/backend nest-cli npm i
	docker compose -f ./deploy/tools/docker-compose.yaml run -it --rm -w /app/frontend angular-cli npm i
	docker compose -f ./deploy/tools/docker-compose.yaml run -it --rm -w /app/admin-panel angular-cli npm i

build:
	docker compose -f ./deploy/develop/docker-compose.yaml build --no-cache

publish:
	@read -p "Enter project to publish: " project; \
	read -p "Enter version to publish: " version; \
	docker build -t davidpestana/pat-$$project:$$version -f ./src/$$project/Dockerfile ./src/$$project/ && \
	docker push davidpestana/pat-$$project:$$version

cleanup:
	docker rm -f $$(docker ps -aq)