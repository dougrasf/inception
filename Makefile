all:
	sudo mkdir -p /home/dofranci/data/wordpress
	sudo mkdir -p /home/dofranci/data/mariadb
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re: clean all

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	sudo rm -rf /home/dofranci/data

.PHONY: all re down clean