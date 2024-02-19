FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start
RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
RUN mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
RUN mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
RUN mysql -e "FLUSH PRIVILEGES;"
RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
RUN exec mysqld_safe

# RUN service mariadb start
# RUN mariadb -e "CREATE DATABASE IF NOT EXISTS \`salut\`;"
# RUN mariadb -e "CREATE USER IF NOT EXISTS \`test\`@'localhost' IDENTIFIED BY 'test';"
# RUN mariadb -e "GRANT ALL PRIVILEGES ON \`salut\`.* TO \`test\`@'%' IDENTIFIED BY 'test';"
# RUN mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'test';"
# RUN mariadb -e "FLUSH PRIVILEGES;"
# RUN mariadbadmin -u root -ptest shutdown
# RUN exec mariadb_safe