#include <stdio.h>
#include <stdlib.h>
#include "garray.h"

#define MULTIPLICADOR_CAPACIDAD 100

typedef struct _GArray{
    void **datos;
    int capacidad;
}_GArray;

GArray garray_crear(){
    GArray array = malloc(sizeof(GArray));
    array->datos = malloc(sizeof(void *) * 100);
    array->capacidad = 100;
    for(int i = 0; i<array->capacidad; i++) array->datos[i] = NULL;

    return array;
}

GArray garray_insertar(GArray array, void* dato, int posicion){
    while(posicion < array->capacidad){
        array->datos = realloc(array->datos, array->capacidad * 100);
        array->capacidad = array->capacidad * 100;
    }
    array->datos[posicion] = dato;
    return array;
}

GArray garray_insertar_nopos(GArray array, void* dato){
    if(dato == NULL) return array;
    int i = 0;
    while(array->datos[i] != NULL){
        if(i == array->capacidad-1){
            array->datos = realloc(array->datos, array->capacidad * 100);
            array->capacidad = array->capacidad * 100;
        }
        i++;
    }
    array->datos[i] = dato;
    return array;
}

void garray_recorrer(GArray array, FuncionVisitanteExtra visit){
    for(int i = 0; i < array->capacidad; i++){
        if(array->datos[i] != NULL) visit(array->datos[i], NULL);
    }
}

int garray_complete_check_menoramayor(GArray array, FuncionComparadora comp){
    int bandera = 1;
    for(int i = 0; (array->datos[i+1] != NULL && i+1 != array->capacidad) && bandera == 1; i++){
        if(comp(array->datos[i], array->datos[i+1]) > 0) bandera = 0;
    }

    return bandera;
}