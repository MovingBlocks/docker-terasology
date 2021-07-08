FROM ubuntu:18.04
MAINTAINER Marcel Otte <qwc+docker@mmo.to>
RUN apt-get update && apt-get install -y openjdk-11-jre wget unzip
RUN mkdir /terasology \
    && wget -P /terasology http://jenkins.terasology.io/teraorg/job/Terasology/job/Omega/job/develop/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip \
    && unzip /terasology/TerasologyOmega.zip -d /terasology \
    && rm -f /terasology/TerasologyOmega.zip
ENTRYPOINT cd /terasology && java -Dterasology_variant=unstable -jar /terasology/libs/Terasology.jar -headless -homedir=/terasology/server -installPath=/terasology
VOLUME /terasology/server
EXPOSE 25777
