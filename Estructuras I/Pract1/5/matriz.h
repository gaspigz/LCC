#include <stdlib.h>

typedef struct _Matriz* Matriz;

Matriz matriz_crear();

void matriz_destruir(Matriz matriz);

void matriz_mostrar(Matriz matriz);

void matriz_mostrar_pos(Matriz matriz, int fil, int col);

void matriz_escribir_pos(Matriz matriz, int fil, int col, float dato);

int matriz_numero_filas(Matriz matriz);

int matriz_numero_columnas(Matriz matriz);

void matriz_intercambia_filas(Matriz matriz, int fila1, int fila2);

void matriz_inserta_fila(Matriz matriz, int pos);