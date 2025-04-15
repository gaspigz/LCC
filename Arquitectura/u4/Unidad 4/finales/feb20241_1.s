@float a[5] = {1.0, 2.0, 3.0, 4.0, 5.0};
@float b[5] = {2.0, 4.0, 6.0, 8.0, 10.0};
@float c[5];
@int main(){
@    float suma=0;
@    for(int i=0; i<5; i++){
@        printf("%f\n", c[i] = a[i] + b[i]);
@        suma = suma + c[i];
@    }
@    printf("La suma de las componentes es: %f\n", suma);
@    return 0;
@}
.data
    a: .float 1.0, 2.0, 3.0, 4.0, 5.0
    b: .float 2.0, 4.0, 6.0, 8.0, 10.0
    c: .space 20 @ (5 * 4)
	strin1: .asciz "%f\n"
	strin2: .asciz "La suma de las componentes es: %f\n"
.text
.global _start
_start:
    push {lr, ip}
	LDR r4, =a @ Direccion de a[0]
	LDR r5, =b @ Direccion de b[0]
	LDR r6, =c @ Direccion de c[0]
	MOV r0, #0
	VMOV.f32 s19, r0 @ Suma
	MOV r8,  #5 @ Iteracion max.
	mov r7, #0 @ i = 0
	cmp r8, r7
	MOV r9, #0 @ Este va a ser el valor de desplazamiento para los arrray. r9 = r9 + 4 (bytes, por word)
	
	bne loop
loop:
	
	VLDR.f32 s16, [r4, #0] @ en s16 = a[r9]
	VLDR.f32 s17, [r5, #0] @ en s17 = b[r9]
	VADD.f32 s18, s16, s17 @ en s18 = a[r9] + b[r9]
	VSTR.f32 s18, [r6, #0] @ c[r9] = s18
	VCVT.f64.f32 d0, s18
	VMOV r2, r3, d0
	LDR r0, =strin1
	@ BL printf
	VADD.f32 s19, s19, s18 @ suma actualizada
	ADD r4, r4, #4
	ADD r5, r5, #4
	ADD r6, r6, #4
	ADD r7, r7, #1
	CMP r8, r7
	bne loop
    
	VCVT.f64.f32 d0, s19
	VMOV r2, r3, d0
	LDR r0, =strin2
	@BL printf
	
    pop {lr, ip}
    bx lr

