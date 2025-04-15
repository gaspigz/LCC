.data
	a: .word 0x40200000
	b: .word 0x40600000
	c: .word 0x3f800000
	d: .word 0x40600000
.text
.global _start
_start:
	
	@ Escriba una funci´on que, dados 4 valores en punto flotante que representan una matriz 2 × 2, devuelva su determinante.
	LDR r0, =a
	
	VLDM.f32 r0!, {s0-s3}
	VMUL.f32 s4, s0, s2
	VMUL.f32 s5, s1, s3
	VSUB.f32 s0, s4, s5