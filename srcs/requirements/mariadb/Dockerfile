FROM debian:bullseye

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

RUN echo "[mysqld] \n\
skip-networking=0 \n\
bind-address = 0.0.0.0" >> /etc/mysql/my.cnf; \
 	sed -i 's/^socket = \/run\/mysqld\/mysqld\.sock/# &/' /etc/mysql/my.cnf; \
 	sed -i "s/# port = 3306/port = 3306/g" /etc/mysql/my.cnf

COPY ./tools/dump.sql /tmp/dump.sql

RUN service mariadb start && \
	mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE; \
	CREATE USER '$WORDPRESS_USER'@'%' identified by '$WORDPRESS_PASSWORD'; \
	GRANT ALL ON $WORDPRESS_DATABASE.* TO '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWORD'; \
	FLUSH PRIVILEGES;" && \
	mariadb -u root $WORDPRESS_DATABASE < /tmp/dump.sql && \
	service mariadb stop

EXPOSE 3306

CMD ["mysqld_safe"]
