#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "QuaZip::QuaZip" for configuration "Release"
set_property(TARGET QuaZip::QuaZip APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(QuaZip::QuaZip PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libquazip1-qt5.dll.a"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libquazip1-qt5.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS QuaZip::QuaZip )
list(APPEND _IMPORT_CHECK_FILES_FOR_QuaZip::QuaZip "${_IMPORT_PREFIX}/lib/libquazip1-qt5.dll.a" "${_IMPORT_PREFIX}/bin/libquazip1-qt5.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
