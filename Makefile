# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: dritsema <dritsema@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2025/08/20 14:31:52 by dritsema      #+#    #+#                  #
#    Updated: 2025/08/27 14:03:02 by dritsema      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

all: setup
	docker-compose -f srcs/docker-compose.yml up --build -d

setup:
	mkdir -p $(HOME)/data/db
	mkdir -p $(HOME)/data/wp

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -af --volumes

fclean: clean
	docker volume rm srcs_db_data srcs_wp_data || true

re: fclean all