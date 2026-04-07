export TW_DEFAULT_LANGUAGE="es" # Cambiado a español si prefieres
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true

	# Reducir tamaño de la imagen (Útil para no exceder el tamaño del boot)
	export FOX_REMOVE_AAPT=1
	export FOX_REMOVE_BUSYBOX_BINARY=0

	# Ajuste de partición Boot para MT6833
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
	export OF_DYNAMIC_FULL_SIZE= 9126805504

	# Linterna (Si en Kyota no funcionaba, es probable que en Austin necesite otra ruta)
	export OF_FLASHLIGHT_ENABLE=0
	export OF_USE_GREEN_LED=0

	# VBMeta y Keymaster
	export OF_DEFAULT_KEYMASTER_VERSION=4.1

    # Variables A/B - ¡ESTO ES CRÍTICO!
    export FOX_AB_DEVICE=1
    export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export OF_NO_MIUI_PATCH_WARNING=1
    export FOX_VANILLA_BUILD=1 # Cambia a 1 para una build limpia sin añadidos de MIUI/ROMs específicas

	# Lista de copia de seguridad rápida
	export OF_QUICK_BACKUP_LIST="/boot;/metadata;"

	# Herramientas y binarios
	export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=0
	export FOX_USE_TAR_BINARY=0
	export FOX_USE_SED_BINARY=0
	export FOX_USE_XZ_UTILS=0
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_NANO_EDITOR=0
	export OF_ENABLE_LPTOOLS=1
	export FOX_ENABLE_APP_MANAGER=0
	export FOX_DELETE_AROMAFM=1
	# Magisk (Para evitar errores de espacio en el ramdisk)
    export OF_DISABLE_MAGISK_EXTRACT=1 # Añade esto para que no intente descomprimir Magisk en el arranque

	# Magisk y Versión (Ajustado a Yaiza)
	export FOX_MAINTAINER_PATCH_VERSION="1"
	export OF_MAINTAINER=Y2
	
	# Configuración de Pantalla para Austin (720x1600)
	export OF_SCREEN_H=1600
	export OF_STATUS_H=100
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_HIDE_NOTCH=1
