
;Для записи данных в файл используется системный вызов write()
;ssize_t write (int fd, const void * buffer, size_t count);
;В принципе write() выполняет процедуру, обратную read():
;записывает count байтов из буфера buffer в файл с дескриптором fd,
;возвращая количество записанных байтов или -1 в случае ошибки.

section .text
	global _ft_write
	extern ___error

_ft_write:
	test	edi, edi
	js		_error
	mov rax, 0x2000004
	syscall
	jc _error
	ret

_error:
	push rax
	call ___error
	pop rdx
	mov [rax], rdx
	mov rax, -1
	ret