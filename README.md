# GnuCOBOL Unofficial Docker images

## Motivation

I lost a bet with coworker and had to create
a simple application in COBOL.
I created this image to avoid need to install
it on my machine.

## Usage

The code in `latest` tag (`debian/apt.Dockerfile`) tag is really
simple- it just installs prebuilt package using `apt-get`.
You may want to consider using code from this Dockerfile
in your application in some cases.

If you want to use my image anyway, you can extend this
image in you Dockerfile:

```Dockerfile
FROM kuskoman/gnucobol:latest

# other stuff
```

or mount volumes and exec commands in container

```sh
docker run -v something:something kuskoman/gnucobol:latest cobc <something>
```
