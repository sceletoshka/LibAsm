
;вычисляет длину строки до '\0', возвращет счетчик

; 64-bit [QWORD]
R0  R1  R2  R3  R4  R5  R6  R7  R8  R9  R10  R11  R12  R13  R14  R15
RAX RCX RDX RBX RSP RBP RSI RDI

; 32-bit [DWORD]
R0D R1D R2D R3D R4D R5D R6D R7D R8D R9D R10D R11D R12D R13D R14D R15D
EAX ECX EDX EBX ESP EBP ESI EDI

; 16-bit [WORD]
R0W R1W R2W R3W R4W R5W R6W R7W R8W R9W R10W R11W R12W R13W R14W R15W
AX  CX  DX  BX  SP  BP  SI  DI

; 8-bit [BYTE]
R0B R1B R2B R3B R4B R5B R6B R7B R8B R9B R10B R11B R12B R13B R14B R15B
AL  CL  DL  BL  SPL BPL SIL DIL

; 128-bit (used for floating point operations mostly)
XMM0 ... XMM15

; Save register
push	REG
pop		REG

; Set register value
mov		REG, VALUE	; DEST = VALUE

; Common operations
add		DEST, VALUE	; DEST = DEST + VALUE
sub		-			; DEST = DEST - VALUE
inc		REG			; REG++
dec		-			; REG--
and		DEST, REG	; DEST = DEST & REG
xor		-			; DEST = DEST ^ REG
xor		REG, REG	; = mov	REG, 0
mul		REG			; REG = REG * RAX
div		REG			; REG = REG / RAX

; Dereferenced value
		[REG]		; = *REG

; Compare
cmp	REG, VALUE		; Set flags used by jmp variants

; Label
label:
		jmp	label	; next jumps depends on compare flags from cmp
		je	-		; is equal
		jne	-		; is not equal
		jl	-		; < VALUE
		jle	-		; <= VALUE
		jz	-		; = 0
		jnz	-		; != 0
		jg	-		; > VALUE
		jge	-		; >= VALUE

; Function call
call	FUNCTION

; Parameters registers
RDI RSI RDX RCX R8 R9

; Register to preserve
RBP RBX R12 R13 R14 R15	; You **MUST** push/pop them if you use them

; Return register
RAX

; syscall
mov		rax, CODE	; Then RDI, RSI etc.. for params
					; Add 0x2000000 to the syscall number, see table below
syscall


section .text
	global _ft_strlen

; (arg0 = rdi = char *s)

_ft_strlen:
	mov 	rax, 0
	jmp 	count

count:
	cmp 	BYTE [rdi + rax], 0 	; if the byte at rdi(arg0 = string) start + rax (count/return value) equal 0
	je 		exit
	inc	 	rax						; rax++
	jmp 	count

exit:
	ret