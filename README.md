# ipta-docker

A repository of Dockerfiles for IPTA projects.

## `ipta-gwa`

The `ipta-gwa` image (available as `ipta/ipta-gwa:latest` at [Docker Hub](https://hub.docker.com/r/ipta/ipta-gwa/)) is intended for use gravitational wave analysis.
It includes [enterprise](https://github.com/nanograv/enterprise) and all of its dependencies in the base `conda` environment.
It also includes includes [PTMCMCSampler](https://github.com/jellis18/PTMCMCSampler) and [enterprise_extensions](https://github.com/stevertaylor/enterprise_extensions).
and has a footprint of about 3.5GB.
This image is built on the `continuumio/miniconda` image and installs `autotools` and `gnu` compilers.
The image begins in the `/home/ipta-gwa/` directory, but only has a root user.


## Quickstart for local use

* [Install Docker](https://docs.docker.com/engine/installation)
* Start Docker.
* Pull the repository and run `bash` shell in a new container (as root)
```bash
docker pull ipta/ipta-gwa:latest
docker run -it ipta/ipta-gwa:latest /bin/bash
```
* Don't forget to remove your containers (`docker ps -a; docker rm ...`) once you're done.

