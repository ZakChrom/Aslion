#!/bin/sh
set -xe

LD_LIBRARY_PATH="/usr/local/lib/" RUSTFLAGS="-C target-cpu=native -L/usr/local/lib/" cargo run -r -- $@