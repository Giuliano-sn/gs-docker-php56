#!/bin/bash
clear
echo "********************* ATENÇÃO **********************"
echo
echo "Requisitos para instalação:"
echo
echo "- Docker corretamente instalado"
echo "- Conta no Github corporativo configurada neste computador"
echo
echo "Tecle algo para prosseguir ou CTRL+C para interromper..."
read -n 1

if [ ! -d /var/www/html ];then
    echo "- Criando pasta /var/www/html"
    sudo mkdir -p /var/www/html
else
    echo "- Pasta /var/www/html já existe"
fi
# Criando containers
cd bd
docker stop mysql
docker rm -f mysql
docker build -t mysql .
docker run -d --name mysql mysql
docker stop mysql
cd ..
cd php56
docker stop php56
docker rm -f php56
docker build -t php56 .
docker run -d --name php56 php56
docker stop php56
cd ..
cd php82
docker stop php82
docker rm -f php82
docker build -t php82 .
docker run -d --name php82 php82
docker stop php82
cd ..
# Inicia todos os containers criados de uma vez
docker-compose up -d
# Alterando DNS para encontrar Docker MySQL
docker exec -i php56 sh -c 'echo "10.0.0.12 bd-webcfc.giusoft.com.br" >> /etc/hosts'
docker exec -i php56 sh -c 'echo "10.0.0.17 www.giusoft.com.br webcfc.com.br www.webcfc.com.br" >> /etc/hosts'
# Carregando bases de dados principais
cd bd
docker exec -i mysql sh -c 'exec mysql -uroot webcfc_admin --execute "CREATE USER 'web'@'10.0.0.%' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;"' 
docker exec -i mysql sh -c 'exec mysql -uroot webcfc_admin --execute "CREATE USER 'web'@'%' IDENTIFIED BY 'web';GRANT ALL PRIVILEGES ON * . * TO 'web'@'%';FLUSH PRIVILEGES;' 
docker exec -i mysql sh -c 'exec mysql -uroot webcfc_admin' < webcfc_admin.sql
docker exec -i mysql sh -c 'exec mysql -uroot webcfc_ba_giusoft' < webcfc_ba_giusoft.sql
docker exec -i mysql sh -c 'exec mysql -uroot gadmin' < gadmin.sql
docker exec -i mysql sh -c 'exec mysql -uroot wms_giusoft' < wms_giusoft.sql
cd ..
# Instalando script de OS
sudo cd /var/www/html
if [ ! -f /usr/local/bin/os ];then
    echo "- Instalando arquivo os..."
    cp -f os /usr/local/bin
fi
# Trazendo repositórios
if [ ! -d /var/www/html/gfw ];then
    echo "- Instalando repo gfw..."
    git clone https://github.com/giusoft/gfw
fi
if [ ! -d /var/www/html/webcfc ];then
    echo "- Instalando repo webcfc..."
    git clone https://github.com/giusoft/webcfc
fi
if [ ! -d /var/www/html/wms ];then
    echo "- Instalando repo wms..."
    git clone https://github.com/giusoft/wms
fi

