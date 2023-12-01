FROM amd64/mysql:8.0.34-debian
LABEL maintainer="giuliano@giusoft.com.br"
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes
ENV MYSQL_USER=web
ENV MYSQL_PASSWORD=web
RUN apt-get update && apt-get install -y --no-install-recommends vim mysql-client
COPY my.cnf /etc/
# RUN mysql --execute "CREATE USER 'web'@'localhost' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;"
# RUN mysql --execute "CREATE USER 'web'@'10.0.0.%' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;"
# RUN mysql --execute "CREATE USER 'web'@'%' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;"
# RUN mysql --execute "CREATE DATABASE gadmin;CREATE DATABASE wms_giusoft;CREATE DATABASE webcfc_admin;CREATE DATABASE webcfc_ba_giusoft"
# RUN mysql webcfc_admin < /tmp/webcfc_admin.sql
# RUN mysql webcfc_ba_giusoft < /tmp/webcfc_ba_giusoft.sql
# RUN mysql gadmin < /tmp/gadmin.sql
# RUN mysql wms_giusoft < /tmp/wms_giusoft.sql
EXPOSE 3306
