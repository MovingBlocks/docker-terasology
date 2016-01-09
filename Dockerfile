FROM ubuntu:15.10
MAINTAINER Marcel Otte <qwc+docker@mmo.to>
RUN apt-get update && apt-get install -y openjdk-8-jre wget unzip
#RUN apt-get install -y wget unzip
RUN mkdir /terasology
RUN wget -P /terasology http://jenkins.terasology.org/job/DistroOmegaRelease/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip
RUN unzip /terasology/TerasologyOmega.zip -d /terasology
ENTRYPOINT java -jar /terasology/libs/Terasology.jar -headless -homedir=/terasology/server
VOLUME /terasology/server
EXPOSE 25777
