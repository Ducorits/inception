FROM debian:bullseye-slim

# docker can cache the first RUN
RUN apt-get update && apt-get install -y
RUN apt-get install -y \
	php php-fpm php-mysql mariadb-client wget curl unzip inetutils-ping \
	&& rm -rf /var/lib/apt/lists/*

# Install WordPress (latest stable tarball)
WORKDIR /var/www/html
RUN curl -O https://wordpress.org/latest.tar.gz \
	&& tar -xzf latest.tar.gz --strip-components=1 \
	&& rm latest.tar.gz \
	&& mkdir -p /run/php \
	&& sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf \
	&& chown -R www-data:www-data /var/www/html
RUN curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
	&& chmod +x /usr/local/bin/wp



# Copy PHP-FPM pool config later if needed
EXPOSE 9000

COPY wordpress-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress-entrypoint.sh
ENTRYPOINT ["wordpress-entrypoint.sh"]
CMD ["php-fpm7.4", "-F"]