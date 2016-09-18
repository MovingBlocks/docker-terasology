#!/bin/bash


wget http://jenkins.terasology.org/job/TerasologyStable/lastSuccessfulBuild/artifact/build/resources/main/org/terasology/version/versionInfo.properties

source versionInfo.properties

 docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

TAGNAME=$engineVersion-$displayVersion

docker build -t qwick/terasology:$TAGNAME .

docker push qwick/terasology:$TAGNAME
