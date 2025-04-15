#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <assert.h>
#include <stdio.h>

int x = 0, y = 0, a = 0, b = 0; // Variables globales visibles por ambos threads.

void * foo(void *arg) {
    printf("[TH0] Running...\n");
    printf("[TH0] x: %d y: %d a: %d b: %d \n",x,y,a,b);
    x = 1;
    a = y;
    printf("[TH0] x: %d y: %d a: %d b: %d \n",x,y,a,b);
    return NULL; 
}

void * bar(void *arg) { 
    printf("[TH1] Running...\n");
    printf("[TH1] x: %d y: %d a: %d b: %d \n",x,y,a,b);
    y = 1; 
    b = x;
    printf("[TH1] x: %d y: %d a: %d b: %d \n",x,y,a,b);

    return NULL;
}

int main() {
    pthread_t t0, t1; // Crea dos hilos

    printf("[MAIN] Running...\n");


    pthread_create(&t0, NULL, foo, NULL); // El primero a foo

    pthread_create(&t1, NULL, bar, NULL); // El segundo a bar

    pthread_join(t0, NULL); // Que el main espere el t0

    pthread_join(t1, NULL); // Que el main espere t1
    
    assert (a || b);
    return 0;
}

// 