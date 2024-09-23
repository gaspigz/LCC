#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "tablahash/tablahash.h"
#include "grid.h"
#include "robot.h"

#define CAPACIDAD_INICIAL 11

int main(){

    Grid *grid;
    grid = malloc(sizeof(Grid));
    assert(grid != NULL);
    grid_leer_desde_archivo("tableros/main.txt", grid);
    mostrar_grid(grid);

    Robot *robot = robot_crear(grid);
    while(robot_finalizo(robot) == 0){
        
    }
    

    return 0;
}