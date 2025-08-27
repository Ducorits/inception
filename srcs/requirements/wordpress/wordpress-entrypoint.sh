#!/bin/bash
set -e

# Read secrets
if [[ -n $DB_PASSWORD_FILE && -f $DB_PASSWORD_FILE ]]; then
  DB_PASS=$(cat "$DB_PASSWORD_FILE")
fi

if [[ -n $WP_ADMIN_PASSWORD_FILE && -f $WP_ADMIN_PASSWORD_FILE ]]; then
  WP_ADMIN_PASS=$(cat "$WP_ADMIN_PASSWORD_FILE")
fi

echo Initializing...
echo "Waiting for database..."
until mariadb-admin ping -h"$DB_HOST" --silent; do
    sleep 1
done
echo "Database connection: OK"

# Only install if not already installed
if ! wp core is-installed --allow-root; then
  echo "Creating wordpress config..."
  wp config create \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_PASS" \
    --dbhost="$DB_HOST" \
    --force \
    --allow-root \
    --path=/var/www/html

  echo "Installing wordpress core..."
  wp core install \
    --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN" \
    --admin_password="$WP_ADMIN_PASS" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --allow-root \
    --path=/var/www/html

  # # Optionally: create extra users
  # echo "Adding users..."
  # wp user create "$WP_USER" "$WP_USER_EMAIL" \
  #   --role=author \
  #   --user_pass="$WP_USER_PASS" \
  #   --allow-root \
  #   --path=/var/www/html
  else
    echo "Wordpress already installed, skipping..."
fi

echo "Starting PHP-FPM..."
exec php-fpm7.4 -F
