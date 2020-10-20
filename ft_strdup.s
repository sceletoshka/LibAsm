;создает строку дубликат, выделяет на нее память и заполняет, возвращает ее

section .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc
	extern ___error

_ft_strdup:									; rdi = s
			call	_ft_strlen		; call ft_strlen to have len of malloc
	add		rax, 1			; add one for \0
	push	rdi				; save value of arg0 in stack
	mov		rdi, rax		; set len at to malloc to arg0 for malloc
	call	_malloc			; call malloc, return in rax
		jc  _error
	pop		r9				; get arg0 (of ft_strdup) stocked on stack
	mov		rdi, rax		; set the string malloced in rax to arg0 for ft_strcpy
	mov		rsi, r9			; get arg0 (of ft_strdup) stocked in r9 on rsi for ft_strcpy
	call	_ft_strcpy		; call ft_strcpy (rdi, rsi), ret is stock in rax
	ret						; return rax so the new string

_error:
	mov r9, rax
	call ___error
	mov [rax], r9
	mov rax, -1
	ret