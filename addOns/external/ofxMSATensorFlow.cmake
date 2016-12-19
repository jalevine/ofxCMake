# =================================================================
# =================================================================

set( NAME_ADDON     ofxMSATensorFlow )

#==================================================================


# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SOURCE    ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/src )
set( PATH_LIBS      ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/libs )

# --- Setting abolute path to prevent errors
get_filename_component( PATH_SOURCE_ABSOLUTE ${PATH_SOURCE} ABSOLUTE)
get_filename_component( PATH_LIBS_ABSOLUTE ${PATH_LIBS} ABSOLUTE)

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SOURCE_ABSOLUTE}/*.cpp" )
file( GLOB_RECURSE   OFX_ADDON_LIBS_CPP     "${PATH_LIBS_ABSOLUTE}/*.cpp" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

OF_find_header_directories( HEADERS_SOURCE ${PATH_SOURCE_ABSOLUTE} )
OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS_ABSOLUTE} )

#include_directories( "${PATH_LIBS_ABSOLUTE}/tensorflow/include" )
include_directories(
        ${PATH_LIBS_ABSOLUTE}/tensorflow/include
        ${PATH_LIBS_ABSOLUTE}/tensorflow/include/third_party/eigen3
        ${PATH_LIBS_ABSOLUTE}tensorflow/include/external/eigen_archive
        ${PATH_LIBS_ABSOLUTE}/tensorflow/include/external/eigen_archive/eigen-eigen-70505a059011
        )


include_directories( ${HEADERS_SOURCE} )
#include_directories( ${HEADERS_LIBS} )
