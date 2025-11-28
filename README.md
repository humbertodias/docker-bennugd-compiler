[![Deploy](https://github.com/humbertodias/docker-bennugd-compiler/actions/workflows/deploy.yml/badge.svg)](https://github.com/humbertodias/docker-bennugd-compiler/actions/workflows/deploy.yml)

# BennuGD 1.x Compiler with Xpra Web

A lightweight Docker image for **cross-compiling** and **running BennuGD applications in the browser** using [Xpra](https://xpra.org).

Docker Hub: [hldtux/bennugd-compiler](https://hub.docker.com/r/hldtux/bennugd-compiler)

## 🚀 Setup

Add the following functions to your shell (`~/.bashrc` or `~/.zshrc`) for compiling and running BennuGD in the browser:

```bash
# Compile BennuGD projects
bgdc() {
    docker run --rm -it \
        -v "$PWD":/workdir \
        hldtux/bennugd:r333 \
        bash -ic "bgdc \"$@\""
}

# Run BennuGD projects in the browser via Xpra
bgdi() {
    docker run --rm -it -p 14500:14500 \
        -v "$PWD":/workdir \
        hldtux/bennugd:r333 \
        bash -ic "bgdi \"$@\""
}
```

Then reload your shell:

```shell
source ~/.bashrc  # or ~/.zshrc
```

## 🚀 Usage

Compile and run your BennuGD projects from the current directory:

```shell
cd samples/mod_say
bgdc main.prg        # compile
bgdi main.dcb        # run in browser
```

Or in one line:

```shell
bgdc main.prg ; bgdi main.dcb
```

### 🌐 Accessing the program

After running `bgdi`, open your browser and navigate to:

```
http://localhost:14500
```

You’ll see the BennuGD window appear in the browser with full keyboard and mouse support.


### Output Example

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
  Private vars                   0
  Publics vars                   0
  Identifiers                 184
  Structs                       1
  Strings                       5 (42 bytes)

Hello World!
```

---

✅ **Notes**

* The container uses **Xpra in web mode**, so no X11 or XQuartz setup is needed on your host.
* You can run other graphical programs in the same container by passing commands:

```bash
docker run -it --rm -p 14500:14500 -v "$PWD":/workdir bennugd-xpra:r333
```