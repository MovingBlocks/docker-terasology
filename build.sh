#!/bin/bash


wget http://jenkins.terasology.org/job/TerasologyStable/lastSuccessfulBuild/artifact/build/resources/main/org/terasology/version/versionInfo.properties

source versionInfo.properties

echo docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

TAGNAME=$engineVersion-$displayVersion

echo docker build -t $TAGNAME .

echo docker push qwick/terasoogy:$TAGNAME
