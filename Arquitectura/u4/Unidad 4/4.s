@ P4 E4)
.data
	array: .quad 0xBEEFFACE
	valor: .word 0x8000
.text
.global _start
_start:
	
	MOV r7, #0x8C, 4 @ Tengo 0x0000008c y lo roto 4 bits a la derecha quedando 0xc0000008
	MOV r7, #0x42, 30 @ 0x00000108
	MVN r7, #2 @fffffffd
	MVN r7, #0x8C, 4 @0xffffff 0111 0011 = 0xffffff73 y luego roto 4