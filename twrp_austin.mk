# Heredar de la configuración base de OrangeFox (Rama 12.1)
$(call inherit-product, vendor/otter/config/common.mk)

# Identidad del dispositivo
PRODUCT_DEVICE := austin
PRODUCT_NAME := twrp_austin
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G 5G (2022)
PRODUCT_MANUFACTURER := motorola

# Configuración Específica de OrangeFox
FOX_VERSION := R11.1
FOX_BUILD_TYPE := Stable
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := true
ALLOW_MISSING_DEPENDENCIES := true

# Pantalla y Apariencia
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := es

# Forzar instalación en la partición boot (Dispositivos A/B)
FOX_RECOVERY_INSTALL_PARTITION := /dev/block/by-name/boot
FOX_RECOVERY_SYSTEM_PARTITION := /dev/block/by-name/system

# Configuración de arquitectura
PRODUCT_GMS_CLIENTID_BASE := android-motorola
TARGET_IS_64_BIT := true
