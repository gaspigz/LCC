@ P4 E3)
.data
	array: .quad 0xBEEFFACE
	valor: .word 0x8000
.text
.global _start
_start:
	
	MOV r3, #0
	LDR r2, =array
	LDR r6, [r2]
	LDR r2, =valor
	LDR r3, [r2]
	
	STR r6, [r3] @ Guardo en 0x8000 lo que hay en r6 (0xbeefface)
	LDRB r4, [r3] @ en r4 ce en little endian y be en big endian
	
