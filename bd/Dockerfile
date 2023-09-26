FROM amd64/mysql:8.0.27
LABEL maintainer="giusoft@hotmail.com"
RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's|security.debian.org|archive.debian.org/|g' \
           -e '/stretch-updates/d' /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends vim mysql-client
COPY my.cnf /etc/
COPY webcfc_admin.sql /tmp
COPY webcfc_ba_giusoft.sql /tmp
COPY wms_giusoft.sql /tmp
COPY gadmin.sql /tmp
RUN mysql --execute "CREATE USER 'web'@'localhost' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;"
RUN mysql --execute "CREATE USER 'web'@'10.0.0.%' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;"
RUN mysql --execute "CREATE USER 'web'@'%' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;"
RUN mysql --execute "CREATE DATABASE gadmin;CREATE DATABASE wms_giusoft;CREATE DATABASE webcfc_admin;CREATE DATABASE webcfc_ba_giusoft"
RUN mysql webcfc_admin < /tmp/webcfc_admin.sql
RUN mysql webcfc_ba_giusoft < /tmp/webcfc_ba_giusoft.sql
RUN mysql gadmin < /tmp/gadmin.sql
RUN mysql wms_giusoft < /tmp/wms_giusoft.sql
EXPOSE 3306
