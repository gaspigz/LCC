#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

pthread_mutex_t mutex_resource_1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex_resource_2 = PTHREAD_MUTEX_INITIALIZER;

void* thread1(void* arg){
    //lock RC1
    pthread_mutex_lock(&mutex_resource_1); // Toma el primer lock
    printf("Thread A tomo el mutex mutex_resource1\n");
    sleep(1); // Quiero que el otro thread tome el 2. No quiero que llegue uno primero y me tome los dos juntos
    printf("Thread A esperando mutex_resource2\n");
    pthread_mutex_lock(&mutex_resource_2); // Esto ya esta tomado y no se va a liberar hasta que el thread 2 lockee el lock 1 pero no va a pasar hasta que el thread 1 lockee el lock 2 ... infinito bucle.
    /*Lo puedo resolver al deadlock asi:
    
    if(pthread_mutex_trylock(&mutex_resource_2) == FAIL){
        pthread_mutex_unlock(&mutex_resource_1);
    }

    */
    printf("Region critica thread 1\n");
    pthread_mutex_unlock(&mutex_resource_2);
    pthread_mutex_unlock(&mutex_resource_1);

}

void* thread2(void* arg){
    //lock RC2
    pthread_mutex_lock(&mutex_resource_2);
    printf("Thread B tomo el mutex mutex_resource2\n");
    sleep(1);
    printf("Thread B esperando mutex_resource1\n");
    pthread_mutex_lock(&mutex_resource_1);
    printf("Region critica thread 2\n");
    pthread_mutex_unlock(&mutex_resource_2);
    pthread_mutex_unlock(&mutex_resource_1);
}

int main(){
    pthread_t m1, m2;

    printf("[MAIN] Creating threads...\n");

    pthread_create(&m1, NULL, thread1, NULL);
    pthread_create(&m2, NULL, thread2, NULL);

    printf("[MAIN] Threads joining...\n");

    pthread_join(m1, NULL);
    pthread_join(m2, NULL);

    pthread_mutex_destroy(&mutex_resource_1);
    pthread_mutex_destroy(&mutex_resource_2);

    return 0;
}