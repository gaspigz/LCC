.data
	a: .long 1
	b: .long 2
	c: .long 3
	d: .long 4
	e: .long 5
	strerr: .asciz "Todos los argumentos deben ser positivos."
	strbien: .asciz "La suma es: %d"
.text
.global _start
.global calculo
_start:
	
	@Escribir una funci ́on denominadacalculoen lenguaje ensamblador ARM que realice lo siguiente:
	@La funci ́oncalculorecibe cinco argumentos enteros y retorna un entero.
	@En caso de que todos los argumentos sean positivos, realiza la suma de los mismos, imprime el resultado de la sumay retorna dicho valor.
	@En  caso  de  que  alguno  de  los  argumentos  sea  negativo  o  nulo,  la  funci ́oncalculodebe  llamar  a  otra  funci ́ondenominada foo 
	@ que imprime un mensaje de error por pantalla y retornar -1.
	@ La funci ́onfoono tiene argumentos de entrada, debe imprimir el mensaje por pantalla “Todos los argumentos debenser positivos” 
	@ y retornar -1 a la funci ́oncalculo.
	push {lr, ip}
	LDR r5, =a
	LDMFD r5, {r0-r4}
	push {ip, r4} @ Quinto arg por pila.
	mov r4, #0 @limpio este

	bl calculo
	pop {lr, ip}
	bx lr
	
	
calculo:
	push {lr, r4} @ preservo lr y r4
	@ Ahora tengo en pila:
	@ 5to arg <- sp + 8 bytes
	@ lr <- sp + 4 bytes
	@ r4 <- sp
	LDR r4, [sp, #8]
	@ Ahora tengo los argumentos en r0-r4 y el r4 preservado
	push {r5, r6} @ Preservo r5 y r6
	MOV r5, #0
	MOV r6, #1
	CMP r0, r5
	MOVLE r6, #0
	CMP r1, r5
	MOVLE r6, #0
	CMP r2, r5
	MOVLE r6, #0
	CMP r3, r5
	MOVLE r6, #0
	CMP r4, r5
	MOVLE r6, #0
	CMP r6, r5
	BEQ error
	BNE bien
error:
	push {r0-r3} @ Preservo los caller save
	BL foo
	pop {r0-r3}
	pop {r5, r6}
	pop {lr, r4}
	MOV r0, #-1
	BX lr
foo:
	push {r0-r3, lr}
	LDR r0, =strerr
	@bl printf
	pop {r0-r3, lr}
	MOV r0, #-1
	bx lr
bien:
	ADD r5, r5, r0
	ADD r5, r5, r1
	ADD r5, r5, r2
	ADD r5, r5, r3
	ADD r5, r5, r4
	push {r0-r3, lr}
	LDR r0, =strbien
	MOV r1, r5
	@bl printf
	pop {r0-r3, lr}
	mov r0, r5
	pop {r5,r6}
	pop {lr, r4}
	bx lr
	
	

