.data
	N: .long 5
	strin: .asciz "%d\n"
	res: .space 4
.text
.global _start
.global fun
_start:
	push {lr, ip}
	LDR r0, =N
	LDR r0, [r0]
	bl fun
	mov r1, r0
	ldr r0, =strin
	@bl printf
	pop {lr, ip}
	BX lr
	
fun:
	push {lr, r5, r6, r7}
	
	mov r5, #0 @ Suma
	mov r6, r0 @ Actual
	mov r7, #0 @ Const. = 0
	
	cmp r6, r7
	beq fin
	mov r0, #0
	bne loop

loop:
	mul r1, r6, r6
	sub r6, #1
	add r0, r1
	cmp r6, r7
	bne loop
	beq fin
	
	
fin:	
	ldr r1, =res
	str r0, [r1]
	pop {lr, r5, r6, r7}
	bx lr	
	
	