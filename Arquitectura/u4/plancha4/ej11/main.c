#include <stdio.h>

float det(float a, float b, float c, float d);

int main() {
    float a = 1.3, b = 2.4, c = 3.9, d = 2.7;
    float r = det(a,b,c,d);
    printf("%f\n",r);
    return 0;
}
