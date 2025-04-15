.global _start
_start:
	
	@ P4 E5)
.data

.text
.global _start
_start:
	MOV r2, #0xA400 @ Quiero cargar en r2 0000 0000 0000 0000 1010 0100 0000 0000
	@ 0xa400 no se puede expresar con 8 bits, por lo que debo ver cuantas rotaciones a derecha debo hacerle al numero 1010 0100
	@ Son 24, por lo que lo representa en instruccion como 
	@ (12 * 2) rotaciones
	
	MOV r2, #0x3D8 @ 0000 0000 0000 0000 0000 0011 1101 1000 -> 0000 0000 0000 0000 0000 0000 1111 0110 cuando
	@ lo movi 24 veces me quedo 0000 0000 0000 0000 1111 0110 0000 0000. Lo tengo que mover dos bits mas, qudando 26.
	
	MOV r2, #-1 @ Quiero poner 1111 1111 ... 1111 en r2 pero no es representable por un numero de 8 bits rotado ok?
	
	MOV r2, #0x17400 @ Quiero poner 0000 0000 0000 0001 0111 0100 0000 0000 en r2. Debo expresarlo como un numero de 8 bits rotado n veces a la derecha.
					 @ 0000 0000 0000 0000 0000 0000 1011 1010 --rotado 23 veces--> no puedo hacer rotaciones impares. No se puede sin literal pool.