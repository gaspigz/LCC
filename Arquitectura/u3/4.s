.text
.global main
main:
movq $-1, %rax
movb $0, %al
movw $0, %ax
movl $0, %eax
retq

# Al principio rax es todos 1
# Luego queda con dos bytes en 0 al final (ff...ff00)
# Luego con cuatro (ff...ff0000)
# En la ultima linea uno supondria que quedarian 16 f y 16 0 pero no, al modificarse eax, se pusieron en 0 tambien todos los primeros bytes quedando 00...000
