.data
list: .byte 1, 2, 3, 4
long: .byte 4
pos: .byte 0
.text
.global main
main:
    movq $0, %rax # inicio rax con 0
    movb list, %al # muevo al primer byte de rax el primer byte de list
    movq $0, %r10 # inicio el reg aux r10 como 0
    movb %al, %r10b # muevo al primer byte del registro auxiliar r10 el primer byte de rax
    pushq %r10 # pusheo a la pila el registro aux r10 (contiene el primer elemento de la lista)

    movq $0, %rax # repito
    movb list+1, %al # Ver porque es + 1 y no + 8. Es el segundo elemento
    movq $0, %r10
    movb %al, %r10b
    pushq %r10
