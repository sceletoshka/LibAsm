
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
	inc 	rdi				; increment the rdi pointer
	inc 	rsi				; increment the rsi pointer
	jmp 	compa

exit:
	movzx	rax, al			; movzx = copy a register of inferior size in a bigger and fill the other bits with 0, and this register is rax
    movzx	rbx, bl			; same that previous but set it in rbx
    sub		rax, rbx		; Finaly : do the difference beetween the char at the rdi pointer and the char at the rsi pointer
	ret