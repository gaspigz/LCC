#include "garray.h"
#include <stdio.h>
#include <stdlib.h>

GArray merge(GArray array, int inicio, int mitad, int final, FuncionCopiadora copy, FuncionComparadora comp){

    int i, j, k;
    int largo1 = mitad - inicio + 1;
    int largo2 = final - mitad;
    void** L = malloc(sizeof(void*) * largo1);
    void** R = malloc(sizeof(void*) * largo2);

    for(i = 0; i < largo1; i++) L[i] = copy(array->datos[inicio + i]);
    for(j = 0; j < largo2; j++) R[j] = copy(array->datos[mitad + 1 + j]);

    i = 0;
    j = 0;
    k = inicio;

    while(i < largo1 && j < largo2){
        if(comp(L[i], R[j])<=0){
            array->datos[k] = copy(L[i]);
            i++;
        }else{
            array->datos[k] = copy(R[j]);
            j++;
        }
        k++;
    }

    while(i < largo1){
        array->datos[k] = copy(L[i]);
        i++;
        k++;
    }

    while(j < largo2){
        array->datos[k] = copy(R[j]);
        j++;
        k++;
    }

    return array;


}

GArray merge_sort_aux(GArray array, FuncionComparadora comp, int inicio, int final, FuncionCopiadora copy){
    if(inicio < final){
        int mitad = inicio + (final - inicio) / 2;
        merge_sort_aux(array, comp, inicio, mitad, copy);
        merge_sort_aux(array, comp, mitad + 1, final, copy);

        merge(array, inicio, mitad, final, copy, comp);
    }
    return array;
}


GArray merge_sort(GArray array, int largo, FuncionComparadora comp, FuncionCopiadora copy){
    array = merge_sort_aux(array, comp, 0, largo - 1, copy);
    return array;

}