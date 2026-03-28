# Heredar de la configuración genérica de TWRP
$(call inherit-product, vendor/twrp/config/common.mk)

# Heredar del árbol del dispositivo (¡Esta ruta es la clave!)
$(call inherit-product, device/motorola/austin/device.mk)

PRODUCT_DEVICE := austin
PRODUCT_NAME := twrp_austin
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G 5G (2022)
PRODUCT_MANUFACTURER := motorola

# Configuración de la compilación
PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Forzar arquitectura 64 bits
TARGET_IS_64_BIT := true
