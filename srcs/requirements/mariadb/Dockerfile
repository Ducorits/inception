FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
	mariadb-server\
	&& rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["mysqld_safe"]