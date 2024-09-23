#include <stdio.h>
#include <stdlib.h>
#include "slist.h"

static void imprimir_entero(int dato) {
  printf("%d ", dato);
}

int main(int argc, char *argv[]) {

  SList lista = slist_crear();
  SList lista2 = slist_crear();

  lista = slist_agregar_inicio(lista, 3);
  lista = slist_agregar_inicio(lista, 2);
  lista = slist_agregar_inicio(lista, 1);
  lista = slist_agregar_final(lista, 4);

  lista2 = slist_agregar_final(lista2, 2);
  lista2 = slist_agregar_final(lista2, 5);
  lista2 = slist_agregar_final(lista2, 3);
  lista2 = slist_agregar_final(lista2, 6);

  slist_recorrer(lista, imprimir_entero);
  puts("");
  slist_recorrer(lista2, imprimir_entero);


  printf("Longitud: %d\n", slist_longitud(lista));

  lista = slist_concatenar(lista, lista2);
  slist_recorrer(lista, imprimir_entero);
  printf("\n\n");

  lista2 = slist_insertar(lista2, 19, 20);
  lista2 = slist_eliminar(lista2, 2);
  slist_recorrer(lista2, imprimir_entero);


  slist_destruir(lista);

  return 0;
}
