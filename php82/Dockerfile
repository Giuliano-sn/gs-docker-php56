FROM amd64/php:8.2-apache
LABEL maintainer="giuliano@giusoft.com.br"
RUN apt-get update && apt-get install -y --no-install-recommends vim curl iputils-ping net-tools
#RUN docker-php-ext-install -j$(nproc) gd pdo_mysql mysql mysqli opcache iconv mbstring mcrypt soap sockets zip 
#COPY php.ini /usr/local/etc/php.ini
EXPOSE 80
