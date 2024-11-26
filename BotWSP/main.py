from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.service import Service
import time
import pygame

# Iniciar pygame para sonido
pygame.mixer.init()
# Cargar un archivo de sonido fuerte
pygame.mixer.music.load("alarm.mp3")  # Usa el sonido que desees, debe ser molesto :)

# Ruta a tu geckodriver
geckodriver_path = './geckodriver'

# Configurar el driver de Firefox
service = Service(executable_path=geckodriver_path)
driver = webdriver.Firefox(service=service)

# Abrir WhatsApp Web
driver.get('https://web.whatsapp.com')
print("Escanea el código QR para iniciar sesión en WhatsApp Web.")
input("Presiona Enter una vez que hayas iniciado sesión...")

# Función para revisar mensajes y hacer sonar el ruido si corresponde
def revisar_mensajes():
    while True:
        try:
            # Buscar el grupo de alertas (ajustar el nombre si es diferente)
            grupo = driver.find_element(By.XPATH, "//span[@title='ALARMAS TURNO ROSARIO']")
            grupo.click()
            
            # Buscar los últimos mensajes del grupo
            mensajes = driver.find_elements(By.XPATH, "//span[@class='_ao3e selectable-text copyable-text']")
            print(mensajes);
            # Ver si el último mensaje contiene la palabra 'turno'
            if mensajes in mensajes[-1].text.lower():
                print("Mensaje de 'turno' detectado!")
                # Sonar un ruido fuerte y molesto
                pygame.mixer.music.play()
                time.sleep(10)  # Mantén el sonido por 10 segundos
                pygame.mixer.music.stop()
        except Exception as e:
            print(f"Error: {e}")
        
        # Espera un minuto antes de revisar de nuevo
        time.sleep(3)

# Ejecutar el script para revisar los mensajes periódicamente
revisar_mensajes()
