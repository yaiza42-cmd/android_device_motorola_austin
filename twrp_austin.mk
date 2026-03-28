# Heredar de la base de AOSP para TWRP
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Identificadores del dispositivo
PRODUCT_DEVICE := austin
PRODUCT_NAME := twrp_austin
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G 5G 2022
PRODUCT_MANUFACTURER := motorola

# Configuración de la compilación
PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Forzar arquitectura 64 bits
TARGET_IS_64_BIT := true
