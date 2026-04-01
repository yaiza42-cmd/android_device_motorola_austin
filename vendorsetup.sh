export TW_DEFAULT_LANGUAGE="es" # Cambiado a español si prefieres
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true

	# Reducir tamaño de la imagen (Útil para no exceder el tamaño del boot)
	export FOX_REMOVE_AAPT=1
	export FOX_REMOVE_BUSYBOX_BINARY=1

	# Ajuste de partición Boot para MT6833
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"

	# Linterna (Si en Kyota no funcionaba, es probable que en Austin necesite otra ruta)
	export OF_FLASHLIGHT_ENABLE=0
	export OF_USE_GREEN_LED=0

	# VBMeta y Keymaster
	export OF_PATCH_VBMETA_FLAG=0
	export OF_DEFAULT_KEYMASTER_VERSION=4.1

	# Variables A/B recomendadas
	export FOX_AB_DEVICE=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export OF_VANILLA_BUILD=0

	# Lista de copia de seguridad rápida
	export OF_QUICK_BACKUP_LIST="/boot;/metadata;"

	# Herramientas y binarios
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_NANO_EDITOR=1
	export OF_ENABLE_LPTOOLS=1
	export FOX_ENABLE_APP_MANAGER=1
	export FOX_DELETE_AROMAFM=1

	# Magisk y Versión (Ajustado a Yaiza)
	export FOX_MAINTAINER_PATCH_VERSION="R11.1_A12.1"
	export OF_MAINTAINER="Alex_XDA"
	
	# Configuración de Pantalla para Austin (720x1600)
	export OF_SCREEN_H=1600
	export OF_STATUS_H=90
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_HIDE_NOTCH=1
