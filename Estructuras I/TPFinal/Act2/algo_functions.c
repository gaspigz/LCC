#include "structures.h"
#include "PQFunctions.h"
#include <algo_functions.h>

int minimo(int a, int b){
    return a < b ? a : b;
}

int nodo_heuristica(Nodo a, Nodo b){
    return abs(a.x - b.x) + abs(a.y - b.y);
}


int* nodo_calculateKey(Grid* grid, Nodo nodo){
    int* key = (int*)malloc(2*sizeof(int));
    key[0] = minimo(grid->g[nodo.x][nodo.y], grid->rhs[nodo.x][nodo.y]) + nodo_heuristica(nodo, grid->inicio) + grid->km;
    key[1] = minimo(grid->g[nodo.x][nodo.y], grid->rhs[nodo.x][nodo.y]);

    //El primer componente de key es usado para ordenar los nodos en la PQ.
    //El segundo componente es usado en caso de empate.

    return key;

}

void grid_leer_desde_archivo(char* filename, Grid *grid){
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Error abriendo file");
        exit(EXIT_FAILURE);
    }

    fscanf(file, "%d %d", &grid->filas, &grid->columnas);
    fscanf(file, "%d %d", &grid->inicio.x, &grid->inicio.y);
    fscanf(file, "%d %d", &grid->fin.x, &grid->fin.y);

    grid->costos = (int **)malloc(grid->filas * sizeof(int *));
    grid->g = (int **)malloc(grid->filas * sizeof(int *));
    grid->rhs = (int **)malloc(grid->filas * sizeof(int *));
    grid->ocupadas = (bool **)malloc(grid->filas * sizeof(bool *));
    for (int i = 0; i < grid->filas; ++i) {
        grid->costos[i] = (int *)malloc(grid->columnas * sizeof(int));
        grid->g[i] = (int *)malloc(grid->columnas * sizeof(int));
        grid->rhs[i] = (int *)malloc(grid->columnas * sizeof(int));
        grid->ocupadas[i] = (bool *)malloc(grid->columnas * sizeof(bool));
        for (int j = 0; j < grid->columnas; ++j) {
            char cell;
            fscanf(file, " %c", &cell);
            grid->g[i][j] = INF;
            grid->rhs[i][j] = INF;
            if (cell == '.') {
                grid->ocupadas[i][j] = false;
                grid->costos[i][j] = 1;
            } else if (cell == '#') {
                grid->ocupadas[i][j] = true;
                grid->costos[i][j] = INF;
            }
        }
    }

    fclose(file);
}

void grid_init(Grid* grid, PQ* pq){
    grid->km = 0;
    grid->rhs[grid->fin.x][grid->fin.y] = 0;
    pq_insertar(pq, (Nodo) grid->fin, grid);
}

void grid_update_vertice(Grid* grid, Nodo u, PQ* pq){
    if (!(u.x == grid->fin.x && u.y == grid->fin.y)) {
        int min_rhs = INF;
        Nodo successors[4] = {
            {u.x + 1, u.y}, {u.x - 1, u.y}, 
            {u.x, u.y + 1}, {u.x, u.y - 1}
        };
        for (int i = 0; i < 4; i++) {
            Nodo s = successors[i];
            if (s.x >= 0 && s.x < grid->filas && s.y >= 0 && s.y < grid->columnas) {
                int cost = grid->costos[u.x][u.y];
                if (grid->g[s.x][s.y] + cost < min_rhs) {
                    min_rhs = grid->g[s.x][s.y] + cost;
                }
            }
        }
        grid->rhs[u.x][u.y] = min_rhs;
    }
    if (grid->g[u.x][u.y] != grid->rhs[u.x][u.y]) {
        pq_insertar(pq, u, grid);
    }

}

// Un nodo n se dice consistente si g(n) = rhs(n), de lo contrario es inconsistente.
/*
    Su propósito es recalcular el camino más corto desde el nodo de inicio hasta 
el nodo objetivo cada vez que hay un cambio en el entorno (como el descubrimiento de un obstáculo). 
    Utiliza una cola de prioridades para asegurar que siempre se expanda el nodo más prometedor en términos de coste estimado.
*/
// 
void computeShortestPath(Grid* grid, PQ* pq){
    while(!pq_es_vacia(pq) && 
        (nodo_calculateKey(grid, pq->nodos[0])[0] < nodo_calculateKey(grid, (Nodo) grid->inicio)[0] 
        || grid->rhs[grid->inicio.x][grid->inicio.y] != grid->g[grid->inicio.x][grid->inicio.y])){

        Nodo pq_nodo_minimo = pq_extraer_minimo(pq);
        int* k_old = nodo_calculateKey(grid, pq_nodo_minimo);
        int* k_new = nodo_calculateKey(grid, pq_nodo_minimo);
        
        // Si la clave antigua es menor que la nueva, reinserta el nodo en la cola de prioridades.
        if(k_old[0] < k_new[0]){
            pq_insertar(pq, (Nodo)pq_nodo_minimo, grid);

        }else if(grid->g[pq_nodo_minimo.x][pq_nodo_minimo.y] > grid->rhs[pq_nodo_minimo.x][pq_nodo_minimo.y]){
            // Si el valor g del nodo es mayor que su valor rhs, actualiza g al valor rhs.
            grid->g[pq_nodo_minimo.x][pq_nodo_minimo.y] = grid->rhs[pq_nodo_minimo.x][pq_nodo_minimo.y];

            Nodo vecinos[4] = {
                {pq_nodo_minimo.x + 1, pq_nodo_minimo.y}, {pq_nodo_minimo.x - 1, pq_nodo_minimo.y}, 
                {pq_nodo_minimo.x, pq_nodo_minimo.y + 1}, {pq_nodo_minimo.x, pq_nodo_minimo.y - 1}
            };
            for (int i = 0; i < 4; i++) {
                Nodo s = vecinos[i];
                if (s.x >= 0 && s.x < grid->filas && s.y >= 0 && s.y < grid->columnas && !grid->ocupadas[s.x][s.y]) {
                    grid_update_vertice(grid, s, pq);
                }
            }
            
        }else{
            grid->g[pq_nodo_minimo.x][pq_nodo_minimo.y] = INF;
            Nodo vecinos[4] = {
                {pq_nodo_minimo.x + 1, pq_nodo_minimo.y}, {pq_nodo_minimo.x - 1, pq_nodo_minimo.y}, 
                {pq_nodo_minimo.x, pq_nodo_minimo.y + 1}, {pq_nodo_minimo.x, pq_nodo_minimo.y - 1}
            };
            for (int i = 0; i < 4; i++) {
                Nodo s = vecinos[i];
                if (s.x >= 0 && s.x < grid->filas && s.y >= 0 && s.y < grid->columnas && !grid->ocupadas[s.x][s.y]) {
                    grid_update_vertice(grid, s, pq);
                }
            }
            grid_update_vertice(grid, pq_nodo_minimo, pq);
        }
    }
}


