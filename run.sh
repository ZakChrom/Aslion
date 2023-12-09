#!/bin/sh
set -xe

~/Software/zig/zig test src/a8.zig
~/Software/zig/zig build
./zig-out/bin/main ./asm/triangle.asm $1