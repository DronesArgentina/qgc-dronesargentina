# ============================================================================
# Custom Build Configuration Overrides
# Template for customizing QGroundControl branding and feature set
# ============================================================================

# ----------------------------------------------------------------------------
# Application Branding
# ----------------------------------------------------------------------------
# dronesargentina: nombre de la app. Se usa tambien como nombre del target de
# CMake y del ejecutable, por eso va sin espacios.
set(QGC_APP_NAME "DronesArgentinaGS" CACHE STRING "App Name" FORCE)
# dronesargentina: identificador de Android. No cambiarlo una vez distribuida la app.
set(QGC_ANDROID_PACKAGE_NAME "ar.com.dronesargentina.gs" CACHE STRING "Android package identifier" FORCE)

# ----------------------------------------------------------------------------
# Custom Icons and Graphics
# ----------------------------------------------------------------------------

# macOS Icon
if(EXISTS "${CMAKE_SOURCE_DIR}/${QGC_CUSTOM_DIR}/res/icons/custom_qgroundcontrol.icns")
    set(QGC_MACOS_ICON_PATH "${CMAKE_SOURCE_DIR}/${QGC_CUSTOM_DIR}/res/icons/custom_qgroundcontrol.icns" CACHE FILEPATH "MacOS Icon Path" FORCE)
endif()

# Linux AppImage Icon
if(EXISTS "${CMAKE_SOURCE_DIR}/${QGC_CUSTOM_DIR}/res/icons/custom_qgroundcontrol.svg")
    set(QGC_APPIMAGE_ICON_SCALABLE_PATH "${CMAKE_SOURCE_DIR}/${QGC_CUSTOM_DIR}/res/icons/custom_qgroundcontrol.svg" CACHE FILEPATH "AppImage Icon SVG Path" FORCE)
endif()

# Windows Installer Header
# dronesargentina: NSIS necesita la ruta con barras de Windows (\) para el encabezado
if(EXISTS "${CMAKE_SOURCE_DIR}/${QGC_CUSTOM_DIR}/deploy/windows/installheader.bmp")
    file(TO_NATIVE_PATH "${CMAKE_SOURCE_DIR}/${QGC_CUSTOM_DIR}/deploy/windows/installheader.bmp" _dronesarg_header)
    #set(QGC_WINDOWS_INSTALL_HEADER_PATH "${_dronesarg_header}" CACHE FILEPATH "Windows Install Header Path" FORCE)
    set(QGC_WINDOWS_INSTALL_HEADER_PATH "${_dronesarg_header}" CACHE STRING "Windows Install Header Path" FORCE)
endif()

# Windows Application Icon
if(EXISTS "${CMAKE_SOURCE_DIR}/${QGC_CUSTOM_DIR}/deploy/windows/WindowsQGC.ico")
    set(QGC_WINDOWS_ICON_PATH "${CMAKE_SOURCE_DIR}/${QGC_CUSTOM_DIR}/deploy/windows/WindowsQGC.ico" CACHE FILEPATH "Windows Icon Path" FORCE)
endif()

# ----------------------------------------------------------------------------
# Feature Set Customization
# ----------------------------------------------------------------------------

# dronesargentina: solo se registra el factory propio (ArduCopter).
# Los factories originales de ArduPilot y PX4 quedan desactivados.
set(QGC_DISABLE_APM_PLUGIN_FACTORY ON CACHE BOOL "Disable APM Plugin Factory" FORCE)
set(QGC_DISABLE_PX4_PLUGIN_FACTORY ON CACHE BOOL "Disable PX4 Plugin Factory" FORCE)
