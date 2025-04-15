#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <assert.h>
#include <stdio.h>

volatile int x = 0;

volatile int y = 0;

void * wr(void *arg) { 
    printf("[TH0] Running..\n");
    x = 123; 
    printf("[TH0] X assigned..\n");
    y = 1;
    printf("[TH0] Y assigned..\n");

}

void * rd(void *arg) {
    printf("[TH1] Running..\n");

    while (!y)
    printf("[TH1] Dentro while..\n");
    
    assert(x == 123); // Podria fallar si y = 1 se hace primero antes que x = 123 y que haya un cambio a este proceso rd.
}

int main() {
    pthread_t t0, t1; // Crea dos hilos

    printf("[MAIN] Running...\n");


    pthread_create(&t0, NULL, wr, NULL); // El primero a foo

    pthread_create(&t1, NULL, rd, NULL); // El segundo a bar

    pthread_join(t0, NULL); // Que el main espere el t0

    pthread_join(t1, NULL); // Que el main espere t1
    
    return 0;
}