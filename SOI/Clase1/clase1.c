#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>


int main(){


    // Fork example

    printf("Proceso ppal: %d\n",getpid());
    int status;
    int i = 1;
    pid_t pid = fork(); // No determinista
    // (*1)
    printf("\n%d\n", i); // Cómo sabe el hijo de este i si fue creado antes que el fork? 

    // Padre e hijo no comparten memoria, lo hacen mediante un objeto Shared-memory
    // shm_open

    // Todo proceso tiene una tabla de File Descriptors (File Table). Un FD es un numero que representa
    // algo abierto (puede ser un archivo, un dispositivo, etc).
    // La funcion open devuelve un int que es el FD, podes acceder a el con funciones como 
    // write, read, etc.
    // El FD 0 es stdin, el 1 stdout y el 2 stderr. Todo proceso puede escribir con el FD 0, puede mostrar con 1
    // o puede transmitir errores con 2.
    


    if(pid == 0){
        printf("Estoy en el proceso hijo de PID: %d\n", getpid());
    }else{
        printf("Estoy en el proceso padre de PID: %d\n", getpid());
        printf("ID del hijo desde el padre: %d\n", pid);
        wait(&status); // El padre espera al hijo hasta que termine el proceso. EL hijo spawnea en (*1)
        // Exec reemplaza la imagen de programa de un proceso actual por una nueva osea 
        // termina la ejecución del programa y comienza la de otro sin cambiar la identificación del proceso

    }

    // End Fork example

    // Pipes


    return 0;
}

