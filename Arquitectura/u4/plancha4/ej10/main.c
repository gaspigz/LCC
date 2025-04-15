#include <stdio.h>

unsigned int pot2(unsigned int i);

int main() {
    unsigned int a = pot2(0), b = pot2(1), c = pot2(2), d = pot2(10), e = pot2(31);
    printf("%u %u %u %u %u",a,b,c,d,e);
    return 0;
}
