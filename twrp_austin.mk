# Heredar de la base de AOSP para TWRP
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Identificadores del dispositivo (Muy importantes para el constructor)
PRODUCT_DEVICE := austin
PRODUCT_NAME := twrp_austin
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G 5G 2022
PRODUCT_MANUFACTURER := motorola

# Configuración de la compilación
PRODUCT_GMS_CLIENTID_BASE := android-motorola
