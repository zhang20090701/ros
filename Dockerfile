FROM ubuntu:latest

RUN apt-get update && apt-get install -y x11vnc firefox

# 添加 Cpolar 的内网穿透
RUN apt-get install -y curl
RUN curl -sSL https://get.cpolar.com | bash

ENV CPOLAR_TOKEN=NzE4NDQ5ZDctNjM4OS00YmE0LTkwNTItMWJmOTkyYjU5OTk1

EXPOSE 5900

CMD ["x11vnc", "-forever", "-display", ":0"]
