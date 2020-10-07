
;создает строку дубликат, выделяет на нее память и заполняет, возвращает ее

section .text
	global _ft_strdup
	extern _malloc

_ft_strdup:
	