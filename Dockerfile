# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kasimbaybikov <marvin@42.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/07 21:26:34 by kasimbayb         #+#    #+#              #
#    Updated: 2021/02/09 17:52:43 by rvernon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#docker build . собрать контейнер
#docker run --rm -it -p 80:80 -p 443:443 <id_image>
#docker system prune //удалить все контейнеры

#OS
FROM debian:buster

RUN apt-get update && apt-get install -y nginx \
										 mariadb-server\
										 php7.3\
										 php-fpm\
										 php-mysql\
										 wget\
										 vim

RUN wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz && tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz
#/etc/init.d/mysql start для запуска mariaDB

RUN cp -r wordpress/ var/www/html/wordpress/ && cp -r phpMyAdmin-4.9.7-all-languages var/www/html/phpMyAdmin/

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21Moscow/CN=rvernon" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

COPY ./srcs/settings.sh ./
COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/wp-config.php /var/www/html/wordpress/
COPY ./srcs/config.inc.php /var/www/html/phpMyAdmin/

RUN chown -R www-data:www-data var/www/html
RUN chmod -R 755 /var/www/*

CMD bash settings.sh && bash
