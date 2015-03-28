FROM ubuntu:14.04
MAINTAINER Marcel Otte <qwc+docker@mmo.to>
RUN apt-get update && apt-get install -y openjdk-7-jre-headless
RUN apt-get install -y wget unzip
RUN mkdir /terasology
#RUN wget -P /terasology http://jenkins.terasology.org/job/TerasologyStable/lastSuccessfulBuild/artifact/build/distributions/Terasology.zip
RUN wget -P /terasology http://jenkins.terasology.org/job/DistroOmega/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip
RUN unzip /terasology/Terasology.zip -d /terasology
ENTRYPOINT java -jar /terasology/libs/Terasology.jar -headless -homedir=/terasology/server
VOLUME /terasology/server
EXPOSE 25777
