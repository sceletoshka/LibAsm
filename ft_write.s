
;Для записи данных в файл используется системный вызов write()
;ssize_t write (int fd, const void * buffer, size_t count);
;В принципе write() выполняет процедуру, обратную read():
;записывает count байтов из буфера buffer в файл с дескриптором fd,
;возвращая количество записанных байтов или -1 в случае ошибки.

section .text
	global _ft_write

_ft_write:
	mov r8, rdx				; save rdx = len in r8
	mov rax, 0x2000004
	syscall
		jc exit_error		; if doesn't work, write set flags carry to 1 so jmp exit error
	jmp exit

exit_error:
	mov rax, -1				; set return to -1
	ret

exit:
	mov rax, r8				; set previous value of rdx save in r8, in return value
	ret