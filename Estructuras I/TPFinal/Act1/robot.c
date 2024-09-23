#include <stdio.h>
#include <stdlib.h>
#include "structures.h"
#include "tablahash/utils.h"
#include "grid.h"

#define CAPACIDAD_INICIAL 11

char *char_copia(char * dato){
    return dato;
}

Robot *robot_crear(Grid *grid){
    Robot *robot = malloc(sizeof(Robot));
    robot->tabla_recorridos = tablahash_crear(CAPACIDAD_INICIAL,(FuncionCopiadora) nodo_copia, (FuncionComparadora) nodo_comparar, (FuncionDestructora) nodo_destruir,(FuncionHash) nodo_hash);
    robot->tabla_obstaculos = tablahash_crear(CAPACIDAD_INICIAL, (FuncionCopiadora) nodo_copia, (FuncionComparadora) nodo_comparar, (FuncionDestructora) nodo_destruir, (FuncionHash) nodo_hash);
    robot->pila_movimientos = pilas_crear();
    robot->fin = grid->fin;
    robot->posicion_actual = grid->inicio;
    tablahash_insertar(robot->tabla_recorridos, robot->posicion_actual);
    return robot;
}

int robot_finalizo(Robot *robot){
    return nodo_comparar(robot->posicion_actual, robot->fin);
}

void robot_get_mejores_movimientos(Robot *robot, char *mejores_movimientos){
    int act_x = robot->posicion_actual->x;
    int act_y = robot->posicion_actual->y;
    int fin_x = robot->fin->x;
    int fin_y = robot->fin->y;

    if(act_x < fin_x && act_y < fin_y){ // El objetivo está abajo y a la derecha
        mejores_movimientos[0] = 'R';
        mejores_movimientos[1] = 'D';
        mejores_movimientos[2] = 'U';
        mejores_movimientos[3] = 'L';
    }
    if(act_x < fin_x && act_y > fin_y){ // El objetivo está abajo y a la izquierda
        mejores_movimientos[0] = 'L';
        mejores_movimientos[1] = 'D';
        mejores_movimientos[2] = 'U';
        mejores_movimientos[3] = 'R';
    }
    if(act_x > fin_x && act_y < fin_y){ // El objetivo está arriba y a la derecha
        mejores_movimientos[0] = 'R';
        mejores_movimientos[1] = 'U';
        mejores_movimientos[2] = 'D';
        mejores_movimientos[3] = 'L';
    }
    if(act_x > fin_x && act_y > fin_y){ // El objetivo está arriba y a la izquierda
        mejores_movimientos[0] = 'L';
        mejores_movimientos[1] = 'U';
        mejores_movimientos[2] = 'D';
        mejores_movimientos[3] = 'R';
    }
    if(act_x == fin_x && act_y < fin_y){ // El objetivo está abajo
        mejores_movimientos[0] = 'D';
        mejores_movimientos[1] = 'U';
        mejores_movimientos[2] = 'R';
        mejores_movimientos[3] = 'L';
    }
    if(act_x == fin_x && act_y > fin_y){ // El objetivo está arriba
        mejores_movimientos[0] = 'U';
        mejores_movimientos[1] = 'D';
        mejores_movimientos[2] = 'R';
        mejores_movimientos[3] = 'L';
    }
    if(act_x < fin_x && act_y == fin_y){ // El objetivo está a la derecha
        mejores_movimientos[0] = 'R';
        mejores_movimientos[1] = 'L';
        mejores_movimientos[2] = 'U';
        mejores_movimientos[3] = 'D';
    }
    if(act_x > fin_x && act_y == fin_y){ // El objetivo está a la izquierda
        mejores_movimientos[0] = 'L';
        mejores_movimientos[1] = 'R';
        mejores_movimientos[2] = 'U';
        mejores_movimientos[3] = 'D';
    }
}

int robot_moverse(Robot *robot, Grid *grid){
    char mejores_movimientos[4]; // Array [arriba, abajo, izquierda, derecha] ordenados del 1 al 4 (por ej. si fuera [3, 1, 2, 4] el mejor movimiento sería abajo)
    robot_get_mejores_movimientos(robot, mejores_movimientos);
    int opciones = 4;
    int x = robot->posicion_actual->x;
    int y = robot->posicion_actual->y;

    int se_movio = 0;
    while(!se_movio){
        for(int i = 0; i < 5 && !se_movio; i++){ // Es un loop que recorre las 4 opciones y si no entro en ninguna, recorre una vez más la primera para volver atras
            switch (mejores_movimientos[i])
            {
            case 'R':
                if(tablahash_buscar(robot->tabla_obstaculos, grid->nodos[x+1][y]) == NULL){ // No tengo guardado como obstaculo el lugar a moverme
                    if(grid_es_pos_valida(grid, x+1, y)){ // Efectivamente el lugar a moverme es valido
                        if(tablahash_buscar(robot->tabla_recorridos, grid->nodos[x+1][y]) == NULL){ //Nunca me movi a ese lugar
                            robot->posicion_actual = grid->nodos[x+1][y]; // Me muevo
                            tablahash_insertar(robot->tabla_recorridos, robot->posicion_actual);
                            se_movio = 1;
                        }else{ //Si me habia movido a ese lugar, moverse si agoté mis opciones
                            if(opciones == 0){ // Agoté mis opciones, volver un paso atras

                            }else{ // Tengo opciones a otras direcciones
                                opciones--;
                            }
                        }
                    }else{ // El lugar donde me quiero mover no es válido
                        tablahash_insertar(robot->tabla_obstaculos, grid->nodos[x+1][y]);
                        opciones--;
                    }
                }
                break;
            
            default:
                break;
            }
        }
    }

}
