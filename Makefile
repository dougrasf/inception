LOGIN = dofranci

all:
	sudo mkdir -p /home/$(LOGIN)/data/wordpress
	sudo mkdir -p /home/$(LOGIN)/data/mariadb
	echo "127.0.0.1 $(LOGIN).42.fr" | sudo tee --append /etc/hosts
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re: clean all

clean: down
	- docker rmi -f mariadb wordpress nginx
	- docker volume rm inception_mariadb inception_wordpress
	- sudo rm -rf /home/$(LOGIN)/data
	- sudo sed -i "s/127.0.0.1 $(LOGIN).42.fr//g" /etc/hosts
.PHONY: all re down clean
