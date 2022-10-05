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


build:
	docker compose -f ./deploy/develop/docker-compose.yaml build --no-cache


cleanup:
	docker rm -f $$(docker ps -aq)

opcion2:
	la -h