.text
.global main
main:
    movq $0x1122334455667788, %rax
    addq $0x1122334455667788, %rax
    ret

# El error se da porque no entra la instruccion y el valor inmediato de 64 bits, la instruccion add debe ser mas grande que la mov por eso esa si anda.
# Fe de erratas:
# El tamaño maximo de un dato inmediato es de 32 bits para toda operacion menos mov que es 64
# Seccion 1.4 del apunte,  primer parrafo