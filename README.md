<p align="center">
<img src="https://raw.githubusercontent.com/ZakChrom/Aslion/main/Aslion.png" height=170/>
</p>
<h1 align="center">Aslion</h1>

### Aslion is a [Astro8 Emulator](https://github.com/sam-astro/Astro8-Computer)
#### This project has fallen for the rewrite it in rust disease. You can find the old verision in the commits

## Comparison
TLDR: Aslion is 2.48x faster than the original emulator if i did the math correct
```
Aslion-Rust: asm/raytracer.asm
	2.78 min

Aslion: raytracer.asm -e
	3.35 min old
	3.48, 3.58, 4.25 min new

Original: ./raytracer.asm -f 999999999
	6.91 min

Yabal: run raytracer.yabal
	Never finished. I waited for 15 minutes.
```

## Usage
```console
$ ./run.sh file.asm
```

### Desktop application thingy
TODO

## Features
TODO

### Tested on rustc version `1.78.0-nightly`
