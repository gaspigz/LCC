#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

Pila pila_crear(){
    Pila pila = NULL;
    return pila;
}

void pila_destruir(Pila pila, FuncionDestructora destroy){
    glist_destruir(pila, destroy);
}

int pila_es_vacia(Pila pila){
    return pila == NULL;
}

void* pila_tope(Pila pila){
    return pila->data;
}

Pila pila_apilar(Pila pila, int *dato, FuncionCopia copia){
    glist_agregar_inicio(pila, dato, copia);
}

Pila pila_desapilar(Pila pila){
    GNode *actual = pila;
    pila = pila->next;
    actual->next = NULL; //Optional
    free(actual);
    return pila;
}

void pila_imprimir(Pila pila, FuncionVisitante visit){
    if(pila != NULL) glist_recorrer(pila, visit);
}
