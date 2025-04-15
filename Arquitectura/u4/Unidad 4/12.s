.data
	L: .word 0x4
	a: .word 0x1, 0x2, 0x3, 0x4
	b: .word 0x2, 0x3, 0x4, 0x5
	string: .asciz "La suma es %d\n"
.text
.global _start
_start:
	
	@Dado el siguiente c´odigo en C que suma los elementos de dos arreglos de igual longitud
	@con datos de tipo entero:
	
	@#include <stdio.h>
	@int a[]={1, 2, 3, 4};
	@int b[]={2, 3, 4, 5};
	@int suma(int a[], int b[], int L){
	@	int i, result=0;
	@	for(i=0; i<L; i++){
	@		result = result + a[i] + b[i];
	@	}
	@	return result;
	@}
	@int main(){
	@	int L=4;
	@	printf("La suma es: %d\n", suma(a, b, L));
	@	return 0;
	@}
	@Escribir un c´odigo equivalente en Assembler ARM.
	
	
main:
	ldr r2, =L
	ldr r2, [r2]
	ldr r1, =b
	ldr r0, =a
	push {lr}
	
	bl suma
	mov r1, r0
	LDR r0, =string
	bl printf
	pop {lr}
	b fin
	
suma:
	push {r7, r8, r9,r10, r11, r12}
	mov r7, #0
	mov r8, #0
	mov r9, #0
	mov r10, #0
	mov r11, #0
	mov r12, #4 @ Const
loop:
	cmp r2, r9
	beq fin
	ldr r7, [r0, r11]
	ldr r8, [r1, r11]
	add r10, r10, r7
	add r10, r10, r8
	add r9, r9, #1
	mul r11, r9, r12
	bne loop
fin:	
	mov r0, r10
	pop {r7, r8, r9,r10, r11, r12}
	bx lr

