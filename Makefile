all: build

build: clean
	sudo docker-compose up -d
# lance le container
up: down
	sudo docker-compose up
# arete le container
down:
	sudo docker-compose down

clean:
	sudo docker-compose down --rmi all --volumes

.PHONY: all build up down clean

.SILENT: