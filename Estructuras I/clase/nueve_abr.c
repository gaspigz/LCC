#include "adicional.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Funcion que inserte en una posicion n en una lista
/*
GList agregar_en_n(GList lista, FuncionCopia copy, void* data, int n){

}*/

void* int_copy(void *data){
    int *copy = malloc(sizeof(int));
    *copy = *((int*)data);
    return copy;
}

void imprimir_int(int *data){
    printf("%d ",*data);
}

int main(){

    GList lista = glist_crear();
    int *a; *a=5;
    lista = agregar_final(lista, (FuncionCopia) int_copy, a);
   // lista = agregar_final(lista, (FuncionCopia) int_copy, (int*)5);
    //lista = agregar_final(lista, (FuncionCopia) int_copy, (int*)3);
    //lista = agregar_final(lista, (FuncionCopia) int_copy, (int*)7);
    glist_recorrer(lista, (FuncionVisitante) imprimir_int);


    return 0;
}
