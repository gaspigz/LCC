#include <stdio.h>
#include <stdlib.h>
#include "slist.h"

static void imprimir_entero(int dato) {
  printf("%d ", dato);
}

int main(int argc, char *argv[]) {

  SList lista = slist_crear();
  //SList lista2 = slist_crear();

  lista = slist_agregar_final(lista, 3);
  lista = slist_agregar_final(lista, 4);
  lista = slist_agregar_final(lista, 6);
  lista = slist_agregar_final(lista, -10);
  lista = slist_agregar_final(lista, 8);
  lista = slist_agregar_final(lista, 9);
  lista = slist_agregar_final(lista, 10);
  lista = slist_agregar_final(lista, -19);
  lista = slist_agregar_final(lista, 10);
  lista = slist_agregar_final(lista, -18);
  lista = slist_agregar_final(lista, 20);
  lista = slist_agregar_final(lista, 25);

  /*lista2 = slist_agregar_inicio(lista2, 7);
  lista2 = slist_agregar_inicio(lista2, 6);
  lista2 = slist_agregar_inicio(lista2, 5);
  lista2 = slist_agregar_final(lista2, 8);*/

  slist_recorrer(lista, imprimir_entero);
  puts("");

  lista = slist_elimina_secuencias_0(lista);
  slist_recorrer(lista, imprimir_entero);

  //printf("\nLong lista: %d\n", slist_longitud(lista));

  //SList lista_concat = slist_concatenar(lista, lista2);
  //slist_recorrer(lista_concat, imprimir_entero);


  slist_destruir(lista);

  return 0;
}
