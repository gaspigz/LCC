#include <stdlib.h>
#include <stdio.h>
#include "functions.h"
#include <string.h>



int main(){

    char frase[100], frase2[100], res[1000], sep[10], *arregloStrings[100];
    strcpy(frase, "abcbde");
    strcpy(frase2, "abc");
    strcpy(sep, " - ");
    arregloStrings[0] = frase;
    arregloStrings[1] = frase2;
    //printf("\arrg 0: %s\n", arregloStrings[0]);
    //printf("\arrg 1: %s\n", arregloStrings[1]);
    string_unir(arregloStrings, 2, sep, res);
    printf("\nSTRINGS UNIDAS: %s\n",res);

    
    
    //printf("Long frase: %d", string_len(frase));
    //string_reverse(frase2);
    //printf("Frase 2 invertida: %s", frase2);

    //int cambiados = string_concat(frase, frase2, 14);
    //printf("Frases concatenadas: %s %d", frase, cambiados);
    //printf("\n%d",string_compare(frase, frase2));
    //printf("\nSTR_SUBSTR: %d\n", string_subcadena(frase, frase2));

    return 0;
}