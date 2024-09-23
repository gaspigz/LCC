#include <stdio.h>
int main()
{
    char a=127;
    printf("%d %u\n",a,a);
    a=++a;
    printf("%d %u\n",a,a);
    unsigned char b=128;
    printf("%d %u\n",b,b);
    b=++b;
    printf("%d %u\n",b,b);
    return 0;
}