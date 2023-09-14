FROM amd64/mysql:8.0.27
LABEL maintainer="giusoft@hotmail.com"
RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's|security.debian.org|archive.debian.org/|g' \
           -e '/stretch-updates/d' /etc/apt/sources.list
#RUN apt-get update && apt-get install -y --no-install-recommends vim mysql-client
# "CREATE USER 'web'@'%' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;"
COPY my.cnf /etc/
EXPOSE 3306
