#!/bin/bash
clear
if zig build run -- save ./src/pong.asm; then
    cd out
    ffmpeg -f image2 -r 60 -i frame%d.png -vcodec libx264 -crf 18 -pix_fmt yuv420p out.mp4 -y
fi
