#include "adicional.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *char_copy(char *data){
    char *copia = malloc(sizeof(char));
    *copia = *data;
    return copia;
}

void imprimir_char(char *c){
    printf("%c",*c);
}

int char_comp(char *c1, char *c2){
    return strcmp(c1, c2) == 0;
}

int main(){

    GList lista = glist_crear();
    lista = agregar_final(lista, (FuncionCopia) char_copy, "a");
    lista = agregar_final(lista, (FuncionCopia) char_copy, "l");
    lista = agregar_final(lista, (FuncionCopia) char_copy, "l");
    lista = agregar_final(lista, (FuncionCopia) char_copy, "a");

    glist_recorrer(lista, (FuncionVisitante) imprimir_char);
    //lista = glist_reverse(lista, (FuncionCopia) char_copy);
    //glist_recorrer(lista, (FuncionVisitante) imprimir_char);
    
    printf("%d", glist_espalindrome(lista, (FuncionComparadora) char_comp, (FuncionCopia) char_copy));


    return 0;
}