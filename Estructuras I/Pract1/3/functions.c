#include <stdlib.h>
#include <stdio.h>
#include "functions.h"

ArregloEnteros* arreglo_enteros_crear(int capacidad){
    ArregloEnteros *arr = malloc(sizeof(ArregloEnteros));
    int *direccion = malloc(sizeof(int)*capacidad);

    arr->capacidad = capacidad;
    arr->direccion = direccion;

    return arr;
}

void arreglo_enteros_destruir(ArregloEnteros* arreglo){
    free(arreglo->direccion);
    free(arreglo);
}

int arreglo_enteros_leer(ArregloEnteros* arreglo, int pos){
    return arreglo->direccion[pos];
}

void arreglo_enteros_escribir(ArregloEnteros* arreglo, int pos, int dato){
    if(pos > arreglo->capacidad -1){
        printf("La posicion %d no existe en este arreglo. Porfavor de una posicion entre el 0 y el %d\n",pos, arreglo->capacidad -1);
    }else{
        arreglo->direccion[pos] = dato;
    }
}

int arreglo_enteros_capacidad(ArregloEnteros* arreglo){
    return arreglo->capacidad;
}

void arreglo_enteros_imprimir(ArregloEnteros* arreglo){
    for(int i=0; i<arreglo->capacidad; i++){
        printf("%d ",arreglo_enteros_leer(arreglo, i));
    }
}

void arreglo_enteros_ajustar(ArregloEnteros* arreglo, int capacidad){
    arreglo->capacidad = capacidad;
    arreglo->direccion = realloc(arreglo->direccion, sizeof(int)*capacidad);
}

void arreglo_enteros_insertar(ArregloEnteros* arreglo, int pos, int dato){
    if(pos > arreglo->capacidad){
        printf("La posicion no existe en este arreglo. Porfavor de una posicion entre el 0 y el %d (Nueva capacidad en caso de agregar)\n",arreglo->capacidad +1);
    }else{
        arreglo_enteros_ajustar(arreglo, arreglo->capacidad + 1);
        
        for(int i = arreglo->capacidad -1; i >= 0 && pos-1!=i; i--){
            if(i>pos){
                arreglo_enteros_escribir(arreglo, i, arreglo->direccion[i-1]);
            }
            if(i == pos){
                arreglo_enteros_escribir(arreglo, i, dato);
            }
        }   
    }
}