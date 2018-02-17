FROM ubuntu:latest
LABEL maintainer="Daniel Ståhl"

RUN apt-get update && apt-get -y install chrony
ADD chrony.conf /etc/chrony.conf
RUN chmod ugo+r /etc/chrony.conf

EXPOSE 123/tcp \
       123/udp


CMD ["chronyd", "-d"]
