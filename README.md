[![Deploy](https://github.com/humbertodias/docker-bennugd-compiler/actions/workflows/deploy.yml/badge.svg)](https://github.com/humbertodias/docker-bennugd-compiler/actions/workflows/deploy.yml)

# BennuGD Compiler Docker Image

A lightweight Docker image for **cross-compiling BennuGD applications**

Docker Hub: [hldtux/bennugd-compiler](https://hub.docker.com/r/hldtux/bennugd-compiler)

## 🧩 Included Components

* [bennugd-r333-i386](https://www.bennugd.org/downloads/old/bennugd-r333-i386-linux-gnu.tar.gz)

## 🚀 How to Use

Mount your project directory and run the desired build command. Below are examples for each SDL version and target.

#### BennuGD 1.x

```shell
BGD_VERSION=r333
BGD_PROJECT=./samples/helloworld
docker run --rm -ti \
  -v $BGD_PROJECT:/workdir \
  hldtux/bennugd-compiler:$BGD_VERSION \
  bash -ic 'bgdc main.prg'
```