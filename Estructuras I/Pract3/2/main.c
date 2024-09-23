#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

int *copia_int(int *dato){
    int *copia;
    copia = malloc(sizeof(int));
    *copia = *dato;
    return copia;
}
void print_int(int *dato){
    printf("%d\n",*dato);
}

void destroy_int(int *dato){
    free(dato);
}

int main(){

    int n = 1, m=2, l=n*m;
    int *a = &n, *b=&m, *c=&l;
    Pila pila = pila_crear();
    pila = pila_apilar(pila, a, (FuncionCopia)copia_int);
    pila = pila_apilar(pila, b, (FuncionCopia)copia_int);
    pila = pila_apilar(pila, c, (FuncionCopia)copia_int);
    pila = pila_apilar(pila, a, (FuncionCopia)copia_int);
    pila = pila_apilar(pila, a, (FuncionCopia)copia_int);

    
    pila_imprimir(pila, (FuncionVisitante)print_int);

    printf("\n");
    pila = pila_desapilar(pila);

    pila_imprimir(pila, (FuncionVisitante)print_int);
    pila_destruir(pila, (FuncionDestructora)destroy_int);

    return 0;
}