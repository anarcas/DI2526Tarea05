;----------------------------------------
; Script NSIS - Tarea DI05 - Ejercicio 2
; Antonio Naranjo Castillo - DAM
;----------------------------------------

!include "MUI2.nsh"

; --- Configuración General ---
; Nombre del aplicativo en el instalador
Name "2026_U0502_Ayuda" 

; Nombre del archivo de instalación
OutFile "2026_U0502_Ayuda.exe" 

; Directorio de instalación en Archivos de Programa
InstallDir "$PROGRAMFILES\2026_U0502_Ayuda"

; Privilegios para instalar en Archivos de Programa
RequestExecutionLevel admin

; --- Interfaz Setting ---
!define MUI_ABORTWARNING

; --- Páginas del instalador ---
; Página de bienvenida
!define MUI_WELCOMEPAGE_TITLE "Bienvenido al Instalador de DevSoft Projects"
!define MUI_WELCOMEPAGE_TEXT "Este asistente le guiará durante la instalación de la aplicación. $\r$\n$\r$\nPresione Siguiente para continuar."
!insertmacro MUI_PAGE_WELCOME
; Página donde se selecciona el directorio donde instalar nuestra aplicacion
!insertmacro MUI_PAGE_DIRECTORY
; Página de instalación de ficheros
!insertmacro MUI_PAGE_INSTFILES
; Página final
!define MUI_FINISHPAGE_TITLE "Instalación Completada"
!define MUI_FINISHPAGE_TEXT "La aplicación se ha instalado correctamente en su equipo. $\r$\n$\r$\nYa puede utilizar el aplicativo DevSoft Projects."
!insertmacro MUI_PAGE_FINISH

; Páginas del desinstalador
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Se define el idioma español
!insertmacro MUI_LANGUAGE "Spanish"

; --- Sección de Instalación ---
Section "Instalación de Aplicación"

    ; Se establece el destino (Carpeta de instalación)
    SetOutPath "$INSTDIR"
    
    ; Ejecutable creado con Launch4j
    File "..\2026_U0502_exe\DevSoft_v1.0.exe"
    
    ; Las librerías necesarias (con recursividad)
    File /r "..\2026_U0502_exe\lib"
    
    ; Estructura de archivos de ayuda (Carpeta helpDS_ANC)  (con recursividad)
    File /r "..\2026_U0502_exe\helpDS_ANC"

    ; Se crea el desinstalador
    WriteUninstaller "$INSTDIR\Uninstall.exe"

    ; Se crea la carpeta en Menú Inicio y accesos directos
    CreateDirectory "$SMPROGRAMS\2026_U0502_Ayuda"
    
    ; Se crea el acceso directo a la aplicación
    CreateShortCut "$SMPROGRAMS\2026_U0502_Ayuda\DevSoft Projects.lnk" "$INSTDIR\DevSoft_v1.0.exe"
	
	; Se crea el acceso directo al escritorio
	CreateShortCut "$DESKTOP\DevSoft Projects.lnk" "$INSTDIR\DevSoft_v1.0.exe"
    
    ; Se crea el acceso directo al desinstalador
    CreateShortCut "$SMPROGRAMS\2026_U0502_Ayuda\Desinstalar.lnk" "$INSTDIR\Uninstall.exe"
    
SectionEnd

; --- Sección de Desinstalación ---
Section "Uninstall"
    ; Borrar archivos (Orden inverso)
    Delete "$INSTDIR\DevSoft_v1.0.exe"
    Delete "$INSTDIR\Uninstall.exe"
    RMDir /r "$INSTDIR\lib"
    RMDir /r "$INSTDIR\helpDS_ANC"
    RMDir /r "$INSTDIR"

    ; Borrar accesos del Menú Inicio
    Delete "$SMPROGRAMS\2026_U0502_Ayuda\DevSoft Projects.lnk"
	Delete "$DESKTOP\DevSoft Projects.lnk"
    Delete "$SMPROGRAMS\2026_U0502_Ayuda\Desinstalar.lnk"
    RMDir "$SMPROGRAMS\2026_U0502_Ayuda"
SectionEnd