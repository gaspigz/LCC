#include "adicional.h"
#include <stdio.h>
#include <stdlib.h>

GList glist_crear(){
    return NULL;
}

GList agregar_inicio(GList lista, FuncionCopia copy, void* data){
    GList nueva_lista = malloc(sizeof(GNodo));
    nueva_lista->next = lista;
    nueva_lista->data = copy(data);

    return nueva_lista;
}

GList agregar_final(GList lista, FuncionCopia copy, void* data){
    GNodo *nuevo_nodo = malloc(sizeof(GNodo));
    nuevo_nodo->next = NULL;
    nuevo_nodo->data = copy(data);
    
    if(glist_esvacia(lista)){
        return nuevo_nodo;
    }

    GList inicio = lista;
    for(;inicio->next != NULL; inicio = inicio->next);
    inicio->next = nuevo_nodo;

    return lista;
}

int glist_esvacia(GList lista){
    return !lista ? 1 : 0;
}

void glist_destruir(GList lista, FuncionDestructora destroy){

}

void glist_recorrer(GList lista, FuncionVisitante visit){

    for(GNodo *inicio = lista; inicio; inicio = inicio->next){
        visit(inicio->data);
    }
    
}

GList glist_reverse(GList lista, FuncionCopia copy){
    GList reversa = NULL;
    for(GNodo *inicio = lista ;inicio; inicio = inicio->next){
        reversa = agregar_inicio(reversa, copy, inicio->data);
    }

    return reversa;
}

int glist_espalindrome(GList lista, FuncionComparadora comp, FuncionCopia copy){
    GList reversa = glist_reverse(lista, copy);
    int bandera = 1;
    for(GNodo *inicio = lista; inicio && bandera; inicio = inicio->next){
        bandera = comp(inicio->data, reversa->data);
        reversa = reversa->next;
    }

    return bandera;
}