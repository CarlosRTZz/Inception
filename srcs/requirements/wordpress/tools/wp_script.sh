#!/bin/sh

#pause execution for 10 seconds to be sure db is created
sleep 10

# Listen to 9000
sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf

echo "je cd dans wordpress"

cd /var/www/wordpress

echo $PWD

echo "JE CONFIG"

# Config Wordpress
wp config create \
		--dbname="${DB_NAME}" \
		--dbuser="${DB_USER}" \
		--dbpass="${DB_PASSWORD}" \
		--dbhost="${DB_HOST}" \
        --allow-root

echo "c'est config"
echo "j'installe"

# Install WordPress
wp core install --url="${DOMAIN_NAME}" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_ADMIN_USER}" \
    --admin_password="${WP_ADMIN_PASSWORD}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --allow-root

echo "c'est install"
echo "j'insatlle un user wp"

# Add new WordPress user
wp user create "$WP_USER" "$WP_EMAIL" \
    --user_pass="${WP_PASSWORD}" \
    --role="${WP_ROLE}" \
    --allow-root

echo "SA FONCTIONNE"

# Start PHP FastCGI Process Manager
# PHP-FPM is responsible for handling PHP requests.
/usr/sbin/php-fpm7.4 -F -R