#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>

char seek_read(int fd, off_t pos){ // FD, a donde queremos movernos, 

    char resC;

    lseek(fd, pos, SEEK_SET);

    int cuantos_bytes_leyo = read(fd, &resC, 1); // El tercer arg es cuanto quiero leer
    // read lee la posicion y luego mueve el cabezal al siguiente. El cabezal es compartido
    // asi que si el hijo movio el cabezal, el padre va a leer la posicion pos + 1, no pos.
    // El cabezal esta asociado al archivo no al proceso.
    // seek es una funcion atomica porque no se pueden generar cambios de contexto durante su llamada.
    // Problema de eclusion mutua (Mutex)
    // seek_write y seek_read son secciones de codigo que acceden a la misma porcion de memoria y la pretenden leer o escribir.
    // Si yo entro -> El otro sale. 
    // la seccion critica es esa seccion de codigo que esta modificando el archivo, en este caso las funciones hechas.
    // Es la porcion de codigo que yo quiero proteger, que se ejecute sin cambios de contexto.
    return resC;
}

void seek_write(int fd, off_t pos, const char c){ // FD, a donde queremos movernos, lo que quiero escribir . Const dice que no va a ser modificada.

    lseek(fd, pos, SEEK_SET);

    int cuantos_bytes_leyo = write(fd, &c, 1); // El tercer arg es cuanto quiero escribir

}

int main(){

    int fd = open("./file", O_RDWR);

    pid_t pid;

    pid = fork();

    if(pid == 0){
        char c = seek_read(fd, 13);
        printf("Child leyó: %c\n", c);
        seek_write(fd, 13, 'a');
        printf("Child escribió: a\n");
    }else{
        char c = seek_read(fd, 13);
        printf("Parent leyó: %c\n", c);
        seek_write(fd, 13, 'b');
        printf("Parent escribió: b\n");


    }

    close(fd);

    return 0;
}