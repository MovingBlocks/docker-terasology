FROM ubuntu:18.04
MAINTAINER Marcel Otte <qwc+docker@mmo.to>

ARG TERASOLOGY_OMEGA_URL
ARG TERASOLOGY_BUILD

RUN apt-get update \
    && apt-get install -y openjdk-11-jre wget unzip \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /terasology \
    if [ " ${TERASOLOGY_OMEGA_URL}" == " " ]; then \
        if [ " ${TERASOLOGY_BUILD}" == " stable" ]; then \
            TERASOLOGY_OMEGA_URL=http://jenkins.terasology.org/job/DistroOmegaRelease/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip \
        else \
            TERASOLOGY_OMEGA_URL=http://jenkins.terasology.org/job/DistroOmega/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip \
        fi \
    fi \
    && wget -P /terasology ${TERASOLOGY_OMEGA_URL} \
    && unzip /terasology/TerasologyOmega.zip -d /terasology \
    && rm -f /terasology/TerasologyOmega.zip

ENTRYPOINT cd /terasology && java -jar /terasology/libs/Terasology.jar -headless -homedir=/terasology/server
VOLUME /terasology/server
EXPOSE 25777
