import os
import time
from pynput import mouse
import pyautogui

running = True

def on_click(x, y, button, pressed):
    global running
    if button == mouse.Button.right and pressed:
        print("\nClic derecho detectado. Deteniendo el script.")
        running = False

listener = mouse.Listener(on_click=on_click)
listener.start()

print("Mueve el cursor a la posición deseada y espera 5 segundos...")
time.sleep(5)

# Obtener la posición actual del mouse
x, y = pyautogui.position()

print(f"Posición seleccionada: ({x}, {y})")

print(f"Iniciando clicks en ({x}, {y})... Haz clic derecho para detener.")

try:
    while running:
        # Mueve el mouse y hace clic en la posición absoluta de la pantalla
        pyautogui.click(x, y)
        time.sleep(0.5)
except KeyboardInterrupt:
    print("\nScript interrumpido por el usuario.")
finally:
    listener.stop()
    print("Finalizado.")