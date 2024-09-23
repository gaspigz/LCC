#include <stdio.h>
#include <stdlib.h>
#include "colas.h"

Cola cola_crear(){
    return glist_crear();
}

void cola_destruir(Cola cola, FuncionDestructora destroy){
    glist_destruir(cola, destroy);
}

int cola_es_vacia(Cola cola){
    return glist_vacia(cola);
}

void* cola_inicio(Cola cola){
    return cola->inicio->dato;
}

Cola cola_encolar(Cola cola, void *dato, FuncionCopia copia){
    cola = glist_agregar_final(cola, dato, copia);
    return cola;
}

Cola cola_desencolar(Cola cola, FuncionDestructora destroy){
    GNode *node_to_destroy = cola->inicio;
    if(cola->inicio->next == NULL){
        cola->inicio = NULL;
        cola->ultimo = NULL;
    }else{
        cola->inicio = cola->inicio->next;
    }
    destroy(node_to_destroy->dato);
    free(node_to_destroy);
    return cola;

}

Cola cola_desencolar_nofree(Cola cola){
    GNode *node_to_destroy = cola->inicio;
    if(cola->inicio->next == NULL){
        cola->inicio = NULL;
        cola->ultimo = NULL;
    }else{
        cola->inicio = cola->inicio->next;
    }
    return cola;

}

void cola_imprimir(Cola cola, FuncionVisitante visit){
    printf("FIRST - . . . - LAST\n");
    for(GNode *aux = cola->inicio; aux != NULL; aux = aux->next){
        visit(aux->dato);
    }
}