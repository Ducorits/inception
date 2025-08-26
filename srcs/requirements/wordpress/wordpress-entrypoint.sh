#!/bin/bash
set -e

# Make sure secrets are loaded
if [ -f "/run/secrets/db_password" ]; then
  DB_PASS="$(cat /run/secrets/db_password)"
else
  DB_PASS="$WORDPRESS_DB_PASSWORD"
fi

# Generate wp-config.php if not exists
if [ ! -f /var/www/html/wp-config.php ]; then
  cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

  sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" /var/www/html/wp-config.php
  sed -i "s/username_here/${WORDPRESS_DB_USER}/" /var/www/html/wp-config.php
  sed -i "s/password_here/${DB_PASS}/" /var/www/html/wp-config.php
  sed -i "s/localhost/${WORDPRESS_DB_HOST}/" /var/www/html/wp-config.php
fi

exec "$@"
