FROM ubuntu:latest

RUN apt-get update && apt-get install -y x11vnc firefox

EXPOSE 5900

CMD ["x11vnc", "-forever", "-display", ":0", "-vncencrypt", "aes256"]
