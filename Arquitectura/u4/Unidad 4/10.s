.data
	i: .quad 0x4
.text
.global _start
.global camp_rus
_start:
	
	@ Escriba una funci´on en Assembler ARM que dado un argumento i entre 0 y 31 en r0, calcule y retorne 2i
	@ Para calcular este valor s´olo puede usar instrucciones de copia (MOV).
	LDR r1, =i
	LDR r0, [r1]
	
	MOV r0, r0, LSL #1