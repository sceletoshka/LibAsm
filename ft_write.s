
;Для записи данных в файл используется системный вызов write()
;ssize_t write (int fd, const void * buffer, size_t count);
;В принципе write() выполняет процедуру, обратную read():
;записывает count байтов из буфера buffer в файл с дескриптором fd,
;возвращая количество записанных байтов или -1 в случае ошибки.

section .text
	global _ft_write