#include "slist.h"
#include <stdlib.h>

SList slist_crear() {
  return NULL;
}

void slist_destruir(SList lista) {
  SNodo *nodoAEliminar;
  while (lista != NULL) {
    nodoAEliminar = lista;
    lista = lista->sig;
    free(nodoAEliminar);
  }
}

int slist_vacia(SList lista) {
  return lista == NULL;
}

SList slist_agregar_final(SList lista, int dato) {
  SNodo *nuevoNodo = malloc(sizeof(SNodo));
  nuevoNodo->dato = dato;
  nuevoNodo->sig = NULL;

  if (lista == NULL)
    return nuevoNodo;

  SList nodo = lista;
  for (;nodo->sig != NULL;nodo = nodo->sig);
  /* ahora 'nodo' apunta al ultimo elemento en la lista */

  nodo->sig = nuevoNodo;
  return lista;
}

SList slist_agregar_inicio(SList lista, int dato) {
  SNodo *nuevoNodo = malloc(sizeof(SNodo));
  nuevoNodo->dato = dato;
  nuevoNodo->sig = lista;
  return nuevoNodo;
}

void slist_recorrer(SList lista, FuncionVisitante visit) {
  for (SNodo *nodo = lista; nodo != NULL; nodo = nodo->sig)
    visit(nodo->dato);
}

int slist_longitud(SList lista){
  if(slist_vacia(lista) == 1) return 0;
  return 1 + slist_longitud(lista->sig);

}

SList slist_concatenar(SList lista1, SList lista2){
  if(slist_vacia(lista1) == 1) return lista2;
  SNodo *aux = lista1;
  for(;aux->sig != NULL; aux = aux->sig);
  aux->sig = lista2;
  return lista1;

}     // que devuelve la concatenaci´on de dos listas, modificando la primera.

SList slist_insertar(SList lista, int dato, int pos){
  if(pos < 0) return lista;
  if(lista == NULL){
    SNodo *nuevo_nodo = malloc(sizeof(SNodo));
    nuevo_nodo->dato = dato;
    nuevo_nodo->sig = lista;
    return nuevo_nodo;
  }
  if(pos == 0){
    SNodo *nuevo_nodo = malloc(sizeof(SNodo));
    nuevo_nodo->dato = dato;
    nuevo_nodo->sig = lista;
    return nuevo_nodo;
  }
  lista->sig = slist_insertar(lista->sig, dato, pos-1);
  return lista; 


}     // que inserta un dato en una lista en una posici´on arbitraria.

SList slist_eliminar(SList lista, int pos){
  if(pos<0) return lista;
  if(lista == NULL) return NULL;
  if(pos == 0){
    SNodo* aux = lista->sig;
    lista->sig = NULL;
    return aux;
  }
  lista->sig = slist_eliminar(lista->sig, pos-1);
  return lista;
}     // que borra de una lista un dato apuntado en una posici´on arbitraria.

int slist_contiene(SList lista, int dato){
  if(lista == NULL) return 0;
  if(lista->dato == dato) return 1;
  return slist_contiene(lista->sig, dato);
}     // que determina si un elemento est´a en una lista dada.

int slist_indice(SList lista, int dato){
  if(lista == NULL) return -1;
  if(lista->dato == dato) return 0;
  return slist_indice(lista->sig, dato) == -1 ? -1 : 1 + slist_indice(lista->sig, dato);
}     // que devuelve la posici´on de la primera ocurrencia de un elemento si el mismo est´a en la lista dada, y -1 en caso que no est´e.

SList slist_intersecar(SList lista1, SList lista2){
  if(lista1 == NULL) return NULL;
  if(lista2 == NULL) return NULL;

  SNodo* lista_nueva = slist_crear();
  for(SNodo* aux = lista1; aux != NULL; aux = aux->sig ){
    if(slist_contiene(lista2, aux->dato) == 1){
      lista_nueva = slist_agregar_final(lista_nueva, aux->dato);
    }
  }
  return lista_nueva;

}     // que devuelve una nueva lista con los elementos comunes (independientemente de la posici´on) de dos listas dadas por par´ametro. Las listas originales no se modifican.

SList slist_ordenar_aux(SList lista, int inicio, int final){
  if(inicio < final){
    int mitad = inicio + (final - inicio) / 2;
    
  }
  return lista;
}

SList slist_ordenar(SList lista){
    lista = slist_ordenar_aux(lista, 0, slist_longitud(lista)-1);
}      // que ordena una lista de acuerdo al criterio dado por una funci´on de comparaci´on (que usa los mismos valores de retorno que strcmp()) pasada por par´ametro.
