#/bin/bash
docker stop ntp-server
docker rm ntp-server

docker volume create ntp-server


docker build -t ntp-server .
docker run \
	--mount source=ntp-server,target=/var/docker/chrony/ \
        --name="ntp-server" \
	-p 123:123 \
	--restart=unless-stopped \
	ntp-server
