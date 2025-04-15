@ P4 E2)
.data
	array: .quad 0x8000
.text
.global _start
_start:
	MOV r3, #0
	LDR r2, =array
	LDR r3, [r2]
	STR r6, [r3, #12] @ No cambia nada
	STRB r7, [r3], #4 @ 0x8004
	LDRH r5, [r3], #8 @ 0x800c
	LDR r12, [r3, #12]! @ 0x8018
