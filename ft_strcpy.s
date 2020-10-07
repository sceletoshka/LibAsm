
;Функция strcpy() копирует строку, на которую указывает src (включая завершающий символ `\0'),
;в массив, на который указывает dest. Строки не могут перекрываться,
;и в результирующей строке dest должно быть достаточно места для копии.
;char *strcpy(char *dest, const char *src);
;Net zashiti ot perepolneniya

section .text
	global _ft_strcpy

_ft_strcpy:
	mov rax, 0
	jmp count

count:


exit:
	ret
