#!/bin/bash
set -x

echo "Waiting MariaDB..."
sleep 10

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress

if [ ! -f "wp-config.php" ]; then
    echo "Download WordPress..."
    wp core download --allow-root --force

    echo "create config..."
    wp config create --dbname=$DB_NAME --dbuser=$MYSQL_ADMIN_USER \
        --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root

    echo "Install wordpress..."
    wp core install --url=igvisera.42.fr --title=Inception \
        --admin_user=$MYSQL_ADMIN_USER --admin_password=$MYSQL_PASSWORD \
        --admin_email=info@example.com --allow-root

    wp theme install inspiro --activate --allow-root
fi

# fix 403 Forbidden (permission problems)
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

exec php-fpm7.3 --nodaemonize

