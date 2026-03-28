DEVICE_PATH := device/motorola/austin

# Arquitectura
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic

# Plataforma
TARGET_BOARD_PLATFORM := mt6833
TARGET_BOOTLOADER_BOARD_NAME := mt6833
TARGET_NO_BOOTLOADER := true

# Configuración del Kernel (Sacada de tu AIK)
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) --cmdline "$(BOARD_KERNEL_CMDLINE)"

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBIMAGE_PATH := $(DEVICE_PATH)/prebuilt/boot.img-dtb
BOARD_INCLUDE_RECOVERY_DTBO := true

# Particiones Dinámicas y A/B
AB_OTA_UPDATER := true
# --- ESTO ES LO QUE SOLUCIONA EL ERROR FAILED: AB_OTA_PARTITIONS ---
AB_OTA_PARTITIONS := boot system system_ext product vendor vbmeta
BOARD_USES_RECOVERY_AS_BOOT := true

# --- SOLUCIÓN DEFINITIVA PARA ERROR RSYNC (INTENTO #19) ---

# Inyectar archivos directamente en la ramdisk de recuperación
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init.recovery.mt6833.rc:recovery/root/init.recovery.mt6833.rc \
    $(DEVICE_PATH)/prop.default:recovery/root/prop.default \
    $(DEVICE_PATH)/ueventd.rc:recovery/root/ueventd.rc \
    $(DEVICE_PATH)/vendor_file_contexts:recovery/root/vendor_file_contexts

# Forzar la creación de la ruta que rsync está buscando
TARGET_RECOVERY_ROOT_OUT := out/target/product/austin/recovery/root
BOARD_ROOT_EXTRA_FOLDERS := bluetooth metadata postinstall
BOARD_HAS_NO_VENDOR_PARTITION := true

# Configuración A/B y sistema unificado
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := false

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 8589934592
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor

# Arquitectura y Apps
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_SUPPORTS_ARM_64_BIT_APPS := true

# TWRP Graphics
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
