#!/bin/sh

# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $

# This shell script returns the machine name.
# 
# Examples:
#   x86                 32-bit Intel compatible
#   x86_64              64-bit Intel compatible
#   armv6l              32-bit ARMV6 Little-Endian (Raspberry Pi Zero W, ...)
#   armv7l              32-bit ARMV7 Little-Endian (Raspberry Pi 3 B/B+, ...)
#
# Usage:
#   get_machine.sh      Return machine name.
#   get_machine.sh 32   Return machine name, assuming a 32-bit machine.
#   get_machine.sh 64   Return machine name, assuming a 64-bit machine.

machine=$(uname -m)

# machine="i386"
# machine="i686"
# machine="x86_64"
# machine="amd64"
# machine="armv6l"
# machine="armv7l"

# Unify Intel/AMD machine names.
case $machine in
    i386 | i686)
        if [ "$1" == "64" ]; then
            echo "* ERROR *: 64-bit not supported: $machine"
            exit 1
        else
            machine="x86"
        fi
        ;;
    x86_64 | amd64)
        if [ "$1" == "32" ]; then
            machine="x86"
        else
            machine="x86_64"
        fi
        ;;
esac

echo $machine
