TWRP (ESTABLE) & OrangeFox en fase prueba (alfa) para Motorola Moto G 5G 2022 austin 
-------------------------------------------------
-------------------------------------------------
DESPUES DE NUMEROSAS PRUEBAS Y CORRECCIONES AQUI ESTA EN LA PRIMERA VERSION ESTABLE DE TWRP_AUSTIN.IMG
Motorola moto g 5G (2022) 

El SMARTAPHONE debió recibir la última actualización de soporte oficial de Motorola el software T1SAS33.73-40-0-12-20

ACLARAMOS QUE (boot y vendor) TIENEN QUE ESTAR EN LA ULTIMA VERSION QUE MOTOROLA LE DIÓ SOPORTE A ESTE DISPOSITIVO
T1SAS33.73-40-0-12-20   

    Prop: HAB_META -> 'austin_50'
    Prop: com.android.build.boot.fingerprint -> 'motorola/austin_g/austin:12/T1SAS33.73-40-0-12-20'
    Prop: com.android.build.boot.os_version -> '12'
    Prop: com.android.build.boot.security_patch -> '2025-04-01'
    Prop: com.android.build.vendor.fingerprint -> 'motorola/austin_g/austin:12/T1SAS33.73-40-0-12-20'
    Prop: com.android.build.vendor.os_version -> '12'
    Prop: com.android.build.vendor.security_patch -> '2025-04-01'

COMO REFERENCIA SI ACABAMOS DE DESBLOQUEAR EL BOOTLOADER NUESTRO SISTEMA ORIGINAL DEBERIA SER ESTE

    os_version -> '13'
    fingerprint -> 'motorola/austin_g/austin:13/T1SAS33M.73-40-0-12-20'
    security_patch -> '2025-04-01'

SI LO TIENES ASI ENTONCES TODO LO DEMAS ESTARA BIEN PORQUE MOTOROLA A ESTE DISPOSITIVO DEJO EL BOOT Y VENDOR EN ANDROID 12 Y SYSTEM, SYSTEM_EXT Y PRODUCT EN ANDROID 13
LO IMPOETANTE AQUI ESTE QUE TU MOTOROLA HAYA RECIBIDO LA ULTIMA UPDATE DEL SOPORTE QUE FUE ESTA (T1SAS33M.73-40-0-12-20) 


Instrucciones

1- desbloquear el bootloader

2- entrar en modo bootloader

     fastboot flash boot_a twrp_austin.img
     
     fastboot reboot recovery
  
Notas 

1- cuando entres a modo recovery en twrp espera de 8 a 10 segundos a que se active el driver tactil chipone_tddi en tú twrp

2- aclaración cuando se apaga la pantalla en modo twrp y la vuelves a encender el driver táctil demora unos 2 o 3 segundos en activarse

QUE NO FUNCIONA EL DESCENCRIPTADO DE DATA Y BACKUP DE DATA, TIENES FLASHEAR UN MODULO DE DESCENCRIPTADO 
