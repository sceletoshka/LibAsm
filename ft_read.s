
;Системный вызов read() читает данные как последовательность байт, без какой-либо интерпретации
;ssize_t read (int fd, void * buffer, size_t count)
;Первый аргумент - это файловый дескриптор. Здесь больше сказать нечего.
;Второй аргумент - это указатель на область памяти, куда будут помещаться данные.
;Третий аргумент - количество байт, которые функция read() будет пытаться прочитать из файла.
;Возвращаемое значение - количество прочитанных байт, если чтение состоялось и -1, если произошла ошибка.
;Хочу заметить, что если read() возвращает значение меньше count, то это не символизирует об ошибке.

section .text
	global _ft_read
	extern ___error

; delete all unpreserved registers by _read

_ft_read:								; fd = rdi, buffer = rsi, bytes = rdx
	mov		rax, 0x2000003
	syscall
			jc _error
	jmp exit

_error:
	mov r15, rax
	call ___error
	mov [rax], r15
	mov rax, -1
	ret
	
exit:
	ret