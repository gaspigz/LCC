// Cliente envia un mensaje al servidor y espera la respuesta del mismo y la muestra en pantalla
// Servidor espera que alguno cliente envie un mensaje y se lo responda
// Necesitamos dos sockets, uno para el cliente y otro para el servidor. Para ambos tenemos que hacer bind ya que trabajamos con datagramas.
#include <sys/socket.h>
#include <sys/un.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAXMSG 1024

#define MSG "HOLA MUNDO! Como Va"

int main(){
    int socket_cli = socket(AF_UNIX, SOCK_DGRAM, 0); // AF_UNIX dice que es de dominio local y SOCK_DGRAM que el tipo es datagrama

    socklen_t cli_size;
    char buff[MAXMSG + 1];

    strcpy(buff,MSG);

    struct sockaddr_un srv_name, cli_name;
    srv_name.sun_family = AF_UNIX;
    strcpy(srv_name.sun_path, "SRV_NAME"); // Va a ser un archivo. El cliente tiene que saber a donde manda
    socklen_t srv_size = sizeof(srv_name);

    cli_name.sun_family = AF_UNIX;
    strcpy(cli_name.sun_path, "CLI_NAME"); // Va a ser un archivo

    unlink(cli_name.sun_path); // Si esta bajo uso lo remueve, con bind lo pongo de nuevo.

    bind(socket_cli, (struct sockaddr*) &cli_name, sizeof(cli_name));

    sendto(socket_cli, buff, strlen(buff) * sizeof(char), 0, (struct sockaddr*) &srv_name, srv_size);

    printf("[CLI] Send: %s\n", buff);

    int bytes_recibi = recvfrom(socket_cli, buff, MAXMSG, 0, (struct sockaddr*) &srv_name, &srv_size);

    printf("[CLI] Received: %s\n", buff);

    close(socket_cli);
    remove("./CLI_NAME");
    
    return 0;

}