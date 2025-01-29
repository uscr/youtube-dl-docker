# youtube-dl-docker

Dockerized version of https://github.com/ytdl-org/youtube-dl

Contact me: [@uscr0](https://t.me/uscr0)

Origin of this repo: [gitlab.uscr.ru/youtube-dl-docker](https://gitlab.uscr.ru/public-projects/youtube-dl-docker)

# How to use

docker build -t ytdl .
# List formats
docker run -it --rm ytdl -F URL
# Download video in selected format (122 as example)
docker run -it --rm -v `pwd`:/dl ytdl -o '/dl/%(title)s.%(ext)s' -f 122 URL
# Download video in selected format (122 as example)
docker run -it --rm -v `pwd`:/dl ytdl -o '/dl/%(title)s.%(ext)s' -f 140 URL
# Glue it
ffmpeg -i video.mp4 -i audio.m4a -c:v copy -c:a copy video-out.mp4