#include <stdio.h>
#include <ieee754.h>

int fraccion(float x){
    float *p = &x;
    int m = *(int*) p;
    return m & 0x7fffff;

}

int exponente(float x){
    float *p = &x;
    int m = *(int*) p;
    return (m & 0x7f800000)>>23;

}

int signo(float x){
    float *p = &x;
    int m = *(int*) p;
    return (m & 0x80000000)>>31;

}

int is_one(long n, int b){
    long n_corrido = n>>b;
    return (n_corrido & 1);
}

void printbin(long n){
    for(int i = 63; i>=0; i--){
        printf("%d",is_one(n,i));
    }
}

void intercambio(char a, char b, char c){
    printf("Valor a: %x, Valor b: %x, Valor c: %x\n",a,b,c);
    printf("a -> b, b -> c, c -> a\n");
    a = a ^ b;
    b = a ^ b; // = a^b^b = a
    a = a ^ b; // = a ^ b ^ a = b

    // en a esta b y en b esta a 
    a = a ^ c;
    c = a ^ c;
    a = a ^ c;
    // en b esta a, en a esta c, y en c esta b
    printf("Valor a: %x, Valor b: %x, Valor c: %x\n",a,b,c);


}

int main(){
    float a = 3.125;
    union ieee754_float a_ieee;
    a_ieee.f = 3.125;
    int res_fraccion = fraccion(a);
    int res_exp = exponente(a);
    int res_sg = signo(a);

    printf("Fracción ieee %x\n", a_ieee.ieee.mantissa);
    printf("Fracción mia %x\n", res_fraccion);
    printf("Exp ieee %x\n", a_ieee.ieee.exponent);
    printf("Exp mia %x\n", res_exp);
    printf("Sig ieee %x\n", a_ieee.ieee.negative);
    printf("Sig mia %x\n", res_sg);

    long b = 137;
    int esuno = is_one(b, 4);
    esuno = is_one(b, 3);
    printbin(b);
    int aa=10, bb = 16, c =-10;
    printf("\n\n");
    intercambio(aa,bb,c);
    
    

    return 0;
}