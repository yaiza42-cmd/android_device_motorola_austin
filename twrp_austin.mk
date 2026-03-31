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
# Intentamos la herencia universal de TWRP (Esta SIEMPRE existe en estos builders)
$(call inherit-product, vendor/twrp/config/common.mk)

# Identidad del dispositivo
PRODUCT_DEVICE := austin
PRODUCT_NAME := twrp_austin
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G 5G (2022)
PRODUCT_MANUFACTURER := motorola

# Forzar arquitectura 64 bits y compatibilidad
TARGET_IS_64_BIT := true
TARGET_SUPPORTS_64_BIT_APPS := true

# Definir ABIs (esto quita el error de 32-bit-only)
PRODUCT_CPU_ABI := arm64-v8a
PRODUCT_CPU_ABI2 := 
PRODUCT_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
PRODUCT_CPU_ABI_LIST_64_BIT := arm64-v8a
PRODUCT_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi

# --- INYECCIÓN MANUAL DE ORANGEFOX ---
# Borramos FOX_VERSION porque es obsoleta en la rama 12.1
FOX_BUILD_TYPE := Stable
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := true
OF_MAINTAINER := "Yaiza"
FOX_MAINTAINER_PATCH_VERSION := 1
ALLOW_MISSING_DEPENDENCIES := true

# Pantalla y Apariencia
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := es

# Particiones A/B
FOX_RECOVERY_INSTALL_PARTITION := /dev/block/by-name/boot
FOX_RECOVERY_SYSTEM_PARTITION := /dev/block/by-name/system

# Arquitectura
PRODUCT_GMS_CLIENTID_BASE := android-motorola
TARGET_IS_64_BIT := true
