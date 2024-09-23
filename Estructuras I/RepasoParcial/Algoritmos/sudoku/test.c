#include <stdlib.h>
#include <stdio.h>

int check(int*** tablero, int i, int j){
    int bandera = 1;
    //Chequear si no hay un numero igual a tablero[i][j] en la fila i:
    for(int k = 0; k<9; k++){
        if(k!=j){
            if(tablero[i][k] == tablero[i][j]) bandera = 0;
        }
    }
    //Chequear si no hay un numero igual a tablero[i][j] en la columna j:
    for(int k = 0; k<9; k++){
        if(k!=i){
            if(tablero[k][j] == tablero[i][j]) bandera = 0;
        }
    }
    
}

int rellenarSudoku(int*** tablero, int* opciones){

    int estaVacio = 1;

    for(int i=0; i<9; i++){
        for(int j=0; j<9; j++){
            if(tablero[i][j] == -1) estaVacio = 0;
        }
        if(estaVacio == 0) break;
    }
    if(estaVacio == 1) return 1;

    for(int i = 0; i<9; i++){
        if(check(tablero, ))
    }


}

int main(){
    
    int*** tablero = malloc(sizeof(int**) * 9); //[[fila1], [fila2], ..., [fila9]]
    int opciones[9] = {1 , 2, 3, 4, 5, 6, 7, 8, 9};
    for(int i=0; i<9; i++){
        for(int j=0; j<9; j++){
            tablero[i][j] = -1;
        }
    }
    rellenarSudoku(tablero, opciones);


    return 0;
}