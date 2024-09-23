#include <stdlib.h>
#include <stdio.h>
#include "functions.h"

int main(){

    ArregloEnteros *arreglo = arreglo_enteros_crear(5);
    arreglo_enteros_escribir(arreglo, 0, 5);
    arreglo_enteros_escribir(arreglo, 1, 3);
    arreglo_enteros_escribir(arreglo, 2, 1);
    arreglo_enteros_escribir(arreglo, 3, -8);
    arreglo_enteros_escribir(arreglo, 4, 10);

    //arreglo_enteros_imprimir(arreglo);
    //printf("\n");

    //arreglo_enteros_ajustar(arreglo, 7);
    //arreglo_enteros_escribir(arreglo, 5, 12);
    arreglo_enteros_imprimir(arreglo);
    printf("\n");
    arreglo_enteros_insertar(arreglo, 5, 99);
    arreglo_enteros_imprimir(arreglo);





    return 0;
}