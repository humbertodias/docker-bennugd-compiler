[![Deploy](https://github.com/humbertodias/docker-bennugd-compiler/actions/workflows/deploy.yml/badge.svg)](https://github.com/humbertodias/docker-bennugd-compiler/actions/workflows/deploy.yml)

# BennuGD Compiler Docker Image

A lightweight Docker image for **cross-compiling BennuGD applications**

Docker Hub: [hldtux/bennugd-compiler](https://hub.docker.com/r/hldtux/bennugd-compiler)

## 🧩 Included Components

* [bennugd-r333-i386](https://www.bennugd.org/downloads/old/bennugd-r333-i386-linux-gnu.tar.gz)

## 🚀 How to Use

Mount your project directory and run the desired build command. eg:

#### Compile/Run

```shell
BGD_VERSION=r333
BGD_PROJECT=./samples/helloworld
docker run --rm -ti \
  -v $BGD_PROJECT:/workdir \
  hldtux/bennugd-compiler:$BGD_VERSION \
  bash -ic 'bgdc main.prg ; bgdi main.dcb'
```
Output
```
BGDC 1.0.0 (Jun 25 2016 23:17:40)
Bennu Game Development Compiler

Copyright (c) 2006-2016 SplinterGU (Fenix/BennuGD)
Copyright (c) 2002-2006 Fenix Team (Fenix)
Copyright (c) 1999-2002 Jos� Luis Cebri�n Pag�e (Fenix)


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
