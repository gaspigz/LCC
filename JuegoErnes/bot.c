#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <X11/Xlib.h>
#include <X11/extensions/XTest.h>
#include <stdbool.h>
#include <signal.h>

bool running = true;

// Función para manejar la señal de interrupción (Ctrl+C)
void handle_signal(int signal) {
    if (signal == SIGINT) {
        running = false;
        printf("\nDeteniendo el script...\n");
    }
}

void simulate_click(Display *display, int x, int y) {
    // Mueve el mouse a la posición (x, y)
    XTestFakeMotionEvent(display, -1, x, y, CurrentTime);
    XFlush(display);

    // Simula un clic del botón izquierdo
    XTestFakeButtonEvent(display, 1, True, CurrentTime);  // Presiona el botón
    XFlush(display);
    usleep(10000);  // Pequeña pausa para simular un clic real
    XTestFakeButtonEvent(display, 1, False, CurrentTime); // Suelta el botón
    XFlush(display);
}

int main() {
    // Abrir la conexión con el servidor X
    Display *display = XOpenDisplay(NULL);
    if (!display) {
        fprintf(stderr, "No se pudo abrir la conexión con el servidor X.\n");
        return 1;
    }

    // Configurar el manejo de señales (Ctrl+C)
    signal(SIGINT, handle_signal);

    // Obtener la ventana raíz
    Window root = DefaultRootWindow(display);

    // Variables para almacenar la posición del mouse
    int x = 0, y = 0;
    Window child;
    int win_x, win_y;
    unsigned int mask;

    printf("Abre Firefox y coloca el cursor en la posición deseada dentro de la ventana.\n");
    printf("Espera 5 segundos...\n");
    sleep(5);

    // Obtener la posición actual del mouse
    if (XQueryPointer(display, root, &root, &child, &x, &y, &win_x, &win_y, &mask)) {
        printf("Posición seleccionada: (%d, %d)\n", x, y);
    } else {
        fprintf(stderr, "No se pudo obtener la posición del mouse.\n");
        XCloseDisplay(display);
        return 1;
    }

    printf("Iniciando clics en (%d, %d)... Presiona Ctrl+C para detener.\n", x, y);

    // Bucle principal para hacer clics
    while (running) {
        // Enfocar la ventana de Firefox antes de hacer clic
        system("xdotool search --name 'Mozilla Firefox' windowactivate");

        // Hacer clic en la posición deseada
        simulate_click(display, x, y);
        usleep(500000);  // Espera 0.5 segundos entre clics
    }

    // Cerrar la conexión con el servidor X
    XCloseDisplay(display);
    printf("Finalizado.\n");

    return 0;
}