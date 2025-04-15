#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

#define NUM_VISITANTES 40000000

static inline void incl(int *p) {
    asm("incl %0" : "+m"(*p) : : "memory");
}

int turno = 0; // Turno de thread a entrar
int flags[2] = {0, 0}; // Intenciones de entrar a RC

int visitantes = 0;
pthread_mutex_t mutex_visitantes = PTHREAD_MUTEX_INITIALIZER;

void* molinete1(void *var){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){
        // LOCK
        flags[0] = 1; // Declaro que tengo intenciones de entrar
        turno = 2; // Cedo el turno
        asm("mfence");
        while(turno == 2 && flags[1] == 1){;} // Espero mientras no sea mi turno y el otro tenga intencion de entrar

        // RC
        visitantes++;
        // printf("[TH2] Visitantes: %d\n", visitantes);

        // UNLOCK
        flags[0] = 0;

    }

}

void* molinete2(void *var){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){
        // LOCK
        flags[1] = 1; // Declaro que tengo intenciones de entrar
        turno = 1; // Cedo el turno
        asm("mfence");
        while(turno == 1 && flags[0] == 1){;} // Espero mientras no sea mi turno y el otro tenga intencion de entrar

        // RC
        visitantes++;
        // printf("[TH1] Visitantes: %d\n", visitantes);

        // UNLOCK
        flags[1] = 0;
    }

}

void* molinete1_lock(void *var){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){

        pthread_mutex_lock(&mutex_visitantes);

        visitantes++;
        // printf("[TH1] Visitantes: %d\n", visitantes);

        pthread_mutex_unlock(&mutex_visitantes);
        

    }

}

void* molinete2_lock(void *var){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){
        
        pthread_mutex_lock(&mutex_visitantes);

        visitantes++;

        // printf("[TH2] Visitantes: %d\n", visitantes);

        pthread_mutex_unlock(&mutex_visitantes);
    }

}

int main(){

    printf("[MAIN] Creating threads...\n");

    pthread_t t1, t2;
    pthread_create(&t1, NULL, molinete1_lock, NULL);
    pthread_create(&t2, NULL, molinete2_lock, NULL);

    printf("[MAIN] Threads joining...\n");

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("[MAIN] Visitantes: %d\n",visitantes);

    return 0;
}