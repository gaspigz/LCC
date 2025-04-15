// Cliente envia un mensaje al servidor y espera la respuesta del mismo y la muestra en pantalla
// Servidor espera que alguno cliente envie un mensaje y se lo responda
// Necesitamos dos sockets, uno para el cliente y otro para el servidor. Para ambos tenemos que hacer bind ya que trabajamos con datagramas.
#include <sys/socket.h>
#include <sys/un.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAXMSG 1024

int main(){
    int socket_srv = socket(AF_UNIX, SOCK_DGRAM, 0); // AF_UNIX dice que es de dominio local y SOCK_DGRAM que el tipo es datagrama

    int cli_size;
    char buff[MAXMSG + 1];
    struct sockaddr_un srv_name, cli_name;
    srv_name.sun_family = AF_UNIX;
    strcpy(srv_name.sun_path, "SRV_NAME"); // Va a ser un archivo

    unlink(srv_name.sun_path);

    bind(socket_srv, (struct sockaddr*) &srv_name, sizeof(srv_name));

    int bytes_recibi = recvfrom(socket_srv, buff, MAXMSG, 0, (struct sockaddr*) &cli_name, &cli_size);

    buff[bytes_recibi] = '\0';

    printf("[SRV] Received: %s\n", buff);
    sleep(2);
    sendto(socket_srv, buff, bytes_recibi, 0, (struct sockaddr*) &cli_name, cli_size);

    printf("[SRV] Sent: %s\n", buff);

    close(socket_srv);
    remove("./SRV_NAME");

    return 0;

}