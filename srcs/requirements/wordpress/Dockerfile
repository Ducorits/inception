FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
	php-fpm php-mysql wget curl unzip \
	&& rm -rf /var/lib/apt/lists/*

# Install WordPress (latest stable tarball)
WORKDIR /var/www/html
RUN curl -O https://wordpress.org/latest.tar.gz \
	&& tar -xzf latest.tar.gz --strip-components=1 \
	&& rm latest.tar.gz

# Copy PHP-FPM pool config later if needed
EXPOSE 9000

CMD ["php-fpm7.4", "-F"]