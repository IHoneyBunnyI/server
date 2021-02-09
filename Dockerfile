# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kasimbaybikov <marvin@42.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/07 21:26:34 by kasimbayb         #+#    #+#              #
#    Updated: 2021/02/09 03:04:58 by rvernon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y nginx && apt-get install -y mariadb-server && apt-get install -y php-fpm php-mysql 

CMD bash && echo lalala
