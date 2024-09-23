#include "structures.h"
#include "PQFunctions.h"
#include <algo_functions.h>

PQ* pq_crear(int capacidad){
    PQ* pq = (PQ*)malloc(sizeof(PQ));
    pq->nodos = (Nodo*)malloc(capacidad*sizeof(Nodo));
    pq->size = 0;
    pq->capacidad = capacidad;
    return pq;

}

void pq_insertar(PQ* pq, Nodo nodo, Grid* grid){
    if(pq->size == pq->capacidad){
        //Realloc
        pq->capacidad *= 2;
        pq->nodos = (Nodo*)realloc(pq->nodos, pq->capacidad*sizeof(Nodo));
        
    }
    int i = pq->size;
    pq->nodos[i] = nodo;
    pq->size++;
    while(i > 0 && nodo_calculateKey(grid, pq->nodos[i]) < nodo_calculateKey(grid, pq->nodos[(i-1)/2])){
        Nodo aux = pq->nodos[i];
        pq->nodos[i] = pq->nodos[(i-1)/2];
        pq->nodos[(i-1)/2] = aux;
        i = (i-1)/2;
    }
}

Nodo pq_extraer_minimo(PQ* pq){
    if(pq_es_vacia(pq)){
        printf("No se puede extraer de una PQ vacia\n");
        return (Nodo){-1, -1};
    }
    Nodo min = pq->nodos[0];
    pq->nodos[0] = pq->nodos[pq->size-1];
    pq->size--;
    int i = 0;
    while(2*i+1 < pq->size){
        int hijo = 2*i+1;
        if(hijo+1 < pq->size && pq->nodos[hijo+1].x < pq->nodos[hijo].x){
            hijo++;
        }
        if(pq->nodos[i].x < pq->nodos[hijo].x){
            break;
        }
        Nodo aux = pq->nodos[i];
        pq->nodos[i] = pq->nodos[hijo];
        pq->nodos[hijo] = aux;
        i = hijo;
    }
    return min;

}

bool pq_es_vacia(PQ* pq){
    return pq->size == 0;
}

void pq_free(PQ* pq){
    free(pq->nodos);
    free(pq);
}