#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include "functions.h"

int string_len(char *str){
    int longitud=0;
    for(;str[longitud]!='\0';longitud++);
    return longitud;
}

void string_reverse(char* str){
    int i = 0;
    int fin = string_len(str)-1;
    char *reversed = malloc(sizeof(char)*(fin+1));

    for(;fin>=0;fin--){
        reversed[i] = str[fin];
        i++;
    }
    fin = 0;
    reversed[i]='\0';
    strcpy(str, reversed);
    free(reversed);
}

int string_concat(char *str1, char *str2, int max){
    int len_str1 = string_len(str1);
    int len_str2 = string_len(str2);
    int i = 0;
    for(; max>i && i<len_str2;i++){
        str1[len_str1+i] = str2[i];
    }
    str1[len_str1+i] = '\0';
    return i;
}

int string_compare(char* str1, char* str2){
    int len_str1 = string_len(str1);
    int len_str2 = string_len(str2);
    int min = len_str1 < len_str2 ? len_str1 : len_str2;
    for(int i=0; i<min-1; i++){
        if(toupper(str1[i])<toupper(str2[i])){
            return -1;
        }
        if(toupper(str1[i])>toupper(str2[i])){
            return 1;
        }
    }
    if(str1[min] == '\0' && str2[min] == '\0') return 0;
    return (str1[min] == '\0') ? -1 : 1;
}

int string_subcadena(char* str1, char* str2){
    int len_str1 = string_len(str1);
    int len_str2 = string_len(str2);
    int pos_indice = 0;
    int bandera = 0;
    if(len_str2 > len_str1) return -1;
    if(len_str1 == len_str2 && string_compare(str1, str2) == 0) return pos_indice;
    if(len_str1 == len_str2 && string_compare(str1, str2) != 0) return -1;
    for(int i = 0; i<len_str1-1 && bandera == 0; i++){
        pos_indice = i;
        if(str1[i] == str2[0]){
            int j = i;
            for(int k = 0; str1[j] == str2[k] ; k++){
                j++;
                if(k == len_str2-1) bandera = 1;
                //printf("\nBANDERA: %d k: %d len_str2-1: %d\n",bandera, k, len_str2-1);
            }
        }
    }
    return bandera ? pos_indice+1 : -1;


}

void string_unir(char* arregloStrings[], int n, char* sep, char* res){
    strcpy(res, "");
    for(int i = 0; i<n; i++){
        string_concat(res, arregloStrings[i], string_len(arregloStrings[i]));
        if(i != n-1) string_concat(res, sep, string_len(sep));
    }

}