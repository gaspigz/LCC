#include "tablahash.h"
#include <assert.h>
#include <stdlib.h>

/**
 * Casillas en la que almacenaremos los datos de la tabla hash.
 */
typedef struct {
  void *dato;
} CasillaHash;

/**
 * Estructura principal que representa la tabla hash.
 */
struct _TablaHash {
  CasillaHash *elems;
  unsigned numElems;
  unsigned capacidad;
  unsigned numDeletes;
  FuncionCopiadora copia;
  FuncionComparadora comp;
  FuncionDestructora destr;
  FuncionHash hash;
};


/**
 * Crea una nueva tabla hash vacia, con la capacidad dada.
 */
TablaHash tablahash_crear(unsigned capacidad, FuncionCopiadora copia,
                          FuncionComparadora comp, FuncionDestructora destr,
                          FuncionHash hash) {

  // Pedimos memoria para la estructura principal y las casillas.
  TablaHash tabla = malloc(sizeof(struct _TablaHash));
  assert(tabla != NULL);
  tabla->elems = malloc(sizeof(CasillaHash) * capacidad);
  assert(tabla->elems != NULL);
  tabla->numElems = 0;
  tabla->capacidad = capacidad;
  tabla->copia = copia;
  tabla->comp = comp;
  tabla->destr = destr;
  tabla->hash = hash;

  // Inicializamos las casillas con datos nulos.
  for (unsigned idx = 0; idx < capacidad; ++idx) {
    tabla->elems[idx].dato = NULL;
  }

  return tabla;
}

/**
 * Retorna el numero de elementos de la tabla.
 */
int tablahash_nelems(TablaHash tabla) { return tabla->numElems; }

/**
 * Retorna la capacidad de la tabla.
 */
int tablahash_capacidad(TablaHash tabla) { return tabla->capacidad; }

/**
 * Destruye la tabla.
 */
void tablahash_destruir(TablaHash tabla) {

  // Destruir cada uno de los datos.
  for (unsigned idx = 0; idx < tabla->capacidad; ++idx)
    if (tabla->elems[idx].dato != NULL)
      tabla->destr(tabla->elems[idx].dato);

  // Liberar el arreglo de casillas y la tabla.
  free(tabla->elems);
  free(tabla);
  return;
}

/**
 * Inserta un dato en la tabla, o lo reemplaza si ya se encontraba.
 * IMPORTANTE: La implementacion no maneja colisiones.
 */
void tablahash_insertar(TablaHash tabla, void *dato) {
  if (tabla->numElems / (double)tabla->capacidad > 0.7) {
    tablahash_redimensionar(tabla);
  }

  unsigned idx = tabla->hash(dato) % tabla->capacidad;
  unsigned originalIdx = idx;
  while (tabla->elems[idx].dato != NULL && tabla->comp(tabla->elems[idx].dato, dato) != 0) {
    idx = (idx + 1) % tabla->capacidad;
    if (idx == originalIdx) return; // Tabla llena
  }

  if (tabla->elems[idx].dato == NULL) {
    tabla->numElems++;
  } else {
    tabla->destr(tabla->elems[idx].dato);
  }

  tabla->elems[idx].dato = tabla->copia(dato);
}

/**
 * Redimensiona la tabla hash.
 */
void tablahash_redimensionar(TablaHash tabla) {
  unsigned nuevaCapacidad = tabla->capacidad * 2;
  CasillaHash *nuevosElems = malloc(sizeof(CasillaHash) * nuevaCapacidad);
  assert(nuevosElems != NULL);

  for (unsigned idx = 0; idx < nuevaCapacidad; ++idx) {
    nuevosElems[idx].dato = NULL;
  }

  CasillaHash *viejosElems = tabla->elems;
  unsigned viejaCapacidad = tabla->capacidad;

  tabla->elems = nuevosElems;
  tabla->capacidad = nuevaCapacidad;
  tabla->numElems = 0;
  tabla->numDeletes = 0;

  for (unsigned idx = 0; idx < viejaCapacidad; ++idx) {
    if (viejosElems[idx].dato != NULL) {
      tablahash_insertar(tabla, viejosElems[idx].dato);
      tabla->destr(viejosElems[idx].dato);
    }
  }

  free(viejosElems);
}

/**
 * Retorna el dato de la tabla que coincida con el dato dado, o NULL si el dato
 * buscado no se encuentra en la tabla.
 */
void *tablahash_buscar(TablaHash tabla, void *dato) {
  unsigned idx = tabla->hash(dato) % tabla->capacidad;
  unsigned originalIdx = idx;

  while (tabla->elems[idx].dato != NULL) {
    if (tabla->comp(tabla->elems[idx].dato, dato) == 0) {
      return tabla->elems[idx].dato;
    }
    idx = (idx + 1) % tabla->capacidad;
    if (idx == originalIdx) break;
  }

  return NULL;
}
/**
 * Elimina el dato de la tabla que coincida con el dato dado.
 */
void tablahash_eliminar(TablaHash tabla, void *dato) {
  unsigned idx = tabla->hash(dato) % tabla->capacidad;
  unsigned originalIdx = idx;

  while (tabla->elems[idx].dato != NULL) {
    if (tabla->comp(tabla->elems[idx].dato, dato) == 0) {
      tabla->destr(tabla->elems[idx].dato);
      tabla->elems[idx].dato = NULL;
      tabla->numElems--;
      tabla->numDeletes++;
      return;
    }
    idx = (idx + 1) % tabla->capacidad;
    if (idx == originalIdx) break;
  }
}

