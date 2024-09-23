#include "glist.h"
#include <assert.h>
#include <stdlib.h>

/**
 * Devuelve una lista vacía.
 */
GList *glist_crear() { 
  GList *lista = malloc(sizeof(GList));
  lista->inicio = NULL;
  lista->ultimo = NULL;
  return lista;
 }

/**
 * Destruccion de la lista.
 * destroy es una función que libera el dato almacenado.
 */
void glist_destruir(GList *list, FuncionDestructora destroy) {
  GNode *nodeToDelete;
  GNode *aux = list->inicio;
  while (aux != NULL) {
    nodeToDelete = aux;
    aux = aux->next;
    list->inicio = aux;
    destroy(nodeToDelete->dato);
    free(nodeToDelete);
  }
  free(list);
}

/**
 * Determina si la lista es vacía.
 */
int glist_vacia(GList *list) { return (list->inicio == NULL); }

/**
 * Agrega un elemento al inicio de la lista.
 * copy es una función que retorna una copia física del dato.
 */
GList *glist_agregar_inicio(GList *list, void *data, FuncionCopia copy) {
  GNode *newNode = malloc(sizeof(GNode));
  newNode->dato = copy(data);
  newNode->next = NULL;
  if(list->inicio == NULL){
    list->inicio = newNode;
    list->ultimo = newNode;
  }else{
    newNode->next = list->inicio;
    list->inicio = newNode;
  }
  return list;
}

GList *glist_agregar_final(GList* list, void *data, FuncionCopia copy){
  GNode *newNode = malloc(sizeof(GNode));
  newNode->dato = copy(data);
  newNode->next = NULL;
  if(list->inicio == NULL){
    list->inicio = newNode;
    list->ultimo = newNode;
  }else{
    list->ultimo->next = newNode;
    list->ultimo = newNode;
  }
  return list;
  
}

/**
 * Recorrido de la lista, utilizando la funcion pasada.
 */
void glist_recorrer(GList *list, FuncionVisitante visit) {
  for (GNode *node = list->inicio; node != NULL; node = node->next)
    visit(node->dato);
}

