/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smatha <smatha@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/03 14:12:55 by smatha            #+#    #+#             */
/*   Updated: 2020/10/09 14:56:31 by smatha           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdio.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>
# include <stdlib.h>

size_t		ft_strlen(const char *str);
char		*ft_strcpy(char *dest, const char *s);
int			ft_strcmp(const char *s1, const char *s2);
ssize_t		ft_write(int fd, const void *buff, size_t byte);
ssize_t		ft_read(int fd, void *buff, size_t byte);
char		*ft_strdup(const char *s);

#endif
