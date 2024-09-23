#include <stdio.h>
#include <stdlib.h>
#define LARGO_CONSTANTE 16

int check(int tablero[][LARGO_CONSTANTE],int largo, int fila_check, int columna_check){
    if(tablero[fila_check][columna_check] == 2) return 0;
    for(int i = 0; i<largo; i++){ //Chequeemos columna
        if(i != fila_check && tablero[i][columna_check] == 1) return 0;
    }
    for(int i = 0; i<largo; i++){ //Chequeemos fila
        if(i != columna_check && tablero[fila_check][i] == 1) return 0;
    }
     // Check diagonal top-left to bottom-right
    for(int i = 0; i < largo; i++) {
        int j = columna_check - fila_check + i;
        if(j >= 0 && j < largo && i != fila_check && tablero[i][j] == 1) return 0;
    }

    // Check diagonal top-right to bottom-left
    for(int i = 0; i < largo; i++) {
        int j = columna_check + fila_check - i;
        if(j >= 0 && j < largo && i != fila_check && tablero[i][j] == 1) return 0;
    }

    return 1;
}

int colocarNReinas(int cantidad, int tablero[][LARGO_CONSTANTE], int largo){

    if(cantidad == 0) return 1;
    for(int i = 0; i<largo; i++){
        for(int j = 0; j<largo; j++){
            if(tablero[i][j] == 0 && check(tablero, largo, i, j) == 1) {
                tablero[i][j] = 1;
                if(colocarNReinas(cantidad - 1, tablero, largo)){
                    return 1;
                }
                tablero[i][j] = 0;
            }
        }

    }

    return 0;




}

int main(){
    int tablero[LARGO_CONSTANTE][LARGO_CONSTANTE]; //[[fila1], [fila2], ..., [fila9]]

    for(int i=0; i<LARGO_CONSTANTE; i++){
        for(int j=0; j<LARGO_CONSTANTE; j++){
            tablero[i][j] = 0;
        }
    }

    printf("Se pudo? %d\n", colocarNReinas(15, tablero, LARGO_CONSTANTE));
    for(int i=0; i<LARGO_CONSTANTE; i++){
        for(int j=0; j<LARGO_CONSTANTE; j++){
            printf("%d ",tablero[i][j]);
        }
        printf("\n");
    }

    return 0;
}