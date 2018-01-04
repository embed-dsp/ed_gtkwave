
Compile and Install of the GTKWave Tool
=======================================

This repository contains make file for easy compile and install of the GTKWave Tool.
GTKWave is a waveform viewer for LXT, LXT2, VZT, FST, GHW, VCD and EVCD files.

Get tool and source code
========================

## ed_gtkwave
```bash
git clone https://github.com/embed-dsp/ed_gtkwave.git
```

## GTKWave Source
```bash
# Enter the ed_gtkwave directory.
cd ed_gtkwave

# Edit the Makefile for selecting the GTKWave source version.
vim Makefile
PACKAGE_VERSION = 3.3.86

# Download GTKWave source package into src/ directory.
make download
```

Build
=====
```bash
# Unpack source code into build/ directory.
make prepare

# Configure source code.
make configure

# Compile source code using 4 simultaneous jobs (Default: J=4).
make compile
make compile J=4
```

Install
=======
```bash
# Install build products.
sudo make install
```

The build products are installed in the following locations:
```bash
opt
└── gtkwave
    └── gtkwave-3.3.86
        ├── linux_x86_64    # 64-bit binaries and libraries for Linux
        │   └── bin
        │       ├── gtkwave
        │       ...
        ├── linux_x86       # 32-bit binaries and libraries for Linux
        │   └── bin
        │       ├── gtkwave
        │       ...
        └── share           # ...
            ...
```

Notes
=====

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)` and `gcc-7.2.1`

## Required Packages

```bash
zlib
zlib-devel

bzip2-devel
bzip2-libs

xz-devel
xz-libs

tcl
tcl-devel

tk
tk-devel
```
