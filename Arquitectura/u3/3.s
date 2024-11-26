.data
    N1: .byte 100
    N2: .byte 120
    N3: .byte -63
    N4: .byte -56
    N5: .byte -91
.text
.global main
main:
    movb $0, %al
    addb N3, %al
    addb N4, %al
    ret

# N1 + N2 retorna -36 error. Se prenden SF y OF
# N3 + N4 retorna -119 y se prende SF y CF