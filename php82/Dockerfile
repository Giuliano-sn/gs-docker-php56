FROM amd64/php:8.2-apache
LABEL maintainer="giuliano@giusoft.com.br"
RUN apt-get update && apt-get install -y --no-install-recommends vim curl mariadb-client iputils-ping net-tools
RUN echo "ServerName 10.0.0.18" >> /etc/apache2/apache2.conf
RUN docker-php-ext-install -j$(nproc)  pdo pdo_mysql mysqli opcache iconv mbstring soap sockets zip 
RUN echo "10.0.0.12 bd-webcfc.giusoft.com.br" >> /etc/hosts
COPY php.ini /usr/local/etc/php/php.ini
EXPOSE 80
