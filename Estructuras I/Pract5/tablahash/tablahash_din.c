#include "tablahash.h"
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

#define STEP 3
#define CENTINELA ((TablaHash) 1)

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

  float factor = (tabla->numElems + 1) / tabla->capacidad;
  if(factor >= 0.7){
    tabla = tablahash_redimensionar(tabla);
  }

  // Calculamos la posicion del dato dado, de acuerdo a la funcion hash.
  unsigned idx = tabla->hash(dato) % tabla->capacidad;

  // Insertar el dato si la casilla estaba libre.
  if (tabla->elems[idx].dato == NULL) {
    tabla->numElems++;
    tabla->elems[idx].dato = tabla->copia(dato);
    return tabla;
  }
  // Sobrescribir el dato si el mismo ya se encontraba en la tabla.
  else if (tabla->comp(tabla->elems[idx].dato, dato) == 0) {
    tabla->destr(tabla->elems[idx].dato);
    tabla->elems[idx].dato = tabla->copia(dato);
    return tabla;
  }
  else {
    unsigned idx_original = idx;
    idx = (idx + STEP) % tabla->capacidad;
    int bandera = 0;
    while(idx_original != idx && bandera == 0){
      if (tabla->elems[idx].dato == NULL) {
        tabla->numElems++;
        tabla->elems[idx].dato = tabla->copia(dato);
        bandera = 1;
      }else if (tabla->comp(tabla->elems[idx].dato, dato) == 0) {
        tabla->destr(tabla->elems[idx].dato);
        tabla->elems[idx].dato = tabla->copia(dato);
        bandera = 1;
      }else{
        idx = (idx + STEP) % tabla->capacidad;
      }
    }
    while(idx_original != idx && bandera == 0){
      if (tabla->elems[idx].dato == CENTINELA) {
        tabla->numElems++;
        tabla->elems[idx].dato = tabla->copia(dato);
        bandera = 1;
      }else if (tabla->comp(tabla->elems[idx].dato, dato) == 0) {
        tabla->destr(tabla->elems[idx].dato);
        tabla->elems[idx].dato = tabla->copia(dato);
        bandera = 1;
      }else{
        idx = (idx + STEP) % tabla->capacidad;
      }
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
  
  else if(tabla->elems[idx].dato == CENTINELA || tabla->comp(tabla->elems[idx].dato, dato) != 0){
    unsigned idx_original = idx;
    idx = (idx + STEP) % tabla->capacidad;
    int bandera = 0;
    while(idx_original != idx && bandera == 0){
      if (tabla->elems[idx].dato == NULL) {
        bandera = 2; // No se encontró
      }else if(tabla->elems[idx].dato == CENTINELA){
        idx = (idx + STEP) % tabla->capacidad;
      } else if (tabla->comp(tabla->elems[idx].dato, dato) == 0) {
        bandera = 1; // Se encontró
      }else{
        idx = (idx + STEP) % tabla->capacidad;
      }
    }
    if(bandera == 0 || bandera == 2) return NULL;
    return tabla->elems[idx].dato; // Bandera = 1 si o si.
  }
  else if (tabla->comp(tabla->elems[idx].dato, dato) == 0)
    return tabla->elems[idx].dato;
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
    tabla->elems[idx].dato = CENTINELA;
    return;
  }else{
    unsigned idx_original = idx;
    idx = (idx + STEP) % tabla->capacidad;
    int bandera = 0;
    while(idx_original != idx && bandera == 0){
      if(tabla->elems[idx].dato == NULL){
        return;
      }else if(tabla->comp(tabla->elems[idx].dato, dato) == 0){
        tabla->numElems--;
        tabla->destr(tabla->elems[idx].dato);
        tabla->elems[idx].dato = CENTINELA;
        bandera = 1;
      }else{
        idx = (idx + STEP) % tabla->capacidad;
      }
    }
  }
  return;
}

unsigned esprimo(unsigned numero){
  if(numero == 0) return 0;
  unsigned cant_div = 0;
  for(int i = 1; i < numero; i++){
    if(numero % i == 0) cant_div++;
  }
  return cant_div == 1;
}

unsigned primer_primo_post(unsigned numero){
  if(esprimo(numero)) return numero;
  return primer_primo_post(numero + 1);
}

TablaHash tablahash_redimensionar(TablaHash tabla) {
  assert(tabla != NULL);
  unsigned nueva_capacidad = primer_primo_post(tabla->capacidad * 2);
  TablaHash nueva_tabla = tablahash_crear(nueva_capacidad, tabla->copia, tabla->comp, tabla->destr, tabla->hash);

  for (unsigned i = 0; i < tabla->capacidad; i++) {
    if (tabla->elems[i].dato != NULL && tabla->elems[i].dato != CENTINELA) {
      tablahash_insertar(nueva_tabla, tabla->elems[i].dato);
    }
  }

  tablahash_destruir(tabla);
  return nueva_tabla;
}
