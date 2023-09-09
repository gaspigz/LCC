#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

int sumadiez(int n){
    return n+10;
}

int main(){
    int mat[10][10];
    char c[10];

    scanf("%d",&mat[0][0]);
    scanf("%s",c);

    printf("%d %s\n",mat[0][0], c);

    assert(sumadiez(5) == 16);

    return 0;
}