FROM ubuntu:latest as 
WORKDIR /opt/app

RUN apt-get update && apt-get install -y \
npm \ 
wget \ 
wkhtmlopdf \ 
&& tm -rf /var/lib/apt/lists/*

COPY src src
COPY scripts scripts 
COPY .env .env

FROM builder as
...

FROM busybox
WORDIR /opt/app
COPY --from=build /opt/app/build/cv.html . 
VOLUME /opt/app/