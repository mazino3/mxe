# This file is part of MXE. See LICENSE.md for licensing information.

# override relevant cloog, isl, and gcc variables changed in:
# https://github.com/mxe/mxe/pull/965
#
# simply expanded variables (*_SUBDIR, *_FILE, etc.) need to be set

PKG             := cloog
$(PKG)_TARGETS  := $(MXE_TARGETS)

PKG             := isl
$(PKG)_VERSION  := 0.16.1
$(PKG)_CHECKSUM := 412538bb65c799ac98e17e8cfcdacbb257a57362acfaaff254b0fcae970126d2
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := https://libisl.sourceforge.io/$($(PKG)_FILE)
$(PKG)_URL_2    := https://gcc.gnu.org/pub/gcc/infrastructure/$($(PKG)_FILE)

PKG             := gcc
$(PKG)_VERSION  := 9.5.0
$(PKG)_RELEASE  := $($(PKG)_VERSION)
$(PKG)_CHECKSUM := 27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5a0a2915a95cf8f
$(PKG)_SUBDIR   := gcc-$($(PKG)_VERSION)
$(PKG)_FILE     := gcc-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://ftp.gnu.org/gnu/gcc/gcc-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_URL_2    := https://www.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_PATCHES  := $(dir $(lastword $(MAKEFILE_LIST)))/gcc9.patch

# copy db-2-install-exe.patch to gcc7 plugin when gcc9 is default
db_PATCHES := $(TOP_DIR)/src/db-1-fix-including-winioctl-h-lowcase.patch

# set these in respective makefiles when gcc9 becomes default
# remove from here and leave them blank for gcc5 plugin
libssh_EXTRA_WARNINGS = -Wno-error=implicit-fallthrough
gtkimageview_EXTRA_WARNINGS = -Wno-error=misleading-indentation
guile_EXTRA_WARNINGS = -Wno-error=misleading-indentation
gtkmm2_EXTRA_WARNINGS = -Wno-error=cast-function-type
gtkmm3_EXTRA_WARNINGS = -Wno-error=cast-function-type
gtkglextmm_EXTRA_WARNINGS = -Wno-error=cast-function-type
