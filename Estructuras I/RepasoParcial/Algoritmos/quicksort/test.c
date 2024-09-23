#include <stdlib.h>
#include <stdio.h>
#include "quick.h"

int main(){

    int numeros[6] = { 4, 5, 3, 7, 2, 1 };
    printf("ARR ORIGINAL: ");
    for(int i = 0; i<6; i++){
        printf("%d ", numeros[i]);
    }
    
    printf("\nARR NUEVO: ");
    quick_sort(numeros, 6);
    for(int i = 0; i<6; i++){
        printf("%d ", numeros[i]);
    }

}