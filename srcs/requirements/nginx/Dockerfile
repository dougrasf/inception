FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	nginx \
	openssl 

RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=BR/ST=SP/L=SP/O=42/CN=localhost" \
	-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.3;/' /etc/nginx/nginx.conf

COPY conf.d/https.conf /etc/nginx/conf.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]