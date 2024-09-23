#include <stdio.h>
#include <stdlib.h>
#define LARGO_CONSTANTE 30

//Determinar de cuántas formas diferentes se puede llegar a la cima 
//de una escalera con N escalones, donde se puede subir 1 o 2 escalones a la vez.

 int manerasDistintasDeSubirN(int N, int manerasDeSubir[]){
    if(N == 0){
        manerasDeSubir[N] = 0;
        return 0;
    }
    if(N == 1) {
        manerasDeSubir[N] = 1;
        return 1;
    }
    if(N == 2) {
        manerasDeSubir[N] = 2;
        return 2;
    }
    if(manerasDeSubir[N] != -1) return manerasDeSubir[N];

    return manerasDeSubir[N] = manerasDistintasDeSubirN(N-1, manerasDeSubir) + manerasDistintasDeSubirN(N-2, manerasDeSubir);
 }

int main(){
    int manerasDeSubir[LARGO_CONSTANTE+1];
    for(int i=0; i<= LARGO_CONSTANTE; i++){
        manerasDeSubir[i] = -1;
    }
    printf("Hay %d maneras", manerasDistintasDeSubirN(LARGO_CONSTANTE, manerasDeSubir));


    return 0;
}