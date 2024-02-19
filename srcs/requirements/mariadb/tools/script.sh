#!/bin/bash

service mariadb start

mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS salut;
CREATE USER IF NOT EXISTS 'utilisateur'@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON salut.* TO 'utilisateur'@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON salut.* TO 'root'@'%' IDENTIFIED BY 'passroot';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('passroot');
EOF

sleep 5

service mariadb stop

exec $@