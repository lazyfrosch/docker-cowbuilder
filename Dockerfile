FROM debian:stretch

RUN apt update \
 && apt install -y --no-install-recommends \
   cowbuilder \
   curl ca-certificates \
   binutils devscripts sudo \
   libwww-perl gnupg2 file fakeroot \
 && rm -rf /var/lib/apt/lists/*

RUN curl -LsS "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" > /usr/sbin/gosu \
 && chmod +x /usr/sbin/gosu

VOLUME /var/cache/pbuilder

COPY cowbuilder-auto /usr/local/sbin/cowbuilder-auto
COPY entrypoint.sh /entrypoint

ENTRYPOINT [ "/entrypoint" ]
CMD [ "cowbuilder" ]
