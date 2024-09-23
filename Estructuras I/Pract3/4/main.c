#include <stdio.h>
#include <stdlib.h>
#include "colas.h"

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

    int n = 1, m=2, l=n+m;
    int *a = &n, *b=&m, *c=&l;
    Cola cola = cola_crear();
    cola = cola_encolar(cola, a, (FuncionCopia) copia_int);
    cola = cola_encolar(cola, b, (FuncionCopia) copia_int);
    cola = cola_encolar(cola, a, (FuncionCopia) copia_int);
    cola = cola_encolar(cola, c, (FuncionCopia) copia_int);
    cola = cola_encolar(cola, b, (FuncionCopia) copia_int);
    cola_imprimir(cola, (FuncionVisitante) print_int);
    printf("\n");
    cola = cola_desencolar(cola, (FuncionDestructora) destroy_int);
    cola = cola_desencolar(cola, (FuncionDestructora) destroy_int);
    cola_imprimir(cola, (FuncionVisitante) print_int);
    printf("\nOK");
    cola_destruir(cola, (FuncionDestructora) destroy_int);

    return 0;
}