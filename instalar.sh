#!/bin/bash
sudo mkdir -p /var/www/html
sudo cd /var/www/html
if [ ! -f /usr/local/bin/os ];then
    cp -f os /usr/local/bin
fi
if [ ! -d /var/www/html/gfw ];then
    git clone https://github.com/giusoft/gfw
fi
if [ ! -d /var/www/html/webcfc ];then
    git clone https://github.com/giusoft/webcfc
fi
if [ ! -d /var/www/html/wms ];then
    git clone https://github.com/giusoft/wms
fi
