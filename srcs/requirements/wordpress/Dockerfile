FROM debian:bullseye
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install wget -y
RUN apt-get install -y php7.3 
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y
RUN wget https://fr-be.wordpress.org/latest-fr_BE.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest-fr_BE.tar.gz && rm latest-fr_BE.tar.gz
RUN chown -R root:root /var/www/wordpress