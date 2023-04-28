#!/bin/bash

source ./helper-functions.sh

# Required on xorg setups
if [[ -z $WAYLAND_DISPLAY ]]; then
    xhost "+si:localuser:$USER"
    if [ $? -ne 0 ]; then
        echo "Couldn't use xhost, please install it and re-run installation"
        exit 1
    fi
fi

prefix="installation"

# If someone uses this setup env to use prefixed installation, initialise prefix var
init_prefixed_installation "$@"

export CONTAINERS_CONF=$PWD/$prefix/.config/containers/containers.conf
export CONTAINERS_REGISTRIES_CONF=$PWD/$prefix/.config/containers/registries.conf
export CONTAINERS_STORAGE_CONF=$PWD/$prefix/.config/containers/storage.conf
# export CONTAINERS_RUNROOT=$XDG_RUNTIME_DIR/alvr
# export CONTAINERS_GRAPHROOT=$PWD/$prefix/podman/share/podman
export PATH=$PWD/$prefix/podman/bin:$PWD/$prefix/distrobox/bin:$PATH