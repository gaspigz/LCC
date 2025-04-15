@Dado el siguiente c´odigo en C que suma las componentes de dos vectores de tipo float y,
@adem´as, realiza la suma de los dos arreglos:
@	#include <stdio.h>
@	float a[5] = {1.0, 2.0, 3.0, 4.0, 5.0};
@	float b[5] = {2.0, 4.0, 6.0, 8.0, 10.0};
@	float c[5];
@	int main()
@	{
@		float suma=0;
@		for(int i=0; i<5; i++){
@			printf("%f\n", c[i] = a[i] + b[i]);
@			suma = suma + c[i];
@		}
@		printf("La suma de las componentes es: %f\n", suma);
@		return 0;
@	}
@Escribir un c´odigo equivalente en Assembler ARM.

.data
	a: .word 0x3f800000, 0x40000000, 0x40400000, 0x40800000, 0x40a00000
	b: .word 0x40000000, 0x40800000, 0x40c00000, 0x41000000, 0x41200000
	c: .space 20, #0

.text
.global _start
_start:
	vmov s0, #0
	push {lr}
	