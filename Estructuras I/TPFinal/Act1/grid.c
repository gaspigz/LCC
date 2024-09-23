#include "structures.h"
#include "grid.h"


int validar_formato_archivo(char *filename) {
    FILE *file = fopen(filename, "r");
    int bandera = 1;
    if (file == NULL) {
        bandera = 0;
    }
    int filas, columnas, rango;
    char esp1, esp2, salto;
    if (fscanf(file, "%d%c%d%c%d%c", &filas, &esp1, &columnas, &esp2, &rango, &salto) != 6) {
        bandera = 0;
    }
    if (esp1 != ' ' || esp2 != ' ' || salto != '\n') {
        bandera = 0;
    }
    if (filas < 0 || columnas < 0 || rango < 0) {
        bandera = 0;
    }

    int posini_x, posini_y, posfin_x, posfin_y;
    if (fscanf(file, "%d%c%d%c", &posini_x, &esp1, &posini_y, &salto) != 4) {
        bandera = 0;
    }
    if (esp1 != ' ' || salto != '\n') {
        bandera = 0;
    }
    if (posini_x < 0 || posini_y < 0 || posini_x >= filas || posini_y >= columnas) {
        bandera = 0;
    }
    
    if (fscanf(file, "%d%c%d%c", &posfin_x, &esp1, &posfin_y, &salto) != 4) {
        bandera = 0;
    }
    if (esp1 != ' ' || salto != '\n') {
        bandera = 0;
    }
    if (posfin_x < 0 || posfin_y < 0 || posfin_x >= filas || posfin_y >= columnas) {
        bandera = 0;
    }

    // Verificar que cada una de las siguientes filas contenga la longitud correcta
    char linea[columnas + 2]; // +2 para el salto de línea y el terminador nulo
    for (int i = 0; i < filas; i++) {
        if (fgets(linea, sizeof(linea), file) == NULL) {
            bandera = 0;
        }
        if (linea[columnas] != '\n' || (linea[columnas + 1] != '\0' && linea[columnas + 1] != '\r')) {
            bandera = 0;
        }
        for (int j = 0; j < columnas; j++) {
            if (linea[j] != '.' && linea[j] != '#') {
                bandera = 0;
            }
        }
    }
    
    fclose(file);
    return bandera;
}


void grid_leer_desde_archivo(char* filename, Grid *grid){
    if(validar_formato_archivo(filename) == 0){
        printf("El archivo %s no tiene el formato correcto\n", filename);
        exit(1);
    }

    FILE *file = fopen(filename, "r");
    if(file == NULL){
        printf("No se pudo abrir el archivo %s\n", filename);
        exit(1);
    }

    int distancia;

    fscanf(file, "%d %d %d\n", &grid->filas, &grid->columnas, &distancia);
    grid->nodos = (Nodo***)malloc(grid->filas * sizeof(Nodo**));
    for (int i = 0; i < grid->filas; i++) {
        grid->nodos[i] = (Nodo**)malloc(grid->columnas * sizeof(Nodo*));
        for (int j = 0; j < grid->columnas; j++) {
            grid->nodos[i][j] = (Nodo*)malloc(sizeof(Nodo));
        }
    }

    grid->inicio = (Nodo*)malloc(sizeof(Nodo));
    grid->fin = (Nodo*)malloc(sizeof(Nodo));

    fscanf(file, "%d %d\n", &grid->inicio->x, &grid->inicio->y);
    fscanf(file, "%d %d\n", &grid->fin->x, &grid->fin->y);

    for(int i = 0; i < grid->filas; i++){
        for(int j = 0; j < grid->columnas; j++){
            char celda;
            fscanf(file, "%c", &celda);
            if(celda == '\n'){
                fscanf(file, "%c", &celda); //Si estas al final lee uno más
            }
            if(i == grid->inicio->x && j == grid->inicio->y){
                celda = 'I';
            }
            if(i == grid->fin->x && j == grid->fin->y){
                celda = 'F';
            }
            grid->nodos[i][j]->valor = celda;
            grid->nodos[i][j]->x = i;
            grid->nodos[i][j]->y = j;
        }
    }


    
    fclose(file);
}

void mostrar_grid(Grid *grid){
    for(int i = 0; i < grid->filas; i++){
        for(int j = 0; j < grid->columnas; j++){
            printf("%c", grid->nodos[i][j]->valor);
        }
        printf("\n");
    }
}

int grid_es_pos_valida(Grid *grid, int x, int y){
    if(x >= 0 && x < grid->filas && y >= 0 && y < grid->columnas){
        return grid->nodos[x][y]->valor != '#';
    }
    return 0;
}