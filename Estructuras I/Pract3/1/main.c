#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

int main(){

    Pila pila = pila_crear(5);
    pila_apilar(pila, 2);
    pila_apilar(pila, 1);
    pila_apilar(pila, 8);
    pila_apilar(pila, 4);
    pila_apilar(pila, 7);
    pila_apilar(pila, 9);
    pila_imprimir(pila);
    printf("\n");
    pila_desapilar(pila);
    pila_imprimir(pila);
    pila_destruir(pila);

    return 0;
}