# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smatha <smatha@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/03 14:24:26 by smatha            #+#    #+#              #
#    Updated: 2020/10/09 15:06:12 by smatha           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =  libasm.a

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJECTS = $(SRCS:.s=.o)

%.o	: %.s
	nasm -f macho64 $< -o $@

all:	$(NAME)

$(NAME):		$(OBJECTS)
				ar rcs $(NAME) $(OBJECTS)

clean:
	rm -rf $(OBJECTS)

try: all
	@touch test
	@echo "Ceci est un test" > test
	gcc -Wall -Wextra -Werror -I./libasm.h libasm.a main.c -o try_libasm
	./try_libasm

fclean:			clean
				rm -rf $(NAME)
				rm -f try_libasm
				rm -f test

re:		fclean all
