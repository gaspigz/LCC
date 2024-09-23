#include "slist.h"
#include <stdio.h>
#include <stdlib.h>

SList slist_crear() {
  return NULL;
}

static void imprimir_entero(int dato) {
  printf("%d ", dato);
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
  if(lista == NULL) return 0;
  int longitud = 0;
  for(SList inicio = lista; inicio != NULL; inicio = inicio->sig){
    longitud++;
  }
  return longitud;
}

SList slist_concatenar(SList lista_inicio, SList lista_final){
  if(lista_inicio == NULL) return lista_final;
  SList inicio = lista_inicio;
  for(;inicio->sig != NULL; inicio = inicio->sig);
  inicio->sig = lista_final;
  return lista_inicio;
}

SList slist_insertar(SList lista, int dato, int posicion){
  if(lista == NULL && posicion == 1) return slist_agregar_inicio(lista, dato);
  if(lista == NULL && posicion != 1) return NULL;
  if(posicion < 1) return NULL;
  if(posicion > slist_longitud(lista)+1) return NULL;
  SNodo *nuevo_nodo = malloc(sizeof(SNodo));
  nuevo_nodo->dato = dato;
  int check = 1;
  for(SList inicio = lista; inicio != NULL; inicio = inicio->sig){
    if(check == posicion-1){
      nuevo_nodo->sig = inicio->sig;
      inicio->sig = nuevo_nodo;
    }
    check++;
  }
  return lista;
}

SList slist_eliminar(SList lista, int posicion){
  if(lista == NULL) return NULL;
  if(posicion < 1) return NULL;
  if(posicion > slist_longitud(lista)+1) return NULL;

  int check = 1;
  for(SList inicio = lista; inicio != NULL; inicio = inicio->sig){
    if(check == posicion-1){
      SNodo *nodo_a_eliminar = inicio->sig;
      inicio->sig = inicio->sig->sig;
      free(nodo_a_eliminar);

    }
    check++;
  }

  return lista;

}


SList slist_intersecar(SList lista_1, SList lista_2){
  SList lista_nueva = slist_crear();

  for(SList inicio = lista_1; inicio!=NULL; inicio = inicio->sig){
    int bandera = 0;
    for(SList inicio2 = lista_2; inicio2 != NULL; inicio2 = inicio2->sig){
      if(inicio2->dato == inicio->dato) bandera = 1;
    }
    if(bandera == 1){
      lista_nueva = slist_agregar_final(lista_nueva, inicio->dato);
    }
  }
  return lista_nueva;

}
SList slist_intersecar_custom(SList lista_1, SList lista_2, FuncionComparadora comp){
  SList lista_nueva = slist_crear();
  for(SList inicio = lista_1; inicio->sig!=NULL; inicio = inicio->sig){
    int bandera = 0;
    for(SList inicio2 = lista_2; inicio2->sig != NULL; inicio2 = inicio2->sig){
      if(comp(inicio2->dato, inicio->dato) == 1) bandera = 1;
    }
    if(bandera == 1){
      lista_nueva = slist_agregar_final(lista_nueva, inicio->dato);
    }
  }
  return lista_nueva;
}






