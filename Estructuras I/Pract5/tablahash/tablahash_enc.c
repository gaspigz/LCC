#include "tablahash.h"
#include "avl.h"
#include <assert.h>
#include <stdlib.h>

/**
 * Casillas en la que almacenaremos los datos de la tabla hash.
 */
typedef struct {
  AVL dato;
} CasillaHash;

/** 
 * Estructura principal que representa la tabla hash.
 */
struct _TablaHash {
  CasillaHash *elems;
  unsigned numElems;
  unsigned capacidad;
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
TablaHash tablahash_insertar(TablaHash tabla, void *dato) {

  float fact_carga = tabla->numElems / tabla->capacidad;
  //COMPLETAR REDIMENSION SI FACT >= 0.7
  if(fact_carga >= 0.7){
    tabla = tablahash_redimensionar(tabla);
  }

  // Calculamos la posicion del dato dado, de acuerdo a la funcion hash.
  unsigned idx = tabla->hash(dato) % tabla->capacidad;

  // Insertar el dato si la casilla estaba libre.
  if (tabla->elems[idx].dato == NULL) {
    tabla->numElems++;
    tabla->elems[idx].dato = avl_crear(tabla->copia, tabla->comp, tabla->destr);
    avl_insertar(tabla->elems[idx].dato, dato);
    return tabla;
  }
  // Sobrescribir el dato si el mismo ya se encontraba en la tabla.
  else if (tabla->comp(tabla->elems[idx].dato->raiz, dato) == 0) {
    // COMPLETAR
    return tabla;
  }
  else {
    if(avl_buscar(tabla->elems[idx].dato, dato) == 0){
      avl_insertar(tabla->elems[idx].dato, dato);
    }else{
      // IMPLEMENTAR destruir y sobrescribir
      return tabla;
    }
    return tabla;
  }
}

/**
 * Retorna el dato de la tabla que coincida con el dato dado, o NULL si el dato
 * buscado no se encuentra en la tabla.
 */
void *tablahash_buscar(TablaHash tabla, void *dato) {

  // Calculamos la posicion del dato dado, de acuerdo a la funcion hash.
  unsigned idx = tabla->hash(dato) % tabla->capacidad;

  // Retornar NULL si la casilla estaba vacia.
  if (tabla->elems[idx].dato == NULL)
    return NULL;
  // Retornar el dato de la casilla si hay concidencia.
  else if (avl_buscar(tabla->elems[idx].dato, dato) != 0)
    return tabla->elems[idx].dato->raiz;
  // Retornar NULL en otro caso.
  else
    return NULL;
}

/**
 * Elimina el dato de la tabla que coincida con el dato dado.
 */
void tablahash_eliminar(TablaHash tabla, void *dato) {

  // Calculamos la posicion del dato dado, de acuerdo a la funcion hash.
  unsigned idx = tabla->hash(dato) % tabla->capacidad;

  // Retornar si la casilla estaba vacia.
  if (tabla->elems[idx].dato == NULL)
    return;
  // Vaciar la casilla si hay coincidencia.
  else if (tabla->comp(tabla->elems[idx].dato, dato) == 0) {
    tabla->numElems--;
    tabla->destr(tabla->elems[idx].dato);
    tabla->elems[idx].dato = NULL;
    return;
  }
}

TablaHash tablahash_redimensionar(TablaHash tabla){
  TablaHash nueva_tabla = tablahash_crear(tabla->capacidad * 2, tabla->copia, tabla->comp, tabla->destr, tabla->hash);
  for(int i = 0; i < tabla->capacidad && tabla->numElems != 0; i++){
    if(tabla->elems[i].dato != NULL){
      
    }
  }
}