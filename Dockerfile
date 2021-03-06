FROM amazonlinux:2

RUN yum -y install curl nano nload top screen git ps wget tar bzip2 gzip unzip python3 binutils bc jq tmux glibc.i686 libstdc++ libstdc++.i686 \
    shadow-utils util-linux file nmap-ncat iproute SDL2.i686 SDL2.x86_64 \
    && yum -y update --security

RUN useradd louis
WORKDIR /home/louis
USER louis

RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && tar -xzf steamcmd_linux.tar.gz \
    && rm steamcmd_linux.tar.gz && ./steamcmd.sh +quit
RUN mkdir -p .steam/sdk32/ && ln -s ~/linux32/steamclient.so ~/.steam/sdk32/steamclient.so \
    && mkdir -p .steam/sdk64/ && ln -s ~/linux64/steamclient.so ~/.steam/sdk64/steamclient.so
RUN git clone https://github.com/fantasylidong/AnneServer.git
RUN git clone https://github.com/fantasylidong/neko.git
RUN git clone https://github.com/fantasylidong/hardneko.git
RUN git clone https://github.com/fantasylidong/L4D2-Competitive-Rework.git

EXPOSE 2334/tcp
EXPOSE 2334/udp
EXPOSE 2333/tcp
EXPOSE 2333/udp
EXPOSE 27015/tcp
EXPOSE 27015/udp
EXPOSE 2335/tcp
EXPOSE 2335/udp
EXPOSE 2336/tcp
EXPOSE 2336/udp

ENV PORT=2333 \
    PLAYERS=8 \
    MAP="c2m1_highway" \
    REGION=255 \
    HOSTNAME="leo fighting" \
    plugin="anne" \
	steamid="STEAM_1:1:121430603" \
	index="first" \
	password="123456" \
	steamgroup="25622692,26419628"

ADD entrypoint.sh entrypoint.sh
ENTRYPOINT ./entrypoint.sh
