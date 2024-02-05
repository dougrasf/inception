FROM debian:bullseye

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

WORKDIR /var/www/html/

RUN apt update -y && apt upgrade -y && apt install -y \
	php-fpm \
	php-mysql \
	mariadb-client -y \
	wget

RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 777 /var/www/html/

RUN sed -i.default "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
	/etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

COPY tools/wordpress.sh /var/www/html/

RUN chmod 777 wordpress.sh && ./wordpress.sh && rm wordpress.sh

RUN mkdir -p /run/php

RUN ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

EXPOSE 9000

CMD ["php-fpm", "-F"]
