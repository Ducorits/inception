FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y
RUN apt-get install -y \
	nginx openssl \
	&& rm -rf /var/lib/apt/lists/*

# Self-signed TLS certificate (for now, later replace with proper certs)
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=NL/ST=DenHaag/L=DenHaag/O=42/OU=Student/CN=localhost"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
