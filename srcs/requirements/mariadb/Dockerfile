FROM debian:bullseye

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

RUN echo "[mysqld] \n\
skip-networking=0 \n\
bind-address = 0.0.0.0" >> /etc/mysql/my.cnf

RUN service mariadb start && \
	mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE; \
	CREATE USER '$WORDPRESS_USER'@'%' identified by '$WORDPRESS_PASSWORD'; \
	GRANT ALL ON $WORDPRESS_DATABASE.* TO '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWORD'; \
	FLUSH PRIVILEGES;" && \
	service mariadb stop

EXPOSE 3306

CMD ["mysqld_safe"]
