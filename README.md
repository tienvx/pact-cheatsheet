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

### Pact

#### Install mdslides

```shell
pip install setuptools --break-system-packages
pip install git+https://gitlab.com/da_doomer/markdown-slides.git --break-system-packages
sudo ln -s /home/(whoami)/.local/bin/mdslides /usr/local/bin/mdslides
```

#### Build

```shell
./slides/pact/build.sh
```

#### Links

* [Source](./slides/pact/src/presentation.md)
* [Media](./slides/pact/src/media)
* [Presentation](./output/pact/index.html)
