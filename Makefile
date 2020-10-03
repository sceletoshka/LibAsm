# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smatha <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/03 14:24:26 by smatha            #+#    #+#              #
#    Updated: 2020/10/03 14:29:32 by smatha           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =  libasm.a

SRCS = ft_strlen.s, ft_strcpy.s, ft_strcmp.s, ft_write.s, ft_read.s, ft_strdup.s

OBJECTS = $(SRCS:.s=.o) 

all:

clean:

fclean:

re:
