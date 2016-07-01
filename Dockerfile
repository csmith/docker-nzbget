FROM alpine:3.3
MAINTAINER Chris Smith <chris87@gmail.com>

RUN apk add --no-cache --virtual=build-dependencies wget ca-certificates 
RUN wget https://github.com/nzbget/nzbget/releases/download/v17.0-r1726/nzbget-17.0-testing-r1726-bin-linux.run -O nzbget.run \
	&& sh nzbget.run \
	&& rm nzbget.run

VOLUME /destination
VOLUME /maindir
VOLUME /config

EXPOSE 6789

ADD nzbget.sh /nzbget.sh

ENTRYPOINT /nzbget.sh
