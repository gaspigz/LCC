#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define NUM_VISITANTES 4000000

int visitantes = 0;
pthread_mutex_t mutex_visitantes = PTHREAD_MUTEX_INITIALIZER;


void *molinete1(void* v){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){
        // lock
        pthread_mutex_lock(&mutex_visitantes);
        // region critica
        visitantes++; // Esta funcion no es atomica
        printf("[MOL1] Visitantes: %d\n", visitantes);

        // unlock
        pthread_mutex_unlock(&mutex_visitantes);

    }
    return NULL;
}

// Si pongo el lock y el unlock afuera del for, la RC seria todo el for. La estoy protegiendo bien si, pero lo estoy secuencializando.

void *molinete2(void* v){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){
        // lock
        pthread_mutex_lock(&mutex_visitantes);
        // region critica
        visitantes++; // Esta funcion no es atomica
        printf("[MOL2] Visitantes: %d\n", visitantes);

        // unlock
        pthread_mutex_unlock(&mutex_visitantes);

    }
    return NULL;
}



int main(){

    pthread_t m1, m2;
    printf("[MAIN] Creating threads...\n");

    pthread_create(&m1, NULL, molinete1, NULL);
    pthread_create(&m2, NULL, molinete2, NULL);

    printf("[MAIN] Threads joining...\n");

    pthread_join(m1, NULL);
    pthread_join(m2, NULL);

    pthread_mutex_destroy(&mutex_visitantes);

    printf("[MAIN] Total visitantes: %d\n", visitantes);

    return 0;
}