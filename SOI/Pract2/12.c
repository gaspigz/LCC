#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

pthread_mutex_t a = PTHREAD_MUTEX_INITIALIZER; // Creo un mutex a

void *foo(void *_arg)
{
    pthread_mutex_lock(&a); // Lockeo
    // RC protegida por a
    printf("Foo!\n"); 
    sleep(1);
    // END RC
    pthread_mutex_unlock(&a); // Unlock
    return NULL;
}

int main()
{
    pthread_t th; // Creo un hilo th
    pthread_create(&th, NULL, foo, NULL); // Le asigno foo a th
    // sleep(1); // Se ejecuta foo hasta su sleep, luego a se copia en b LOCKEADO
    pthread_mutex_t b = a; // Si tengo el sleep anterior b sera una copia de a, que es n mutex lockeado. 
    // Para que funcione tengo que poner un unlock a b. 
    pthread_mutex_lock(&b); // El main lockea b. No hay nadie que lo desbloquee. 
    // RC protegida por b
    printf("Bar!\n");
    sleep(1);
    // END RC
    pthread_mutex_unlock(&b); // Unlock b

    pthread_join(th, NULL); // Espero th
    return 0;
}
