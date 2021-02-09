# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kasimbaybikov <marvin@42.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/07 21:26:34 by kasimbayb         #+#    #+#              #
#    Updated: 2021/02/09 10:01:57 by rvernon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#docker build . собрать контейнер
#docker run --rm -it -p 80:80 -p 443:443 <id_image>
#docker system prune //удалить все контейнеры

#OS
FROM debian:buster

RUN apt-get update && apt-get install -y nginx \
										 mariadb-server\
										 php-fpm\
										 php-mysql\
										 wget\
										 vim

RUN wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz && tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz

COPY ./srcs/settings.sh ./

CMD bash settings.sh && bash
