#include <stdlib.h>
#include <stdio.h>
int main(){

    int  tablero [16][16] ,  numero , filas = 0, pos [16][2];

    FILE *entrada;
    entrada = fopen("archivo.txt", "r");
    if(entrada  == NULL){
        printf("El archivo no existe\n");
        return  1;
    }
    fscanf(entrada ," %d",&numero );
    while(!feof(entrada) && filas  < numero ){
        for(int i = 0; i < 2; i++){
            fscanf(entrada ," %d",&pos[filas][i]);
        }
        filas ++;
    }
    rewind(entrada);
    if (numero  < 1 ||  numero  > 16){
        printf("Error\n");
        return  0;
    }

    return 0;
}
