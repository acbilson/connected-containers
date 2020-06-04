FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install vim ssh -y

COPY ./setup.sh /root/setup.sh
RUN ["/bin/bash", "/root/setup.sh"]

USER controller
WORKDIR /home/controller
ENTRYPOINT ["tail", "-f", "/dev/null"]
