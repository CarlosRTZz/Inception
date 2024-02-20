FROM debian:bullseye
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/test.sh /bin/
RUN chmod +x /bin/test.sh

# CMD ["script.sh", "mysqld_safe"];