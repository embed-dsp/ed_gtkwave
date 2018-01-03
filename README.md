
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

# Edit the Makefile for selecting the GTKave version.
vim Makefile
PACKAGE = gtkwave-3.3.86

# Download GTKWave source package into src/ directory.
make download
```

Build
=====
```bash
# Unpack source code into build/ directory.
make prepare

# Configure source code for 64-bit compile (Default: M=64).
make configure
make configure M=64

# Configure source code for 32-bit compile.
make configure M=32

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
        ├── linux_x86_64    # 64-bit binaries for Linux
        │   └── bin
        │       ├── gtkwave
        │       ...
        ├── linux_x86       # 32-bit binaries for Linux
        │   └── bin
        │       ├── gtkwave
        │       ...
        └── share           # ...
            ...
```

Notes
=====

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
