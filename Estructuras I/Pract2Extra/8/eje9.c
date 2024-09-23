#include "adicional.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int *int_copy(int *data){
    //int *copia = malloc(sizeof(int));
    //*copia = *data;
    //return copia;
    return data;
}

void imprimir_int(int *c){
    printf("%d ",*c);
}

int main(){

    GList lista = glist_crear();
    int *a = NULL, *b = NULL, *c = NULL, *d = NULL;
    a = malloc(sizeof(int));
    b = malloc(sizeof(int));
    c = malloc(sizeof(int));
    d = malloc(sizeof(int));
    *a = 1;
    *b = 2;
    *c = 3;
    *d = 4;

    lista = agregar_final(lista, (FuncionCopia) int_copy, a);
    lista = agregar_final(lista, (FuncionCopia) int_copy, b);
    lista = agregar_final(lista, (FuncionCopia) int_copy, c);
    lista = agregar_final(lista, (FuncionCopia) int_copy, d);

    glist_recorrer(lista, (FuncionVisitante) imprimir_int);

    return 0;
}