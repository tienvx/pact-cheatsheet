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

### Install mdslides

```shell
pip install setuptools --break-system-packages
pip install git+https://gitlab.com/da_doomer/markdown-slides.git --break-system-packages
sudo ln -s /home/(whoami)/.local/bin/mdslides /usr/local/bin/mdslides
```

### Install plantuml

```shell
sudo apt install default-jre-headless
wget https://github.com/plantuml/plantuml/releases/download/v1.2024.7/plantuml-mit-1.2024.7.jar
sudo mv plantuml-mit-1.2024.4.jar /usr/local/bin/plantuml.jar
sudo vim /usr/local/bin/plantuml
sudo chmod +x /usr/local/bin/plantuml
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
