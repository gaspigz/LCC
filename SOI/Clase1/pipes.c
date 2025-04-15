#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>


int main(){
    // Pipes
    // De un lado leo y del otro escribo.
    // 0 -> lectura
    // 1 -> escritura
    // Unidireccionales, debo crear dos si quiero que el pipe del hijo haga ambas cosas.
    // Se debe cerrar la boca de la tubería que no estoy usando.
    // Con las señales no nos podemos mandar datos pero con los pipes si.
    // Hay una jerarquia Parent -> Child (LOS PROCESOS SE DEBE NCONOCER, LIMITACION. DEBEN HABER VENIDO DE UN FORK)
    // Tengo que declarar el pipe antes del fork. Todas estas funciones son llamadas a sistema.
    // Debo declararla antes para que tanto el padre como el hijo tengan acceso a esa memoria.
    // Le pasas un array de long. 2, p[0] es la boca de lectura y p[1] donde escribo.
    // Ambos procesos tienen accesos a esa boca. p[0] y p[1] son file descriptors. 
    // write, read, close, open.
    // El que escribe cierra la lectura y visceversa. close(p[0]) por ejemplo.
    // El read te hace ESPERAR a que alguien te escriba, es bloqueante.


    return 0;
}

