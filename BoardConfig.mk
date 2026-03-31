DEVICE_PATH := device/motorola/austin

# --- ARQUITECTURA Y PLATAFORMA ---
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_BOARD_PLATFORM := mt6833
TARGET_BOOTLOADER_BOARD_NAME := mt6833
TARGET_NO_BOOTLOADER := true

# Arquitectura Secundaria (32 bits)
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# --- KERNEL ---
BOARD_KERNEL_BASE := 0x40078000
BOARD_PAGE_SIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_TAGS_OFFSET := 0x07c08000
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user

# Prebuilt kernel / dtbo
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo
BOARD_KERNEL_IMAGE_NAME := Image.gz

# IMPORTANTE: evitar conflictos de dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# mkbootimg args (más limpio y seguro)
BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET) \
    --header_version $(BOARD_BOOT_HEADER_VERSION)

# --- PARTICIONES ---
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_TYPE := f2fs

# --- A/B + DYNAMIC PARTITIONS ---
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := boot system system_ext product vendor vbmeta

BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_HAS_FIRST_STAGE_RAMDISK := true
BOARD_VIRTUAL_AB_DEVICE := true

# 🔥 FIX CRÍTICO
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

TARGET_NO_RECOVERY := true

# --- FSTAB ---
TARGET_RECOVERY_FSTAB := device/motorola/austin/recovery.fstab

# --- SEPOLICY (OBLIGATORIO PARA BOOT) ---
BOARD_SEPOLICY_DIRS += device/motorola/austin/sepolicy

# --- AVB ---
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := 0
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 0

BOARD_AVB_BOOT_ADD_HASH_FOOTER_ARGS := \
    --prop com.android.build.boot.fingerprint:motorola/austin_g/austin:12/T1SAS33.73-40-0-12-20/4dabf:user/release-keys \
    --prop com.android.build.boot.os_version:12 \
    --prop com.android.build.boot.security_patch:2025-04-01 \
    --prop com.motorola.build.hab.security_version:30

# --- BINARIOS RECOVERY ---
TARGET_RECOVERY_DEVICE_MODULES += \
    bash \
    resetprop \
    libion \
    tune2fs \
    e2fsck

# --- UI ---
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255

# --- ORANGEFOX ---
OF_AB_DEVICE := true
OF_VIRTUAL_AB_DEVICE := true
OF_USE_MAGISKBOOT := true

TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

FOX_USE_NANO_EDITOR := 1

# --- BUILD ---
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true

PLATFORM_VERSION := 12
PLATFORM_SECURITY_PATCH := 2025-04-01

# --- FIX DIRECTORIOS ---
$(shell mkdir -p $(OUT_DIR)/target/product/austin/root)
$(shell mkdir -p $(PRODUCT_OUT)/root)
$(shell mkdir -p $(PRODUCT_OUT)/recovery/root)
