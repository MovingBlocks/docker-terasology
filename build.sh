#!/bin/bash

rm versionInfo.properties*

wget http://jenkins.terasology.org/job/TerasologyStable/lastSuccessfulBuild/artifact/build/resources/main/org/terasology/version/versionInfo.properties

source versionInfo.properties

 docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

TAGNAME=$engineVersion-$displayVersion

docker build --no-cache -t qwick/terasology:$TAGNAME .

NEW_TAGNAME=latest

docker tag qwick/terasology:$TAGNAME qwick/terasology:$NEW_TAGNAME

docker push qwick/terasology:$TAGNAME
docker push qwick/terasology:$NEW_TAGNAME
