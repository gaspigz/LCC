@ P4 E1)
.data
	array: .word 0,1,2,3,4,5,6,7,8,9
.global _start
_start:
	MOV r0, #0
	MOV r1, #0
	LDR r2, =array
	LDR r0, [r2, #28]
	@ b) array[10] = array[8] + y
	LDR r3, [r2, #32] @ Guardo en r3 array[8]
	ADD r3, r1 @ Guardo en r3 array[8] + y
	STR r3, [r2, #40]
	MOV r3, #0
	LDR r3, [r2, #40]
	