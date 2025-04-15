#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
int array[10] = {1,1,1,1,1,1,1,1,1,1};
int pos_actual = 0;
int total = 0;

void *sumaArray(void* args){
    
    while(pos_actual < 10){
        pthread_mutex_lock(&mutex);
        total = total + array[pos_actual];
        pos_actual++;
        pthread_mutex_unlock(&mutex);
    }

}


int main(){

    printf("[MAIN] Creating threads...\n");
    pthread_t t1, t2;
    pthread_create(&t1, NULL, sumaArray, NULL);
    pthread_create(&t2, NULL, sumaArray, NULL);

    printf("[MAIN] Joining threads...\n");
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("[MAIN] Total: %d\n", total);


    return 0;
}