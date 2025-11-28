#!/bin/bash
set -e

# Create Xpra runtime dir for non-root user
export XDG_RUNTIME_DIR=/tmp/runtime-$USER
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"

# Start Xpra
xpra start :100 --bind-tcp=0.0.0.0:14500 --html=on --daemon=yes

export DISPLAY=:100

if [ "$#" -gt 0 ]; then
    exec "$@"
else
    tail -f /dev/null
fi
