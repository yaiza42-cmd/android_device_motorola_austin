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

# --- CONFIGURACIÓN DEL KERNEL & BOOT HEADER ---
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user

# Unimos todos los argumentos para mkbootimg (Header 2 es vital aquí)
BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) --cmdline "$(BOARD_KERNEL_CMDLINE)" --header_version $(BOARD_BOOT_HEADER_VERSION)

# Kernel y DTB
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBIMAGE_PATH := $(DEVICE_PATH)/prebuilt/boot.img-dtb
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_RECOVERY_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/boot.img-dtb

# --- AJUSTE DE SEGURIDAD AVB (SACADO DE TU INFO) ---
# Usamos una fecha ligeramente superior a la original para saltar el Anti-Rollback
BOARD_OS_VERSION := 12
BOARD_OS_PATCH_LEVEL := 2025-04-05
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := 0
BOARD_AVB_MAKE_VBMETA_IMAGE_SYSTEM_PROPERTY := true

# Tamaño de partición (40MB exactos)
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040

# --- CONFIGURACIÓN A/B Y RAMDISK ---
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := boot system system_ext product vendor vbmeta
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_NO_RECOVERY := false

# Archivos críticos para MediaTek
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init.recovery.mt6833.rc:recovery/root/init.recovery.mt6833.rc \
    $(DEVICE_PATH)/prop.default:recovery/root/prop.default \
    $(DEVICE_PATH)/ueventd.rc:recovery/root/ueventd.rc

BUILD_BROKEN_DUP_RULES := true

# Solución Directorio Fantasma para rsync
$(shell mkdir -p $(OUT_DIR)/target/product/austin/root)
$(shell mkdir -p out/target/product/austin/root)
TARGET_RECOVERY_ROOT_OUT := out/target/product/austin/recovery/root

# Particiones Dinámicas
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 8589934592
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor

# TWRP Graphics
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
