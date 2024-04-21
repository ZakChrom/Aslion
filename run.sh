#!/bin/sh
set -xe

RUSTFLAGS="-C target-cpu=native" cargo run -r -- $1