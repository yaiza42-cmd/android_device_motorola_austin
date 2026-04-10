# 📱 Recovery Tree for Motorola Moto G 5G (2022) - "austin"

Estado actual de los proyectos:
* **TWRP:** Estable (Segunda versión estable lanzada tras extensas pruebas y correcciones).
* **OrangeFox:** Fase de pruebas (Alpha).

<p align="center">
  <img src="https://github.com/user-attachments/assets/79b58a3b-8abe-4bfc-8db7-bbecc804d306" width="30%" />
  <img src="https://github.com/user-attachments/assets/38672e5f-548a-473b-8b99-e77d4b529e4f" width="30%" />
</p>
---

## ⚠️ Requisitos Previos y Firmware Base

Para garantizar el correcto funcionamiento del recovery, el smartphone debe tener instalada la última actualización de soporte oficial de Motorola.

**Nota técnica importante:** En su última actualización, Motorola dejó las particiones `boot` y `vendor` en **Android 12**, mientras que actualizó `system`, `system_ext` y `product` a **Android 13**. Si acabas de desbloquear el bootloader y estás en la última stock ROM, este es el entorno compatible.

### Propiedades Esperadas (Stock ROM)
Asegúrate de que tu sistema coincida con estas huellas (fingerprints) base antes de flashear:

# Huella General del Sistema
    os_version -> '13'
    security_patch -> '2025-04-01'
    fingerprint -> 'motorola/austin_g/austin:13/T1SAS33M.73-40-0-12-20'

# Huellas de Boot y Vendor (Mantenidas en Android 12)
    Prop: HAB_META -> 'austin_50'
    Prop: com.android.build.boot.fingerprint -> 'motorola/austin_g/austin:12/T1SAS33.73-40-0-12-20'
    Prop: com.android.build.vendor.fingerprint -> 'motorola/austin_g/austin:12/T1SAS33.73-40-0-12-20'

----------------------------------------------------
🛠️ Instrucciones de Instalación
Desbloquear el Bootloader (sigue las instrucciones oficiales de Motorola).

Reiniciar el dispositivo en modo Fastboot / Bootloader.

Abrir una terminal en tu PC y ejecutar los siguientes comandos para flashear la imagen en el slot A:


    fastboot flash boot_a twrp_austin.img
    fastboot reboot recovery


📝 Notas de Rendimiento y Bugs Conocidos
1. Comportamiento del Panel Táctil (chipone_tddi)

       Primer arranque: Al iniciar en modo recovery, el driver táctil tarda un momento en inicializarse. Espera de 8 a 10 segundos antes de intentar tocar la pantalla.

       Suspensión de pantalla: Si la pantalla de TWRP se apaga por inactividad, al volver a encenderla el driver táctil demorará entre 2 y 3 segundos en volver a responder.

2. Cifrado de Datos (FBE)
Estado actual: El descifrado nativo de la partición /data NO funciona por el momento.

       Consecuencia: No es posible leer los archivos internos ni realizar un backup de la partición Data directamente.

       Workaround (Solución temporal): Es necesario flashear un módulo/zip para desactivar el cifrado forzado (Disable Force Encryption) o formatear Data si necesitas realizar modificaciones internas.
