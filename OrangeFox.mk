# Heredar configuración de OrangeFox
$(call inherit-product, vendor/otter/config/common.mk)

PRODUCT_NAME := twrp_austin
PRODUCT_DEVICE := austin
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G 5G (2022)
PRODUCT_MANUFACTURER := motorola

# Versión y Flags de OrangeFox
FOX_VERSION := R11.1
FOX_BUILD_TYPE := Stable
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := true
ALLOW_MISSING_DEPENDENCIES := true

# Pantalla y Apariencia
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := es
