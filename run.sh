#!/bin/sh
set -xe

./test.sh
~/Software/zig/zig build
./zig-out/bin/main ./asm/triangle.asm $1