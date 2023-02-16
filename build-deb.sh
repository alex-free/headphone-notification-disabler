#!/bin/bash

cd "$(dirname "$0")"
rm -f headphone-notification-disabler-1.0.deb

if [ "$1" == "--clean" ]; then
    exit 0
fi

if ! command -v dpkg-deb &> /dev/null; then
    if command -v dnf &> /dev/null; then
        sudo dnf install dpkg-dev
    else
        echo "Error: dpkg-deb can not be found, please install it."
        exit 1
    fi
fi

dpkg-deb -b headphone-notification-disabler-1.0