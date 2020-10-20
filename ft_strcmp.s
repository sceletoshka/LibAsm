; Эта функция сравнивает символы двух строк, string1 и string2.
;Начиная с первых символов функция strcmp сравнивает поочередно каждую пару символов,
;пока не будут найдены различные символы или не будет достигнут конец строки.

section .text
	global _ft_strcmp

_ft_strcmp:
	mov 	rax, 0
	jmp		compa

compa:
	mov		al, BYTE [rdi]	; get the least significant byte in rdi where is stock the value of the char
	mov		bl, BYTE [rsi]	; get the least significant byte in rsi where is stock the value of the char
	cmp		al, 0			; if we are not at the end of rdi (arg0)
	je		exit
	cmp		bl, 0			; if we are not at the end of rdi (arg1)
	je		exit
	cmp 	al, bl			; compare al and bl
	jne 	exit
	inc 	rdi
	inc 	rsi
	jmp 	compa

exit:
	movzx	rax, al
    movzx	rbx, bl
    sub		rax, rbx
	ret