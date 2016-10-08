# docker-terasology

Automatic builds are provided by dockerhub and my own jenkins instance.
For all enthusiasts who just want to have a running server:
- `docker pull qwick/terasology:latest`
- or with version: `docker pull qwick/terasology:1.2.1-alpha`

For all developers who want a nightly build for debugging or just testing purposes:
- `docker pull qwick/terasology:unstable-latest`
- a versioned tag is available too.

Versioned tags may change over time.

## Versioning

To avoid confusion here the docker image tag schema:

Stable:
- `<engineVersion>-<displayVersion>` e.g. `1.2.1-alpha`

Unstable:
- `unstable-<engineVersion>-<buildNumber>` e.g. `unstable-1.2.2-SNAPSHOT-1806`


## Small guide

Be aware that this image provides a bare terasology server, if you want to enable specific modules, you have to do this yourself.

Just bind the provided volume of the container to a local directory and edit the generated config.cfg after the first run of the container.

Best practice would be cloning this repository and using docker-compose to pull and start the image.
  1. Edit the ```docker-compose.yml``` file for the location of the volume mount.
  2. Pull the image with ```docker-compose pull```.
  3. Start it with ```docker-compose up``` and watch the output for errors.
  4. Edit the generated config.cfg at the location of the mount and proceed with  until your server runs like you want.

There may be standard configurations in the future for specific use cases, may be... ;-)

More information about terasology can be found on following sites:
* https://github.com/MovingBlocks/Terasology
* http://terasology.org/
