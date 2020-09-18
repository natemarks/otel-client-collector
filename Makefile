.PHONY: docker-clean docker-build-clean docker-build docker-shell

docker-clean:
	-docker-compose rm -f;exit 0 # remove containers
	-docker rmi $$(docker images --format '{{.Repository}}:{{.Tag}}' | grep 'otel-collector')


docker-build-clean: docker-clean
	docker-compose build

docker-build:
	docker-compose build

docker-start:
	docker-compose up -d

docker-stop:
	docker-compose down --rmi all
