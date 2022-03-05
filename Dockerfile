FROM openjdk:8u322-slim-bullseye

RUN mkdir /app
WORKDIR /app
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://updates.clipsal.com/ClipsalSoftwareDownload/mainsite/cis/technical/CGate/cgate-2.11.4_3251.zip -O /tmp/cgate.zip && \
    unzip /tmp/cgate.zip && \
    rm /tmp/cgate.zip && \
    rm /app/cgate/tag/* && \
    echo "remote 10.255.255.255 Program" >> /app/cgate/config/access.txt && \
    apt-get remove -y wget unzip && \
    apt-get purge && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /app/cgate

CMD ["java","-Djava.library.path=.","-jar","cgate.jar"]
