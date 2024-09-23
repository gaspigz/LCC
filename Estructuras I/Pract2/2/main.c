#include <stdio.h>
#include <stdlib.h>
#include "slist.h"

static void imprimir_entero(int dato) {
  printf("%d ", dato);
}

int main(int argc, char *argv[]) {

  SList lista = slist_crear();
  SList lista2 = slist_crear();
  SList lista3 = slist_crear();

  lista = slist_agregar_inicio(lista, 3);
  lista = slist_agregar_inicio(lista, 2);
  lista = slist_agregar_inicio(lista, 1);
  lista = slist_agregar_final(lista, 4);

  lista2 = slist_agregar_inicio(lista2, 3);
  lista2 = slist_agregar_inicio(lista2, 9);
  lista2 = slist_agregar_inicio(lista2, 2);
  lista2 = slist_agregar_inicio(lista2, 4);
  lista2 = slist_agregar_final(lista2, 8);

  //lista = slist_insertar(lista, 99, 3);
  //lista = slist_eliminar(lista, 3);

  lista3 = slist_intersecar(lista2, lista);

  slist_recorrer(lista3, imprimir_entero);
  
  //puts("");
  //printf("\nLong lista: %d\n", slist_longitud(lista));

  //SList lista_concat = slist_concatenar(lista, lista2);
  //slist_recorrer(lista_concat, imprimir_entero);


  slist_destruir(lista);

  return 0;
}
