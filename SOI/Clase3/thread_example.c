#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

void *funcion_del_thread(void* argumento){
    printf("[THREAD] Tome como argumento: %d\n", * (int*)argumento);

    pthread_exit(0); 
    return NULL;
}

int main(){

    pthread_t thread_id; // Es un entero compa
    int arg_funcion = 2;

    printf("[MAIN] Corriendo main... \n");

    printf("[MAIN] Creando thread... \n");

    pthread_create(&thread_id, NULL, funcion_del_thread, &arg_funcion); // Lo corre automaticamente.

    // sleep(1); // Si no pongo el sleep es muy probable que muera primero el thread padre y con ello todos los subprocesos, no hay zombie y todo eso. 

    int *ptr;
    pthread_join(thread_id, (void **) &ptr); // De esta forma el thread main espera al thread de id thread_id.
    // Tambien puedo haber puesto pthread_join(thread_id, NULL);
    printf("[MAIN] El thread devolvió: %d\n", (int) ptr);

    printf("[MAIN] Cerrando main... \n");

    return 0;
}