#include <stdlib.h>
#include <stdio.h>
#include "garray.h"
#define MULTIPLICADOR 5


GArray garray_crear(){
    GArray arr = malloc(sizeof(void*) * MULTIPLICADOR);
    arr->capacidad = MULTIPLICADOR;
    arr->ultimo = -1;
    arr->datos = malloc(sizeof(void*) * MULTIPLICADOR);
}

int garray_vacia(GArray arr){
    if(arr == NULL) return 0;
    if(arr->ultimo == -1) return 0;
    return 1;
}

void garray_insertar(GArray arr, void* dato, FuncionCopiadora copy){
    if(arr == NULL) return;
    arr->ultimo++;
    if(arr->ultimo == arr->capacidad){
        arr->datos = realloc(arr->datos, sizeof(void*) * arr->capacidad * MULTIPLICADOR);
        arr->capacidad = arr->capacidad * MULTIPLICADOR;
    }
    arr->datos[arr->ultimo] = copy(dato);

}

void garray_recorrer(GArray arr, FuncionVisitante visit){
    if(arr == NULL) return;
    for(int i = 0; i <= arr->ultimo; i++){
        visit(arr->datos[i]);
    }
}