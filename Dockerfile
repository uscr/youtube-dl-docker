FROM ubuntu:24.10 as builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y git make zip python3 pandoc && \
    apt -y clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/* /etc/apt/keyrings
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git clone https://github.com/ytdl-org/youtube-dl
WORKDIR /youtube-dl
RUN make install

FROM ubuntu:24.10

COPY --from=builder /usr/local/bin/youtube-dl /usr/local/bin/youtube-dl

ENTRYPOINT ["/usr/local/bin/youtube-dl"]