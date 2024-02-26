all: build

conf:
	mkdir -p ~/data/mariadb_data
	mkdir -p ~/data/wordpress_data

build: clean
	docker-compose -f srcs/docker-compose.yml up -d
# lance le container
up: down
	docker-compose -f srcs/docker-compose.yml up
# arete le container
down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes

.PHONY: all build up down clean