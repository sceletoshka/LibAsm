; Эта функция сравнивает символы двух строк, string1 и string2.
;Начиная с первых символов функция strcmp сравнивает поочередно каждую пару символов,
;пока не будут найдены различные символы или не будет достигнут конец строки.
;size_t strlen(const char *s)

section .text
	global _ft_strcmp

_ft_strcmp:
	push	r8
	mov		rcx, -1
while:
	inc		rcx
	mov		r8b, [rdi+rcx]
	cmp		r8b, [rsi+rcx]
	jne		exit
	cmp		byte [rdi+rcx], 0
	jne		while					; if not end of string
exit:
	mov		rax, 0
	mov		al, [rdi+rcx]
	mov		r8, 0
	mov		r8b, [rsi+rcx]
	sub		rax, r8
	pop		r8
	ret