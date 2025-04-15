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

   // man 7 signal y man 2 signal
   // signal(Señal, handler)
   /*
   Cuando ocurra esa señal se activa el handler.
   Con raise puedo levantar una señal, o se puede generar validamente por ejemplo con una division por cero.
   raise(SIGKILL).
   kill es un send, puedo hacer kill(SIGSTOP, PID)
   Señales:
   SIGKILL
   SIGSTOP ESTAS DOS NO PUEDEN SER HANDLEADAS.
   man 7 signal al final
   */
    


    if(pid == 0){
        printf("Estoy en el proceso hijo de PID: %d\n", getpid());
    }else{
        printf("Estoy en el proceso padre de PID: %d\n", getpid());
        printf("ID del hijo desde el padre: %d\n", pid);
        wait(&status); // El padre espera al hijo hasta que termine el proceso. EL hijo spawnea en (*1)
        // Exec reemplaza la imagen de programa de un proceso actual por una nueva osea 
        // termina la ejecución del programa y comienza la de otro sin cambiar la identificación del proceso

    }



    return 0;
}

