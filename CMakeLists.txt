cmake_minimum_required(VERSION 2.6)

if(${CMAKE_VERSION} STREQUAL "2.8.2")
	# Bug http://vtk.org/Bug/view.php?id=11020
	message(WARNING "CMake/CPack version 2.8.2 will not create working .deb packages!")
endif()

# This can be read from ${PROJECT_NAME} after project() is called
project(MineDigger)
set(PROJECT_NAME_CAPITALIZED "MineDigger")


# Also remember to set PROTOCOL_VERSION in network/networkprotocol.h when releasing
set(VERSION_MAJOR 0)
set(VERSION_MINOR 0)
set(VERSION_PATCH 1)
set(VERSION_EXTRA "" CACHE STRING "Stuff to append to version string")

# Change to false for releases
set(DEVELOPMENT_BUILD FALSE)

set(VERSION_STRING "${VERSION_STRING}-Unstable")

message(STATUS "*** Will build version ${VERSION_STRING} ***")

# Configuration options
set(DEFAULT_RUN_IN_PLACE TRUE)
if(WIN32)
	set(DEFAULT_RUN_IN_PLACE TRUE)
endif()
set(RUN_IN_PLACE ${DEFAULT_RUN_IN_PLACE} CACHE BOOL
	"Run directly in source directory structure")

set(BUILD_CLIENT TRUE CACHE BOOL "Build client")
set(BUILD_SERVER FALSE CACHE BOOL "Build server")


set(WARN_ALL TRUE CACHE BOOL "Enable -Wall for Release build")

if(NOT CMAKE_BUILD_TYPE)
	# Default to release
	set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type: Debug or Release" FORCE)
endif()

# Included stuff
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

# This is done here so that relative search paths are more reasonable
find_package(Irrlicht)

# Installation

if(WIN32)
	set(SHAREDIR ".")
	set(BINDIR "bin")
elseif(APPLE)
	set(BUNDLE_NAME ${PROJECT_NAME}.app)
	set(BUNDLE_PATH "${BUNDLE_NAME}")
	set(BINDIR ${BUNDLE_NAME}/Contents/MacOS)
	set(SHAREDIR ${BUNDLE_NAME}/Contents/Resources)
elseif(UNIX) # Linux, BSD etc
	if(RUN_IN_PLACE)
		set(SHAREDIR ".")
		set(BINDIR "bin")
		set(XDG_APPS_DIR "unix/applications")
		set(APPDATADIR "unix/appdata")
		set(ICONDIR "unix/icons")
	else()
		set(SHAREDIR "${CMAKE_INSTALL_PREFIX}/share/${PROJECT_NAME}")
		set(BINDIR "${CMAKE_INSTALL_PREFIX}/bin")
		set(XDG_APPS_DIR "${CMAKE_INSTALL_PREFIX}/share/applications")
		set(APPDATADIR "${CMAKE_INSTALL_PREFIX}/share/appdata")
		set(ICONDIR "${CMAKE_INSTALL_PREFIX}/share/icons")
	endif()
endif()

set(CUSTOM_SHAREDIR "" CACHE STRING "Directory to install data files into")
if(NOT CUSTOM_SHAREDIR STREQUAL "")
	set(SHAREDIR "${CUSTOM_SHAREDIR}")
	message(STATUS "Using SHAREDIR=${SHAREDIR}")
endif()

set(CUSTOM_BINDIR "" CACHE STRING "Directory to install binaries into")
if(NOT CUSTOM_BINDIR STREQUAL "")
	set(BINDIR "${CUSTOM_BINDIR}")
	message(STATUS "Using BINDIR=${BINDIR}")
endif()

set(CUSTOM_XDG_APPS_DIR "" CACHE STRING "Directory to install .desktop files into")
if(NOT CUSTOM_XDG_APPS_DIR STREQUAL "")
	set(XDG_APPS_DIR "${CUSTOM_XDG_APPS_DIR}")
	message(STATUS "Using XDG_APPS_DIR=${XDG_APPS_DIR}")
endif()

set(CUSTOM_ICONDIR "" CACHE STRING "Directory to install icons into")
if(NOT CUSTOM_ICONDIR STREQUAL "")
	set(ICONDIR "${CUSTOM_ICONDIR}")
	message(STATUS "Using ICONDIR=${ICONDIR}")
endif()

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/builtin" DESTINATION "${SHAREDIR}")
install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/client" DESTINATION "${SHAREDIR}")
set(MINETEST_GAME_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/games/minetest_game")
if(BUILD_CLIENT)
	install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/textures/base/pack" DESTINATION "${SHAREDIR}/textures/base")
endif()
if(RUN_IN_PLACE)
	install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/mods/mods_here.txt" DESTINATION "${SHAREDIR}/mods")
	install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/textures/texture_packs_here.txt" DESTINATION "${SHAREDIR}/textures")
endif()

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/fonts" DESTINATION "${SHAREDIR}")

if(UNIX AND NOT APPLE)
	install(FILES "misc/minetest.desktop" DESTINATION "${XDG_APPS_DIR}")
	install(FILES "misc/minetest.appdata.xml" DESTINATION "${APPDATADIR}")
	install(FILES "misc/minetest.svg" DESTINATION "${ICONDIR}/hicolor/scalable/apps")
endif()

if(APPLE)
	install(FILES "misc/minetest-icon.icns" DESTINATION "${SHAREDIR}")
	install(FILES "misc/Info.plist" DESTINATION "${BUNDLE_PATH}/Contents")
endif()

add_subdirectory(src)


set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "MineDigger is a voxel game based on Minetest from celeron55. It aims to be a fun game and lightweight. New features will be added on an ongoing basis.")
set(CPACK_PACKAGE_VERSION_MAJOR ${VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${VERSION_PATCH})
set(CPACK_PACKAGE_VENDOR "RegLnx")
set(CPACK_PACKAGE_CONTACT "RegLnx <reglnx@outlook.com>")

if(WIN32)
	if(CMAKE_SIZEOF_VOID_P EQUAL 8)
		set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-${VERSION_STRING}-win64")
	else()
		set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-${VERSION_STRING}-win32")
	endif()

	set(CPACK_GENERATOR ZIP)
elseif(APPLE)
	set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY 0)
	set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-${VERSION_STRING}-osx")
	set(CPACK_GENERATOR ZIP)
else()
	set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-${VERSION_STRING}-linux")
	set(CPACK_GENERATOR TGZ)
	set(CPACK_SOURCE_GENERATOR TGZ)
endif()

include(CPack)
