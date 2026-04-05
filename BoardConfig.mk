#
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/austin

# Bootloader
BOARD_VENDOR := motorola
TARGET_SOC := mt6833
TARGET_BOOTLOADER_BOARD_NAME := mt6833
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := austin

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Manifest
ALLOW_MISSING_DEPENDENCIES := true

# File systems
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Platform
TARGET_BOARD_PLATFORM := mt6833
TARGET_BOARD_PLATFORM_GPU := mali-g57mc2

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += boot system system_ext vendor product vbmeta dtbo
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

# Kernel / mkbootimg args
# Kernel / DTB
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_HASH_TYPE := sha1
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_HEADER_SIZE := 1660
BOARD_DTB_SIZE := 151008
BOARD_DTB_OFFSET := 0x07c08000
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_IMAGE_NAME := kernel

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true

BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Dynamic / Logical Partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe

# System as root
BOARD_ROOT_EXTRA_FOLDERS := metadata first_stage_ramdisk
BOARD_SUPPRESS_SECURE_ERASE := true

# Copying vendor and product files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product

#Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Crypto & Security
BOARD_USES_METADATA_PARTITION := true
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false

# Forzar modo permisivo para saltar la seguridad de GrapheneOS
BOARD_RECOVERY_ALWAYS_ENFORCES_SELINUX := false
TARGET_USES_LOGD := false

# Ajuste exacto al boot original
PLATFORM_SECURITY_PATCH := 2025-04
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 12.0.0

# --- Configuración de Pantalla y Gráficos (Ajuste 736px) ---
TARGET_SCREEN_WIDTH := 736
TARGET_SCREEN_HEIGHT := 1600
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
RECOVERY_GRAPHICS_FORCE_USE_LINUX_FB := true
TW_USE_NEW_MINUI := true

# --- Solución al error de Linker (android_memset16) ---
# Esto obliga a incluir las funciones de memoria que le faltan a tu base
TARGET_RECOVERY_DEVICE_MODULES += libcutils
TARGET_RECOVERY_STUBS := true
TARGET_GLOBAL_CFLAGS += -Dstronger_memset
TARGET_GLOBAL_CPPFLAGS += -Dstronger_memset

# --- Compatibilidad con Android 12.1 / 13 (Motorola Austin) ---
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# --- Brillo y Retroiluminación ---
# Intentamos la ruta estándar de Moto para que no inicie a oscuras
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150

# Eliminar el logo de Motorola al entrar
TW_SCREEN_BLANK_ON_BOOT := true

# --- SECCIÓN DE AHORRO EXTREMO DE ESPACIO (ORANGEFOX) ---
RECOVERY_RAMDISK_COMPRESSOR := gzip
TW_EXCLUDE_I18N := true
TW_EXCLUDE_NTFS_3G := true
TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_REPACKTOOLS := false
TW_EXCLUDE_APEX := true

# Eliminar Magisk y funciones de Root
OFOX_DISABLE_MAGISK_BUILTIN := 1
TW_INCLUDE_RESETPROP := false

# Activar modo ultra ligero y quitar backups pesados
FOX_MINIMAL_IMAGE := 1
FOX_EXCLUDE_ENCRYPTED_BACKUPS := 1

# Eliminar binarios pesados (Usar solo Toybox)
FOX_REMOVE_AAPT := 1
FOX_REMOVE_BASH := 0
FOX_REMOVE_NANO := 1
FOX_REMOVE_TAR := 0
FOX_REMOVE_SED := 0
FOX_EXCLUDE_APEX := 1

# Apps y complementos
TW_EXCLUDE_TWRPAPP := true
FOX_DELETE_AROMA_FM := 1
# -------------------------------------------------------

TW_USE_TOOLBOX := true
TW_USE_NEW_MINADBD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_default

TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_IGNORE_MISC_WIPE_DATA := true
BOARD_USES_MTK_HARDWARE := true
RECOVERY_SDCARD_ON_DATA := true
TW_USES_VENDOR_LIBS := true
PRODUCT_ENFORCE_VINTF_MANIFEST := true
PRODUCT_FULL_TREBLE := true

# Build Debug
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Kernel module loading
TW_LOAD_VENDOR_MODULES := $(shell echo \"$(shell ls $(DEVICE_PATH)/recovery/root/vendor/lib/modules/)\")
TW_LOAD_VENDOR_BOOT_MODULES := true

# Compatibilidad UI (Solo una vez)
TW_USE_NEW_MINUI := true


