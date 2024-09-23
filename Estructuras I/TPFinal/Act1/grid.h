#ifndef GRID_H
#define GRID_H
#include "structures.h"

int validar_formato_archivo(char *filename);

void grid_leer_desde_archivo(char* filename, Grid *grid);

void mostrar_grid(Grid *grid);

int grid_es_pos_valida(Grid *grid, int x, int y);

#endif // GRID_H