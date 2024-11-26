# 1a, es un programa que haria algo asi: reuturn 0x00000000000000FF
# 1b: hace la operacion al + bl = FE + -1 -> 11111110 + 11111111 = 1 1111 1101 en %bl

.global main
main: 
    movb $0xFE, %al
    movb $-1, %bl
    addb %bl, %al
    incb %bl
    ret

# hace algo asi: 
#int main(){
#   char a = 0xFE, b = -1;
#   a = a + b;
#   b++;
#   return a;
#}