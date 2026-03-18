FROM python:3-slim

RUN python -c "import urllib.request; urllib.request.urlretrieve('https://github.com/ytdl-org/youtube-dl/releases/latest/download/youtube-dl', '/usr/local/bin/youtube-dl')" && \
    chmod a+rx /usr/local/bin/youtube-dl

ENTRYPOINT ["/usr/local/bin/youtube-dl"]
