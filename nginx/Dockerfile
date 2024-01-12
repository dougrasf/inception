FROM alpine:3.17.6

#RUN	apk add --no-cache openrc; mkdir /run/openrc; touch /run/openrc/softlevel

RUN	apk update; apk upgrade;\
	apk add --no-cache nginx openssl ;\
	mkdir -p /var/www/html/

COPY	./conf/conf.d /etc/nginx/conf.d

RUN	adduser -D -g 'www' www;\
	chown -R www:www /run/nginx/;\
	chown -R www:www /var/www/html/

RUN	apk add --no-cache openssl; mkdir /etc/nginx/ssl; openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/vbachele.crt \
	-keyout /etc/nginx/ssl/vbachele.key \
	-subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42/OU=42 Sao Paulo/CN=dofranci/"

EXPOSE	443

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

