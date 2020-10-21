;Функция strcpy() копирует строку, на которую указывает s (включая завершающий символ `\0'),
;в массив, на который указывает dest. Строки не могут перекрываться,
;и в результирующей строке dest должно быть достаточно места для копии.
;char *strcpy(char *dest, const char *s);

section	.text
			global	_ft_strcpy

; RDX, RCX, RAX

_ft_strcpy:									; dst = rdi, s = rsi
			xor		rcx, rcx				; i = 0
			xor		rdx, rdx				; tmp = 0
			cmp		rsi, 0					; !rsi
			jz		return
			jmp		copy

increment:
			inc		rcx

copy:
			mov		dl, BYTE [rsi + rcx]
			mov		BYTE [rdi + rcx], dl
			cmp		dl, 0
			jnz		increment
			
return:
			mov		rax, rdi				; return dst
			ret
