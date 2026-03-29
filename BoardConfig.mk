DEVICE_PATH := device/motorola/austin

# Arquitectura y Plataforma
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_BOARD_PLATFORM := mt6833
TARGET_BOOTLOADER_BOARD_NAME := mt6833
TARGET_NO_BOOTLOADER := true

# --- CONFIGURACIÓN DEL KERNEL (SEGÚN AIK) ---
BOARD_KERNEL_BASE := 0x40078000
BOARD_PAGE_SIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_TAGS_OFFSET := 0x07c08000
BOARD_DTB_OFFSET := 0x07c08000
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user

# --- MKBOOTIMG ARGS ---
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --header_version $(BOARD_BOOT_HEADER_VERSION) \
    --dtb $(DEVICE_PATH)/prebuilt/dtb

# Kernel y DTB
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_RECOVERY_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtb

# --- AVB Y ANTI-ROLLBACK (CON DATOS DE LA ROM OFICIAL) ---
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_SYSTEM_PROPERTY := true
BOARD_AVB_ROLLBACK_INDEX := 39
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_BOOT_ADD_HASH_FOOTER_ARGS := \
    --prop com.android.build.boot.fingerprint:motorola/austin_g/austin:12/T1SAS33.73-40-0-12-20/4dabf:user/release-keys \
    --prop com.android.build.boot.os_version:12 \
    --prop com.android.build.boot.security_patch:2025-04-01 \
    --prop com.motorola.build.hab.security_version:30 \
    --rollback_index 39

# Particiones y Tamaños (40MB)
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := boot system system_ext product vendor vbmeta
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_NO_RECOVERY := false

# --- FIX COMPILACIÓN ---
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init.recovery.mt6833.rc:recovery/root/init.recovery.mt6833.rc

BUILD_BROKEN_DUP_RULES := true
$(shell mkdir -p out/target/product/austin/root)
$(shell mkdir -p out/target/product/austin/recovery/root)

# --- FLAGS ESPECÍFICAS DE ORANGEFOX (NUEVO) ---
FOX_RECOVERY_INSTALL_PARTITION := /dev/block/by-name/boot
FOX_RECOVERY_SYSTEM_PARTITION := /dev/block/by-name/system
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
FOX_USE_NANO_EDITOR := 1
ALLOW_MISSING_DEPENDENCIES := true

# Gráficos
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
