FROM openjdk:12-alpine


RUN mkdir /app
WORKDIR /app
RUN wget https://updates.clipsal.com/ClipsalSoftwareDownload/mainsite/cis/technical/CGate/cgate-2.11.4_3251.zip -O /tmp/cgate.zip && \
    unzip /tmp/cgate.zip && \
    rm /tmp/cgate.zip && \
    rm /app/cgate/tag/* && \
    echo "remote 10.255.255.255 Program" >> /app/cgate/config/access.txt

WORKDIR /app/cgate

CMD ["java","-Djava.library.path=.","-jar","cgate.jar"]
