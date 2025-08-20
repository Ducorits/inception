# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: dritsema <dritsema@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2025/08/20 14:31:52 by dritsema      #+#    #+#                  #
#    Updated: 2025/08/20 14:33:45 by dritsema      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

all:
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -af --volumes

fclean: clean
	docker volume rm inception_db_data inception_wp_data || true

re: fclean all