#include "tablahash.h"
#include <stdlib.h>
#include <stdio.h>

typedef struct _CasillaHash{
    void* dato;
}CasillaHash;

struct _TablaHash{
    int numElems;
    unsigned capacidad;
    FuncionComparadora comp;
    FuncionCopiadora copy;
    FuncionDestructora destroy;
    FuncionHash hash;
    CasillaHash *elems;
};

TablaHash tablahash_crear(unsigned caapacidad, FuncionComparadora comp, FuncionCopiadora copy, FuncionDestructora destroy, FuncionHash hash){
    TablaHash tabla = malloc(sizeof(struct _TablaHash));
    assert(tabla != NULL);
    tabla->capacidad = caapacidad;
    tabla->comp = comp;
    tabla->copy = copy;
    tabla->hash = hash;
    tabla->destroy = destroy;
    tabla->numElems = 0;
    tabla->elems = malloc(sizeof(CasillaHash) * caapacidad);
    assert(tabla->elems != NULL);
    for(int i = 0; i<caapacidad; i++) tabla->elems[i].dato = NULL;

    return tabla;
    
}

unsigned tablahash_capacidad(TablaHash tabla){ return tabla->capacidad; }

int tablahash_numelems(TablaHash tabla){ return tabla->numElems; }

void tablahash_destruir(TablaHash tabla){
    for(int i = 0; i<tablahash_capacidad(tabla); i++){
        if(tabla->elems[i].dato != NULL) tabla->destroy(tabla->elems[i].dato);
    }
    free(tabla->elems);
    free(tabla);
}

TablaHash tablahash_insertar(TablaHash tabla, void* dato){
    assert(tabla != NULL);
    unsigned idx = tabla->hash(dato) % tablahash_capacidad(tabla);
    if(tabla->elems[idx].dato == NULL){
        tabla->elems[idx].dato = tabla->copy(dato);
        tabla->numElems++;
        return tabla;
    }else if(tabla->comp(tabla->elems[idx].dato, dato) == 0){
        tabla->destroy(tabla->elems[idx].dato);
        tabla->elems[idx].dato = tabla->copy(dato);
        tabla->numElems++;
        return tabla;
    }else{
        // COLISIÓN VER
    }
}

void* tablahash_buscar(TablaHash tabla, void* dato){
    assert(tabla != NULL);
    unsigned idx = tabla->hash(dato) % tablahash_capacidad(tabla);
    if(tabla->elems[idx].dato == NULL){
        return NULL;
    }else if(comp(tabla->elems[idx].dato, dato) == 0){
        return tabla->elems[idx].dato;
    }else{
        // colisiones!!
    }
}

void tablahash_eliminar(TablaHash tabla, void* dato){
    assert(tabla != NULL);
    unsigned idx = tabla->hash(dato) % tablahash_capacidad(tabla);
    if(tabla->elems[idx].dato == NULL){
        return NULL;
    }else if(comp(tabla->elems[idx].dato, dato) == 0){
        return tabla->elems[idx].dato;
    }else{
        // colisiones!!
    }
}

TablaHash tablahash_redimensionar(TablaHash tabla){
    assert(tabla != NULL);
    unsigned nueva_capacidad = tablahash_capacidad(tabla);
    TablaHash nueva_tabla = tablahash_crear(nueva_capacidad, tabla->comp, tabla->copy, tabla->destroy, tabla->hash);
    for(int i = 0; i < tabla->capacidad && tabla->numElems != 0; i++){
        if(tabla->elems[i].dato != NULL) nueva_tabla = tablahash_insertar(nueva_tabla, tabla->elems[i].dato);
    }
    tablahash_destruir(tabla);
    return nueva_tabla;
}