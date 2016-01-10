FROM ubuntu:15.10
MAINTAINER Marcel Otte <qwc+docker@mmo.to>
RUN apt-get update && apt-get install -y openjdk-8-jre wget unzip
RUN mkdir /terasology \
    && wget -P /terasology http://jenkins.terasology.org/job/DistroOmega/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip \
    && unzip /terasology/TerasologyOmega.zip -d /terasology \
    && rm -f /terasology/TerasologyOmega.zip
ENTRYPOINT java -jar /terasology/libs/Terasology.jar -headless -homedir=/terasology/server
VOLUME /terasology/server
EXPOSE 25777
