FROM amd64/php:5.6-apache-stretch
LABEL maintainer="giuliano@giusoft.com.br"
RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's|security.debian.org|archive.debian.org/|g' \
           -e '/stretch-updates/d' /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends vim curl libmemcached-dev libxml2-dev libpq-dev libjpeg-dev libpng*-dev libfreetype6-dev libssl-dev libmcrypt-dev mysql-client iputils-ping net-tools
RUN docker-php-ext-install -j$(nproc) gd pdo_mysql mysql mysqli opcache iconv mbstring mcrypt soap sockets zip 
RUN echo "10.0.0.12 bd-webcfc.giusoft.com.br" >> /etc/hosts
COPY php.ini /usr/local/etc/php.ini
EXPOSE 80
