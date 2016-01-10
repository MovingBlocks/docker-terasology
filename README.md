# docker-terasology

check out and build with
```docker build .```

or use the image on dockerhub:
https://registry.hub.docker.com/u/qwick/terasology/

## Small guide

Be aware that this image provides a bare terasology server, if you want to enable specific modules, you have to do this yourself.

Just bind the provided volume of the container to a local directory and edit the generated config.cfg after the first run of the container.

Best practice would be cloning this repository and using docker-compose to pull and start the image.
  1. Edit the ```docker-compose.yml``` file for the location of the volume mount.
  2. Pull the image with ```docker-compose pull```.
  3. Start it with ```docker-compose up``` and watch the output for errors.
  4. Edit the generated config.cfg at the location of the mount and proceed with  until your server runs like you want.

There may be standard configurations in the future for specific use cases, may be... ;-)

One thing's for sure, I'll keep this a little more updated after this long time of silence.

More information about terasology can be found on following sites:
* https://github.com/MovingBlocks/Terasology
* http://terasology.org/
