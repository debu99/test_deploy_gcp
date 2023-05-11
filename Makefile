VERSION := 0.0.1
IMAGE_NAME := sample_backend

up: 
	docker-compose up -d --build

logs:
	docker-compose -f docker-compose.yml logs -f --tail 15 

logs-fast:
	docker-compose -f docker-compose.yml logs -f --tail 150 | grep --color=auto fast

stop-fast-local:
	docker stop deploy_local
	docker rm deploy_local

build-fast-local:
	 docker build -f ./fast_api/Dockerfile-local -t deploy_local ./fast_api

run-fast-local: stop-fast-local
	 docker run -t deploy_local:latest