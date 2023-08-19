# Slides

A collection of slides.

## Run

```shell
docker run --rm --name=tienvx-slides -p '8000:80' tienvx/slides
```

Go to http://localhost:8000/[NAME]

[NAME] can be:
- pact

## Build

```shell
DOCKER_BUILDKIT=1 docker build -t my/slides .
docker run --rm --name my-slides -p '8000:80' my/slides
```

## Develop

Install:

```shell
python3 -m pip install git+https://gitlab.com/da_doomer/markdown-slides.git
```

### Pact

#### Build

```shell
./slides/pact/build.sh
```

#### Links

* [Source](./slides/pact/src/presentation.md)
* [Media](./slides/pact/src/media)
* [Presentation](./output/pact/index.html)
