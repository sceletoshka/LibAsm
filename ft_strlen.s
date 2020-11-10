;вычисляет длину строки до '\0', возвращет счетчик
;size_t strlen(const char *s)

section .text
	global _ft_strlen

; (arg0 = rdi = char *s)

_ft_strlen:
	mov 	rax, 0

count:
	cmp 	BYTE [rdi + rax], 0 	; if the byte at rdi(arg0 = string) start + rax (count/return value) equal 0
	je 		exit
	inc	 	rax
	jmp 	count

exit:
	ret