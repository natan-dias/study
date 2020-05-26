# Drupal and Postgres example with Docker-Compose

SOURCE: Docker Mastery Course from Docker Captain Bret Fisher

This example shows how I got this assignment with DOCKERFILE and DOCKER-COMPOSE.

## Dockerfile
- `FROM drupal:8.6` NOTE: if it fails to build, try the lastest 8 branch version with `FROM drupal:8`;
- RUN `apt-get update && apt-get install -y git`, to install updates and git;
- RUN `rm -rf /var/lib/apt/lists/*`, this is a best pratice to docker images and dockerfiles, that helps to keep image with small sizes;
- Then change `WORKDIR /var/www/html/themes`
- RUN `git clone --branch 8.x-3.x --single-branch --depth 1 https://git.drupal.org/project/bootstrap.git`;
- RUN `chown -R www-data:www-data bootstrap`;
- WORKDIR `/var/www/htm`, do this only to safe.

OBS: I used \ and && to connect lines. This is also a best pratice for DOCKERFILE.

## Compose File

I used a compose file template for this. You can change at will.

IMPORTANT

- Enviroment `POSTGRES_PASSWORD` is required;
- I made volumes to prevent lose data;
- Image name is not required;
- I made a Build with dockerfile;
- I used postgres 9.6, but you can change that.
- At Drupal configuration, you need to change POSTGRES enviroment, because localhost is already in use by WS.

