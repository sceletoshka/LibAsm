;Функция strcpy() копирует строку, на которую указывает s (включая завершающий символ `\0'),
;в массив, на который указывает dest. Строки не могут перекрываться,
;и в результирующей строке dest должно быть достаточно места для копии.
;char *strcpy(char *dest, const char *s);

section .text

	global _ft_strcpy

_ft_strcpy:
	mov rax, 0
	mov rdx, 0
	mov rcx, 0
	jmp _circle

_circle:
	mov dl, BYTE[rsi + rcx]
	mov BYTE[rdi + rcx], dl
	cmp dl, 0
	jz _return
	inc rcx
	jmp _circle

_return:
	mov rax, rdi
	ret

_return_null:
	ret
