[![Deploy](https://github.com/humbertodias/docker-bennugd-compiler/actions/workflows/deploy.yml/badge.svg)](https://github.com/humbertodias/docker-bennugd-compiler/actions/workflows/deploy.yml)

# BennuGD 1.x Compiler (Docker)

A lightweight Docker image for **cross-compiling** [BennuGD](https://www.bennugd.org) applications on any platform.

Docker Hub: **[hldtux/bennugd-compiler](https://hub.docker.com/r/hldtux/bennugd-compiler)**

## 🚀 Setup

Add the following aliases to your shell (`~/.bashrc` or `~/.zshrc`):

```bash
bgdc() {
    docker run --rm -it \
        -v "$PWD":/workdir \
        hldtux/bennugd-compiler:r333 \
        bash -ic "bgdc \"$@\""
}
bgdi() {
    docker run --rm -it \
        -v "$PWD":/workdir \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        hldtux/bennugd-compiler:r333 \
        bash -ic "bgdi \"$@\""
}
```

Reload your shell:

```shell
source ~/.bashrc   # or ~/.zshrc
```

## 🛠️ Usage

Once the aliases are loaded, you can compile and run BennuGD projects directly from the current directory.

### ▶️ Console Example

```shell
cd samples/mod_say
bgdc main.prg       # Compile
bgdi main.dcb       # Run
```

**Output**

```
BGDC 1.0.0 (Jun 25 2016 23:17:40)
Bennu Game Development Compiler

Copyright (c) 2006-2016 SplinterGU (Fenix/BennuGD)
Copyright (c) 2002-2006 Fenix Team (Fenix)
Copyright (c) 1999-2002 José Luis Cebrián Pagüe (Fenix)

File main.dcb compiled (13211 bytes):

  Processes                     1
  Global data                 140 bytes
  Local data                   44 bytes
  Private data                  0 bytes
  Public data                   0 bytes
  Code                         20 bytes
  System processes              5
  Globals vars                  3
  Locals vars                   7
  Private vars                  0
  Publics vars                  0
  Identifiers                 184
  Structs                       1
  Strings                       5 (42 bytes)

Hello World!
```

### 🖼️ Graphic Mode

```shell
xhost +
cd samples/mod_text
bgdc main.prg
bgdi main.dcb
```

**Output**

![](samples/mod_text/mod_text.png)
