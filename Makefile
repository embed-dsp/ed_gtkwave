
# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $

# Package name and version number
PACKAGE = gtkwave-3.3.86


# Select between 32-bit or 64-bit machine (Default 64-bit)
ifeq ($(M),)
	M = 64
endif


# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif


CC = /usr/bin/gcc

PREFIX = /opt/gtkwave/$(PACKAGE)

ifeq ($(M), 64)
	CFLAGS = "-Wall -O2 -m64"
	EXEC_PREFIX = $(PREFIX)/linux_x86_64
else
	CFLAGS = "-Wall -O2 -m32"
	EXEC_PREFIX = $(PREFIX)/linux_x86
endif


all:
	@echo ""
	@echo "make download"
	@echo "make prepare"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo "sudo make install"
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
	cd build/$(PACKAGE) && ./configure CC=$(CC) CFLAGS=$(CFLAGS) --prefix=$(PREFIX) --exec_prefix=$(EXEC_PREFIX)


.PHONY: compile
compile:
	cd build/$(PACKAGE) && make -j$(J)


.PHONY: install
install:
	cd build/$(PACKAGE) && make install


.PHONY: clean
clean:
	-rm -rf build
	# cd build/$(PACKAGE) && make clean
