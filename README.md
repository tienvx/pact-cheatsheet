# Slides

A collection of slides.

## Build

```shell
DOCKER_BUILDKIT=1 docker build -t slides .
```

## Run

```shell
docker run -p '8000:80' slides
```

## Develop

Install:

```shell
python3 -m pip install git+https://gitlab.com/da_doomer/markdown-slides.git
```

### Pact

* [Source](./slides/pact/src/presentation.md)
* [Presentation](./output/pact/index.html)

Build:

```shell
./slides/pact/build.sh
```
