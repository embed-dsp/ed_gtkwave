
# Copyright (c) 2018-2024 embed-dsp, All Rights Reserved.
# Author: Gudmundur Bogason <gb@embed-dsp.com>


PACKAGE_NAME = gtkwave

PACKAGE_VERSION = 3.3.119

PACKAGE = $(PACKAGE_NAME)-$(PACKAGE_VERSION)

# ==============================================================================

# Determine system.
SYSTEM = unknown
ifeq ($(findstring Linux, $(shell uname -s)), Linux)
	SYSTEM = linux
endif
ifeq ($(findstring MINGW32, $(shell uname -s)), MINGW32)
	SYSTEM = mingw32
endif
ifeq ($(findstring MINGW64, $(shell uname -s)), MINGW64)
	SYSTEM = mingw64
endif

# Determine machine.
MACHINE = $(shell uname -m)

# Architecture.
ARCH = $(SYSTEM)_$(MACHINE)

# ==============================================================================

# Set number of simultaneous jobs (Default 8)
ifeq ($(J),)
	J = 8
endif

# System configuration.
CONFIGURE_FLAGS =

# Compiler.
CFLAGS = -Wall -O2

# Configuration for linux system.
ifeq ($(SYSTEM),linux)
	# Compiler.
	CC = /usr/bin/gcc
	# Installation directory.
	INSTALL_DIR = /opt
endif

# Configuration for mingw32 system.
ifeq ($(SYSTEM),mingw32)
	# System configuration.
	CONFIGURE_FLAGS += --with-tcl=/mingw32/lib --with-tk=/mingw32/lib
	# Compiler.
	CC = /mingw32/bin/gcc
	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# Configuration for mingw64 system.
ifeq ($(SYSTEM),mingw64)
	# System configuration.
	CONFIGURE_FLAGS += --with-tcl=/mingw64/lib --with-tk=/mingw64/lib
	# Compiler.
	CC = /mingw64/bin/gcc
	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# Installation directory.
PREFIX = $(INSTALL_DIR)/$(PACKAGE_NAME)/$(PACKAGE)
EXEC_PREFIX = $(PREFIX)/$(ARCH)

# ==============================================================================


all:
	@echo "ARCH   = $(ARCH)"
	@echo "PREFIX = $(PREFIX)"
	@echo ""
	@echo "## Get Source Code"
	@echo "make download"
	@echo ""
	@echo "## Build"
	@echo "make prepare"
	@echo "make configure"
	@echo "make compile [J=...]"
	@echo ""
	@echo "## Install"
	@echo "[sudo] make install"
	@echo ""
	@echo "## Cleanup"
	@echo "make clean"
	@echo "make distclean"
	@echo ""


.PHONY: download
download:
	-mkdir src
	cd src && wget -nc http://gtkwave.sourceforge.net/$(PACKAGE).tar.gz


.PHONY: prepare
prepare:
	-mkdir build
	cd build && tar zxf ../src/$(PACKAGE).tar.gz


.PHONY: configure
configure:
	cd build/$(PACKAGE) && ./configure CC=$(CC) CFLAGS="$(CFLAGS)" --prefix=$(PREFIX) --exec_prefix=$(EXEC_PREFIX) $(CONFIGURE_FLAGS)


.PHONY: compile
compile:
	cd build/$(PACKAGE) && make -j$(J)


.PHONY: install
install:
	cd build/$(PACKAGE) && make install


.PHONY: clean
clean:
	cd build/$(PACKAGE) && make clean


.PHONY: distclean
distclean:
	cd build/$(PACKAGE) && make distclean
