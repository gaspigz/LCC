#include "contacto.h"
#include "tablahash.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#define CAPACIDAD_INICIAL 11

/**
 * Caso de prueba: Tabla hash para contactos
 */
int main() {
  // Iniciar tabla hash
  TablaHash tabla = tablahash_crear(
      CAPACIDAD_INICIAL, (FuncionCopiadora)contacto_copia,
      (FuncionComparadora)contacto_comparar,
      (FuncionDestructora)contacto_destruir, (FuncionHash)contacto_heashear);

  // Contactos
  Contacto *agenda[6];
  agenda[0] = contacto_crear("Pepe Argento", "3412695452", 61);
  agenda[1] = contacto_crear("Moni Argento", "3412684759", 60);
  agenda[2] = contacto_crear("Coqui Argento", "3415694286", 32);
  agenda[3] = contacto_crear("Paola Argento", "3416259862", 29);
  agenda[4] = contacto_crear("Maria Elena Fuseneco", "3416874594", 59);
  agenda[5] = contacto_crear("Dardo Fuseneco", "3416894526", 64);

  // Insertar contactos
  printf("Insercion:\n");
  for (int i = 0; i < 6; ++i) {
    printf("Insertando el contacto: ");
    contacto_imprimir(agenda[i]);
    printf(" en la casilla %d.\n",
           contacto_heashear(agenda[i]) % tablahash_capacidad(tabla));
    int nElems = tablahash_nelems(tabla);
    tablahash_insertar(tabla, agenda[i]);
    if (tablahash_nelems(tabla) == nElems)
      printf("\tInsercion fallida: Colision.\n");
    else
      printf("\tInsercion exitosa.\n");
  }

  // Buscar contactos
  printf("\nBusqueda:\n");
  for (int i = 0; i < 6; ++i) {
    printf("Buscando el contacto: ");
    contacto_imprimir(agenda[i]);
    puts("");
    Contacto *ret = tablahash_buscar(tabla, agenda[i]);
    if (ret != NULL)
      printf("\tSe encuentra en la tabla.\n");
    else
      printf("\tNo se encuentra en la tabla.\n");
  }

  // Eliminar contactos
  printf("\nEliminacion:\n");
  for (int i = 5; i > 2; --i) {
    printf("Eliminando el contacto: ");
    contacto_imprimir(agenda[i]);
    puts("");
    tablahash_eliminar(tabla, agenda[i]);
  }

  // Buscar contactos después de eliminación
  printf("\nBusqueda después de eliminacion:\n");
  for (int i = 0; i < 6; ++i) {
    printf("Buscando el contacto: ");
    contacto_imprimir(agenda[i]);
    puts("");
    Contacto *ret = tablahash_buscar(tabla, agenda[i]);
    if (ret != NULL)
      printf("\tSe encuentra en la tabla.\n");
    else
      printf("\tNo se encuentra en la tabla.\n");
  }

  // Sobrescribir un contacto
  Contacto *nuevoContacto = contacto_crear("Pepe Argento", "3410000000", 71);
  printf("\nSobrescribiendo el contacto: ");
  contacto_imprimir(agenda[0]);
  printf("\n\tpor: ");
  contacto_imprimir(nuevoContacto);
  puts("");
  tablahash_insertar(tabla, nuevoContacto);

  // Chequeamos que se haya sobrescrito
  Contacto *ret = tablahash_buscar(tabla, agenda[0]);
  printf("El nuevo contacto es: ");
  contacto_imprimir(ret);
  puts("");

  // Prueba de redimensionamiento
  printf("\nPrueba de redimensionamiento:\n");
  for (int i = 0; i < 100; ++i) {
    char nombre[20];
    sprintf(nombre, "Contacto %d", i);
    char telefono[20];
    sprintf(telefono, "341%06d", i);
    Contacto *contacto = contacto_crear(nombre, telefono, 30 + i % 50);
    tablahash_insertar(tabla, contacto);
    contacto_destruir(contacto);
  }

  // Verificar la capacidad de la tabla después del redimensionamiento
  printf("Capacidad de la tabla después del redimensionamiento: %d\n", tablahash_capacidad(tabla));
  printf("Numero de elementos en la tabla: %d\n", tablahash_nelems(tabla));

  printf("\nBusqueda:\n");
  for (int i = 0; i < 6; ++i) {
    printf("Buscando el contacto: ");
    contacto_imprimir(agenda[i]);
    puts("");
    Contacto *ret = tablahash_buscar(tabla, agenda[i]);
    if (ret != NULL)
      printf("\tSe encuentra en la tabla.\n");
    else
      printf("\tNo se encuentra en la tabla.\n");
  }

  // Pruebas adicionales de inserción, búsqueda y eliminación después del redimensionamiento
  printf("\nPruebas adicionales después del redimensionamiento:\n");

  // Insertar nuevos contactos
  Contacto *nuevoAgenda[3];
  nuevoAgenda[0] = contacto_crear("Lisa Simpson", "3411234567", 8);
  nuevoAgenda[1] = contacto_crear("Bart Simpson", "3417654321", 10);
  nuevoAgenda[2] = contacto_crear("Marge Simpson", "3411111111", 38);

  for (int i = 0; i < 3; ++i) {
    printf("Insertando el nuevo contacto: ");
    contacto_imprimir(nuevoAgenda[i]);
    printf(" en la casilla %d.\n",
           contacto_heashear(nuevoAgenda[i]) % tablahash_capacidad(tabla));
    tablahash_insertar(tabla, nuevoAgenda[i]);
  }

  // Buscar nuevos contactos
  printf("\nBusqueda de nuevos contactos:\n");
  for (int i = 0; i < 3; ++i) {
    printf("Buscando el nuevo contacto: ");
    contacto_imprimir(nuevoAgenda[i]);
    puts("");
    Contacto *ret = tablahash_buscar(tabla, nuevoAgenda[i]);
    if (ret != NULL)
      printf("\tSe encuentra en la tabla.\n");
    else
      printf("\tNo se encuentra en la tabla.\n");
  }

  // Eliminar nuevos contactos
  printf("\nEliminacion de nuevos contactos:\n");
  for (int i = 0; i < 3; ++i) {
    printf("Eliminando el nuevo contacto: ");
    contacto_imprimir(nuevoAgenda[i]);
    puts("");
    tablahash_eliminar(tabla, nuevoAgenda[i]);
  }

  // Buscar nuevos contactos después de eliminación
  printf("\nBusqueda de nuevos contactos después de eliminacion:\n");
  for (int i = 0; i < 3; ++i) {
    printf("Buscando el nuevo contacto: ");
    contacto_imprimir(nuevoAgenda[i]);
    puts("");
    Contacto *ret = tablahash_buscar(tabla, nuevoAgenda[i]);
    if (ret != NULL)
      printf("\tSe encuentra en la tabla.\n");
    else
      printf("\tNo se encuentra en la tabla.\n");
  }

  // Liberar memoria
  tablahash_destruir(tabla);
  for (int i = 0; i < 6; ++i)
    contacto_destruir(agenda[i]);
  contacto_destruir(nuevoContacto);
  for (int i = 0; i < 3; ++i)
    contacto_destruir(nuevoAgenda[i]);

  return 0;
}

