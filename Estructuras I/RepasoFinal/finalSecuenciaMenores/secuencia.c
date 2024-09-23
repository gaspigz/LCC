#include "secuencia.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

Nodo secuencia_crear(int dato){
    Nodo nodo = malloc(sizeof(struct _Nodo));
    assert(nodo != NULL);
    nodo->dato = dato;
    nodo->cant_m = 0;
    nodo->p = 0;
    nodo->siguiente = NULL;
    return nodo;
}

Nodo actualiza_menor_y_pos(Nodo lista, int dato){
    if(lista == NULL) return NULL;
    lista->p = lista->p + 1;
    if(lista->dato > dato) lista->cant_m = lista->cant_m + 1;
    lista->siguiente = actualiza_menor_y_pos(lista->siguiente, dato);
    return lista;
}

Nodo secuencia_insertar(Nodo lista, int dato, int pos){
    if(lista == NULL) return secuencia_crear(dato);

    Nodo nuevo_nodo = secuencia_crear(dato);

    if(pos == 0){
        nuevo_nodo->siguiente = actualiza_menor_y_pos(lista, dato);
        return nuevo_nodo; 
    }

    Nodo aux = lista;
    int cant_menores = 0;
    int pos_final = 0;
    while(pos != 1 && aux != NULL){
        if(aux->dato == dato) return lista;
        if(aux->dato < dato) cant_menores++;
        aux = aux->siguiente;
        pos--;
        pos_final++;

    }

    if(aux != NULL){
        // Ya tengo la cantidad de menores y debo insertarlo en el siguiente al actual.
        if(aux->dato == dato) return lista; //Chequeo que este no sea el mismo que quiero meter
        if(aux->dato < dato) cant_menores++;
        pos_final++;
        nuevo_nodo->cant_m = cant_menores;
        nuevo_nodo->p = pos_final;
        Nodo aux_sig = aux->siguiente;
        aux->siguiente = nuevo_nodo;
        nuevo_nodo->siguiente = actualiza_menor_y_pos(aux_sig, dato);

    }else{
        return lista;
    }

    return lista;

}

Nodo* secuencia_porCantidadMenores(Nodo lista, int cantidad){
    int capacidad = 100, cantidad_agregada = 0;
    Nodo* nueva_lista = malloc(sizeof(Nodo) * capacidad);
    for(Nodo aux = lista; aux != NULL; aux = aux->siguiente){
        if(aux->cant_m == cantidad){
            if(capacidad == cantidad_agregada - 1){
                capacidad = capacidad * 2;
                nueva_lista = realloc(nueva_lista, sizeof(Nodo) * capacidad);
            }else{
                nueva_lista[cantidad_agregada] = aux;
                cantidad_agregada++;
            }
        }
    }
    return nueva_lista;
}

void secuencia_mostrar(Nodo secuencia){
    if(secuencia == NULL) return;
    for(Nodo aux = secuencia; aux != NULL; aux = aux->siguiente) printf("P: %d, Dato%d, Cant. menores: %d\n", aux->p, aux->dato, aux->cant_m);
}

int buscar_dato_por_pos(Nodo lista, int pos){
    if(lista == NULL) return -1;
    if(pos == 0) return lista->dato;
    return buscar_dato_por_pos(lista, pos - 1);
}

Nodo actualiza_menor_y_pos_alborrar(Nodo lista, int dato){
    if(lista == NULL) return NULL;
    if(lista->dato > dato) lista->cant_m--;
    lista->p--;
    lista->siguiente = actualiza_menor_y_pos_alborrar(lista->siguiente, dato);
    return lista;
}

Nodo secuencia_borrar(Nodo lista, int pos){
    if(lista == NULL) return NULL;
    int dato = buscar_dato_por_pos(lista, pos);
    if(dato){
        if(pos == 0){
            lista->siguiente = actualiza_menor_y_pos_alborrar(lista->siguiente, dato);
            Nodo siguiente = lista->siguiente;
            free(lista);
            return siguiente;        
        }
        lista->siguiente = secuencia_borrar(lista->siguiente, pos - 1);
        return lista;
        
    }
}

Nodo secuencia_ordenar(Nodo secuencia){
    if(secuencia == NULL) return NULL;
    
}