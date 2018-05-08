
# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $


# Package.
PACKAGE_NAME = gtkwave
PACKAGE_VERSION = 3.3.89
PACKAGE = $(PACKAGE_NAME)-$(PACKAGE_VERSION)

# Build for 32-bit or 64-bit (Default)
ifeq ($(M),)
	M = 64
endif

ifeq ($(M),64)
	CFLAGS = -Wall -O2 -m64
else
	CFLAGS = -Wall -O2 -m32
endif

CC = /usr/bin/gcc

# Architecture.
ARCH = $(shell ./bin/get_arch.sh $(M))

# Installation.
PREFIX = /opt/gtkwave/$(PACKAGE)
EXEC_PREFIX = $(PREFIX)/$(ARCH)

# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif


all:
	@echo ""
	@echo "## Get Source Code"
	@echo "make download"
	@echo ""
	@echo "## Build"
	@echo "make prepare"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo ""
	@echo "## Install"
	@echo "sudo make install"
	@echo ""
	@echo "## Cleanup"
	@echo "make distclean"
	@echo "make clean"
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
	cd build/$(PACKAGE) && ./configure CC=$(CC) CFLAGS="$(CFLAGS)" --prefix=$(PREFIX) --exec_prefix=$(EXEC_PREFIX)


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
