#!/bin/bash

source ./helper-functions.sh

# Required on xorg setups
if [[ -z $WAYLAND_DISPLAY ]]; then
    if ! xhost "+si:localuser:$USER"; then
        echo "Couldn't use xhost, please install it and re-run installation"
        exit 1
    fi
fi

prefix="installation"

# If someone uses this setup env to use prefixed installation, initialise prefix var
init_prefixed_installation "$@"

PATH=$PWD/$prefix/podman/bin:$PWD/$prefix/distrobox/bin:$PATH