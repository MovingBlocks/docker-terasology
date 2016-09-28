#!/bin/bash


wget http://jenkins.terasology.org/job/Terasology/lastSuccessfulBuild/artifact/build/resources/main/org/terasology/version/versionInfo.properties

source versionInfo.properties

 docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

TAGNAME=$engineVersion-$displayVersion
echo The dev-latest build is: $TAGNAME
TAGNAME=dev-latest

docker build --no-cache -t qwick/terasology:$TAGNAME .

NEW_TAGNAME=dev-$engineVersion-$buildNumber

docker tag qwick/terasology:$TAGNAME qwick/terasology:$NEW_TAGNAME

docker push qwick/terasology:$TAGNAME
docker push qwick/terasology:$NEW_TAGNAME
