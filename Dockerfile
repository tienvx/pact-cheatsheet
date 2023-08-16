# syntax=docker/dockerfile:1.4

# ========= BUILD =========
FROM python:3-alpine as build

COPY --link . .

WORKDIR /slides

RUN apk add git

RUN python -m pip install git+https://gitlab.com/da_doomer/markdown-slides.git
RUN mdslides --include /slides/pact/src/media --output_dir /output/pact /slides/pact/src/presentation.md

# ========= RUN =========
FROM caddy:2-alpine

COPY --link --from=build /output /public

EXPOSE 80

CMD [ "caddy", "file-server", "--root", "/public", "--listen", ":80" ]
