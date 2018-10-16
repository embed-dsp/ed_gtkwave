
# Compile and Install of the GTKWave Tool

This repository contains make file for easy compile and install of [GTKWave](http://gtkwave.sourceforge.net).
GTKWave is a waveform viewer for LXT, LXT2, VZT, FST, GHW, VCD and EVCD files.


# Prerequisites

## MinGW-W64

```
FIXME: gperf, flex, bison
FIXME: tcl, tk
FIXME: xlib, bzlib, xz

```

## Cygwin 64-bit

```
zlib
libbz2
tcl-devel
tcl-tk-devel
```

## Fedora-27 64-bit | Fedora-28 64-bit

```bash
dnf install gcc-c++

dnf install zlib
dnf install zlib-devel

dnf install bzip2
dnf install bzip2-devel

dnf install xz
dnf install xz-devel

dnf install tcl
dnf install tcl-devel

dnf install tk
dnf install tk-devel

dnf install gtk2
dnf install gtk2-devel
```


# Get Source Code

## ed_gtkwave

```bash
git clone https://github.com/embed-dsp/ed_gtkwave.git
```

## GTKWave

```bash
# Enter the ed_gtkwave directory.
cd ed_gtkwave

# Edit the Makefile for selecting the GTKWave source version.
vim Makefile
PACKAGE_VERSION = 3.3.95
```

```bash
# Download GTKWave source package into src/ directory.
make download
```


# Build

```bash
# Unpack source code into build/ directory.
make prepare
```

```bash
# Configure source code for 64-bit compile (Default: M=64).
make configure
make configure M=64

# Configure source code for 32-bit compile.
make configure M=32
```

```bash
# Compile source code using 4 simultaneous jobs (Default: J=4).
make compile
make compile J=4
```


# Install

```bash
# Install build products.
sudo make install
```

The GTKWave package installs correctly according to the
[GNU Coding Standards](https://www.gnu.org/prep/standards/standards.html).
The build products are installed in the following locations:

```bash
opt/
└── gtkwave/
    └── gtkwave-3.3.95/     # prefix:
        ├── linux_x86_64/   # exec_prefix: 64-bit binaries and libraries for Linux
        │   └── bin/        # bindir:
        │       ├── gtkwave
        │       ...
        ├── linux_x86/      # exec_prefix: 32-bit binaries and libraries for Linux
        │   └── bin/        # bindir:
        │       ├── gtkwave
        │       ...
        └── share/          # datadir: Architecture independent data files.
            ...
```


# Notes

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)`
    * `gcc-7.2.1`
    * `gcc-7.3.1`
* `Fedora-28 (64-bit)`
    * `gcc-8.1.1`
