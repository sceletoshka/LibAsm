/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smatha <smatha@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/09 14:19:20 by smatha            #+#    #+#             */
/*   Updated: 2020/11/03 21:56:48 by smatha           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include "libasm.h"

#define FT_STR "test string test string test string test string test string"
#define FT_LSTR FT_STR FT_STR FT_STR FT_STR FT_STR FT_STR FT_STR FT_STR FT_STR
#define FT_LLSTR FT_LSTR FT_LSTR FT_LSTR FT_LSTR FT_LSTR FT_LSTR FT_LSTR FT_LSTR

void	test_len()
{
	char *s1 = "test";
	char *s2 = "";
	printf("------FT_STRLEN TESTING------\n");
	printf("string = %s\nSYS - %zu\n FT - %zu\n\n", s1, strlen(s1), ft_strlen(s1));
	printf("string = %s\nSYS - %zu\n FT - %zu\n\n", s2, strlen(s2), ft_strlen(s2));
	printf("string = %s\nSYS - %zu\n FT - %zu\n\n", FT_LLSTR, strlen(FT_LLSTR), ft_strlen(FT_LLSTR));
	printf("-------------END-------------\n\n\n\n\n\n");
}

void	test_cpy()
{
	printf("------FT_STRCPY TESTING------\n");
	char	*src1 = "test";
	char	*src2 = "";
	char	*src3 = FT_LLSTR;
	char	dst11[ft_strlen(src1) + 1];
	char	dst12[ft_strlen(src1) + 1];
	char	dst21[ft_strlen(src2) + 1];
	char	dst22[ft_strlen(src2) + 1];
	char	dst31[ft_strlen(src3) + 1];
	char	dst32[ft_strlen(src3) + 1];

	printf("orig:\n%s\n", src1);
	printf(" SYS:\n%s\n", strcpy(dst11, src1));
	printf("  FT:\n%s\n\n", ft_strcpy(dst12, src1));

	printf("orig:\n%s\n", src2);
	printf(" SYS:\n%s\n", strcpy(dst21, src2));
	printf("  FT:\n%s\n\n", ft_strcpy(dst22, src2));

	printf("orig:\n%s\n", src3);
	printf(" SYS:\n%s\n", strcpy(dst31, src3));
	printf("  FT:\n%s\n\n", ft_strcpy(dst32, src3));
	printf("-------------END-------------\n\n\n\n\n\n");
}

void	test_cmp()
{
	printf("------FT_STRCMP TESTING------\n");
	char	*s11 = "test";
	char	*s12 = "test";
	char	*s21 = "";
	char	*s22 = "0";
	char	*s31 = FT_LLSTR;
	char	*s32 = FT_LLSTR "ihihihihi";
	char	*s41 = "0";
	char	*s42 = "";

	printf("s1:\n%s\ns2:\n%s\n", s11, s12);
	printf(" SYS: %d\n", strcmp(s11, s12));
	printf("  FT: %d\n\n", ft_strcmp(s11, s12));

	printf("s1:\n%s\ns2:\n%s\n", s21, s22);
	printf(" SYS: %d\n", strcmp(s21, s22));
	printf("  FT: %d\n\n", ft_strcmp(s21, s22));

	printf("s1:\n%s\ns2:\n%s\n", s31, s32);
	printf(" SYS: %d\n", strcmp(s31, s32));
	printf("  FT: %d\n\n", ft_strcmp(s31, s32));

	printf("s1:\n%s\ns2:\n%s\n", s41, s42);
	printf(" SYS: %d\n", strcmp(s41, s42));
	printf("  FT: %d\n\n", ft_strcmp(s41, s42));
	printf("-------------END-------------\n\n\n\n\n\n");
}

void	test_write()
{
	int fd1 = open("wr_test1.txt", O_WRONLY);
	int fd2 = open("wr_test2.txt", O_WRONLY);
	ssize_t ret;

	printf("------FT_WRITE TESTING------\n");
	errno = 0;
	ret = write(fd1, "lol", 3);
	printf("SYS Ret: %zd, errno: %d\n", ret, errno);
	errno = 0;
	ret = ft_write(fd2, "lol", 3);
	printf("FT  Ret: %zd, errno: %d\n\n", ret, errno);
	close(fd1);
	close(fd2);


	errno = 0;
	ret = write(-1, "test", 4);
	printf("SYS Ret: %zd, errno: %d\n", ret, errno);
	errno = 0;
	ret = ft_write(-1, "test", 4);
	printf("FT  Ret: %zd, errno: %d\n\n", ret, errno);


	errno = 0;
	ret = write(1, "test", 4);
	printf("SYS Ret: %zd, errno: %d\n", ret, errno);
	errno = 0;
	ret = ft_write(1, "test", 4);
	printf("FT  Ret: %zd, errno: %d\n", ret, errno);
	printf("-------------END------------\n\n\n\n\n\n");
}

void	test_read()
{
	int fd1 = open("ft_read.s", O_RDONLY);
	int fd2 = open("ft_read.s", O_RDONLY);
	char buf[100];
	ssize_t ret;


	printf("-------FT_READ TESTING-------\n");
	errno = 0;
	while ((ret = read(fd1, buf, 99)) > 0)
	{
		buf[ret] = 0;
		printf("read: %zd - %s\n", ret, buf);
	}
	printf("SYS Ret: %zd, errno: %d\n", ret, errno);
	errno = 0;
	while ((ret = ft_read(fd2, buf, 99)) > 0)
	{
		buf[ret] = 0;
		printf("ft_read: %zd - %s\n", ret, buf);
	}
	printf("FT  Ret: %zd, errno: %d\n\n", ret, errno);
	close(fd1);
	close(fd2);


	errno = 0;
	while ((ret = read(-1, buf, 99)) > 0)
	{
		buf[ret] = 0;
		printf("read: %zd - %s\n", ret, buf);
	}
	printf("SYS Ret: %zd, errno: %d\n", ret, errno);
	errno = 0;
	while ((ret = ft_read(-1, buf, 99)) > 0)
	{
		buf[ret] = 0;
		printf("ft_read: %zd - %s\n", ret, buf);
	}
	printf("FT  Ret: %zd, errno: %d\n\n", ret, errno);


	errno = 0;
	while ((ret = read(0, buf, 99)) > 0)
	{
		buf[ret] = 0;
		printf("read: %zd - %s\n", ret, buf);
	}
	printf("SYS Ret: %zd, errno: %d\n", ret, errno);
	errno = 0;
	while ((ret = ft_read(0, buf, 99)) > 0)
	{
		buf[ret] = 0;
		printf("ft_read: %zd - %s\n", ret, buf);
	}
	printf("FT  Ret: %zd, errno: %d\n\n", ret, errno);
	printf("-------------END-------------\n\n\n\n\n\n");
}

void	test_dup()
{
	printf("-------FT_STRDUP TESTING-------\n");
	char	*src1 = "test";
	char	*src2 = "";
	char	*src3 = FT_LLSTR;
	char	*lol;

	printf("orig:\n%s\n", src1);
	lol = strdup(src1);
	free(lol);
	printf(" SYS:\n%s\n", lol);
	lol = ft_strdup(src1);
	free(lol);
	printf("  FT:\n%s\n\n", lol);

	printf("orig:\n%s\n", src2);
	lol = strdup(src2);
	free(lol);
	printf(" SYS:\n%s\n", lol);
	lol = ft_strdup(src2);
	free(lol);
	printf("  FT:\n%s\n\n", lol);

	printf("orig:\n%s\n", src3);
	lol = strdup(src3);
	free(lol);
	printf(" SYS:\n%s\n", lol);
	lol = ft_strdup(src3);
	free(lol);
	printf("  FT:\n%s\n\n", lol);
	printf("--------------END--------------\n");
}

int		main()
{
	test_len();
	test_cpy();
	test_cmp();
	test_write();
	test_read();
	test_dup();
}