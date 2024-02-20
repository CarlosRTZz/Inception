#!/bin/bash

service mariadb start

mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS \`database\`;
CREATE USER IF NOT EXISTS \`utilisateur\`@'localhost' IDENTIFIED BY 'motdepasse';
GRANT ALL PRIVILEGES ON \`database\`.* TO \`utilisateur\`@'%' IDENTIFIED BY 'motdepasse';
GRANT ALL PRIVILEGES ON \`database\`.* TO \`root\`@'%' IDENTIFIED BY 'motdepasseroot';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('motdepasseroot');
FLUSH PRIVILEGES;
EOF

sleep 5

service mariadb stop

exec $@