# youtube-dl-docker

Dockerized version of https://github.com/ytdl-org/youtube-dl

Contact me: [@uscr0](https://t.me/uscr0)

Origin of this repo: [gitlab.uscr.ru/youtube-dl-docker](https://gitlab.uscr.ru/public-projects/youtube-dl-docker)

# How to use

## Pre-built image

```sh
# List formats
docker run -it --rm registry.uscr.ru/public-projects/youtube-dl-docker:latest -F URL
# Download video in selected format
docker run -it --rm -v `pwd`:/dl registry.uscr.ru/public-projects/youtube-dl-docker:latest -o '/dl/%(title)s.%(ext)s' -f 140 URL
# Download audio in selected format
docker run -it --rm -v `pwd`:/dl registry.uscr.ru/public-projects/youtube-dl-docker:latest -o '/dl/%(title)s.%(ext)s' -f 122 URL
```

## Glue video and audio

```sh
ffmpeg -i video.mp4 -i audio.m4a -c:v copy -c:a copy video-out.mp4
```

## Build locally

```sh
docker build -t ytdl .
# List formats
docker run -it --rm ytdl -F URL
# Download video in selected format (122 as example)
docker run -it --rm -v `pwd`:/dl ytdl -o '/dl/%(title)s.%(ext)s' -f 122 URL
# Download audio in selected format (140 as example)
docker run -it --rm -v `pwd`:/dl ytdl -o '/dl/%(title)s.%(ext)s' -f 140 URL
```
