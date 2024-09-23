#include "slist.h"
#include <stdlib.h>
#include <stdio.h>

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
  for (SNodo *nodo = lista; nodo != NULL; nodo = nodo->sig){
    visit(nodo->dato);
  }
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


SList slist_inicio_ciclo(SList lista){
  if(lista == NULL) return NULL;
  //Supongo todos los numeros mayores a 0
  int bandera = 0;
  SList temp = lista;
  while(temp != NULL && bandera == 0){
    if(temp->dato < 0){ bandera = 1;}
    else{
      temp->dato = temp->dato * -1;
      temp = temp->sig;
    }

  }
  if(bandera==0){
    for(SList aux = lista; aux!=NULL; aux = aux->sig) aux->dato = aux->dato * -1;
    return NULL;
  }else{
    bandera = 0;
    for(SList aux = lista; aux!=temp; aux = aux->sig) aux->dato = aux->dato * -1;
    for(SList aux = temp; bandera != 2; aux = aux->sig){
      aux->dato = aux->dato * -1;
      if(aux == temp){
        bandera++;
      }
      if(aux == temp && bandera == 2) aux->dato = aux->dato * -1;
    }

    return temp;
  }

}

SList hay_sumatoria_desde(SList inicio){
    SList final = NULL;
    int sumatoria = inicio->dato;
    for(SList temp = inicio->sig; temp != NULL; temp = temp->sig){
      sumatoria = sumatoria + temp->dato;
      if(sumatoria == 0) final = temp;

    }
    return final;
}

SList slist_elimina_subceros(SList lista){
  if(lista == NULL) return NULL;
  SList actual = lista;
  SList fin_subs_actual = hay_sumatoria_desde(actual);
  if(fin_subs_actual != NULL){
    return fin_subs_actual->sig;
  }else{
    lista->sig = slist_elimina_subceros(lista->sig);
  }
  return lista;
}


SList sufijo_comun(SList lista1, SList lista2){
  if(lista1 == NULL || lista2 == NULL) return NULL;
  SList lista1_r = slist_crear();
  SList lista2_r = slist_crear();
  SList lista_final = slist_crear();


  for(SList temp = lista1; temp!=NULL; temp = temp->sig){
    lista1_r = slist_agregar_inicio(lista1_r, temp->dato);
  }
  for(SList temp = lista2; temp!=NULL; temp = temp->sig){
    lista2_r = slist_agregar_inicio(lista2_r, temp->dato);
  }
  while(lista1_r->dato == lista2_r->dato){
    lista_final = slist_agregar_inicio(lista_final, lista1_r->dato);
    if(lista1_r != NULL) lista1_r = lista1_r->sig;
    if(lista2_r != NULL) lista2_r = lista2_r->sig;
  }
  //desrtuir ambas
  return lista_final;
  

}

SList reorden(SList lista){
  int cantidad = 0;
  if(lista == NULL) return NULL;
  SList lista_r = slist_crear();
  for(SList temp = lista; temp != NULL; temp = temp->sig){
    lista_r = slist_agregar_inicio(lista_r, temp->dato);
    cantidad++;
  }
  for(SList temp = lista; temp!= NULL && cantidad > 0; temp = temp->sig->sig){
    SList temp2 = temp->sig;
    SList temp3 = lista_r->sig;
    lista_r->sig = temp2;
    temp->sig = lista_r;
    lista_r = temp3;
    cantidad = cantidad - 2;
  }
  return lista;
}