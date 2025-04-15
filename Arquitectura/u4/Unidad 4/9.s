.data
	i: .quad 0x5
	j: .quad 0x5
.text
.global _start
.global camp_rus
_start:
	
	@usigned int campesino_ruso(unsigned int i, unsigned int j)
	@{
	@	unsigned int res = 0;
	@	while (j > 1) {
	@	if (j & 1) {
	@			res += i;
	@			j -= 1;
	@		} else {
	@				i *= 2;
	@				j /= 2;
	@			}
	@	}
	@return res + i;
	@}
	
	PUSH {lr}
	LDR r2, =i
	LDR r0, [r2]
	LDR r2, =j
	LDR r1, [r2]
	MOV r2, #0
	BL camp_rus
	
	POP {lr}
	B end
	
camp_rus:
	@ Y el callee save en el apunte? Parte llamada a funcion
	CMP r1, #1
	MOV r2, #0
	
bucle:
	tst r1, #1
	ADDNE r2, r2, r0
	SUBNE r1, #1
	LSLEQ r0, #1
	LSREQ r1, #1
	TST r1, r1
	BNE bucle
	mov r0, r2
	BX lr
	
end: 
	