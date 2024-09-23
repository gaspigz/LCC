#include <stdio.h>
#include <stdlib.h>
#include "pilas.h"

Pila pila_crear(int capacidad){
    Pila pila = malloc(sizeof(Pila));
    pila->arr = arreglo_enteros_crear(capacidad);
    pila->ultimo = -1;
    return pila;
}

void pila_destruir(Pila pila){
    arreglo_enteros_destruir(pila->arr);
    free(pila);
}

int pila_es_vacia(Pila pila){
    return pila->ultimo == -1;
}

int pila_tope(Pila pila){
    return pila->ultimo;
}

void pila_apilar(Pila pila, int dato){
    if(pila->ultimo != pila->arr->capacidad -1){
        pila->ultimo++;
        pila->arr->direccion[pila->ultimo] = dato;
    }
}

void pila_desapilar(Pila pila){
    if(pila->ultimo != -1) pila->ultimo--;
}

void pila_imprimir(Pila pila){
    if(pila->ultimo != -1){
        
        for(int i = pila->ultimo;i>=0 ;i--){
            printf("%d\n", pila->arr->direccion[i]);
        }
    }
}
