#!/bin/sh

# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $

# This shell script returns the kernel name.
# 
# Examples:
#   linux           Linux
#   cygwin          Cygwin
#   mingw32         MinGW
#   mingw64         MinGW-W64
#
# Usage:
#   get_kernel.sh   Return architecture name.

kernel=$(uname -s)

# kernel="Linux"                Fedora-28 64-bit
# kernel="CYGWIN_NT-10.0-WOW"   Cygwin32 @ Windows-10 64-bit
# kernel="CYGWIN_NT-10.0"       Cygwin64 @ Windows-10 64-bit
# kernel="MINGW32_NT-6.2"       MinGW @ Windows-10 64-bit
# kernel="MINGW64_NT-10.0"      MinGW-W64 @ Windows-10 64-bit
# kernel="Fubar"

# Normalize kernel names.
case $kernel in
    Linux*)
        kernel=linux
        ;;
    CYGWIN*)
        kernel=cygwin
        ;;
    MINGW32*)
        kernel=mingw32
        ;;
    MINGW64*)
        kernel=mingw64
        ;;
    *)
        echo "* ERROR *: Unknown kernel: $kernel"
        exit 1
esac

echo $kernel
