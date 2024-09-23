#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "structures.h"
#include "PQFunctions.h"
#include "algo_functions.h"

bool posicionValida(Grid *grid, int x, int y) {
    return x >= 0 && x < grid->filas && y >= 0 && y < grid->columnas && !grid->ocupadas[x][y];
}

void printPath(char* path) {
    printf("! %s\n", path);
    fflush(stdout);
}

void simulateRobot(Grid *grid, PQ *pq) {
    Nodo actual = grid->inicio;
    char path[1000];
    int path_len = 0;
    
    while (actual.x != grid->fin.x || actual.y != grid->fin.y) {
        computeShortestPath(grid, pq);
        Nodo vecinos[4] = {
            {actual.x + 1, actual.y}, {actual.x - 1, actual.y}, 
            {actual.x, actual.y + 1}, {actual.x, actual.y - 1}
        };
        Nodo next = actual;
        int min_cost = INF;

        for (int i = 0; i < 4; i++) {
            Nodo s = vecinos[i];
            if (posicionValida(grid, s.x, s.y) && grid->g[s.x][s.y] < min_cost) {
                min_cost = grid->g[s.x][s.y];
                next = s;
            }
        }

        if (next.x == actual.x && next.y == actual.y) {
            printf("No hay camino posible\n");
            return;
        }

        if (next.x == actual.x + 1) path[path_len++] = 'D';
        else if (next.x == actual.x - 1) path[path_len++] = 'U';
        else if (next.y == actual.y + 1) path[path_len++] = 'R';
        else if (next.y == actual.y - 1) path[path_len++] = 'L';

        actual = next;
    }
    path[path_len] = '\0';
    printPath(path);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Uso: %s <archivo de entorno>\n", argv[0]);
        return 1;
    }

    Grid grid;
    PQ *pq = pq_crear(1000);
    grid_leer_desde_archivo(argv[1], &grid);
    grid_init(&grid, pq);
    simulateRobot(&grid, pq);

    pq_free(pq);
    // Liberar memoria de grid
    for (int i = 0; i < grid.filas; ++i) {
        free(grid.costos[i]);
        free(grid.g[i]);
        free(grid.rhs[i]);
        free(grid.ocupadas[i]);
    }
    free(grid.costos);
    free(grid.g);
    free(grid.rhs);
    free(grid.ocupadas);

    return 0;
}
