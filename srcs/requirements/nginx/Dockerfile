FROM debian:bullseye
RUN apt-get update -y
# RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=BE/L=Bruxelles/O=42/OU=42/CN=cortiz.42.fr/UID=login"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]