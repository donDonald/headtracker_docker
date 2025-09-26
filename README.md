# Info
Head tracker running inside a Docker.\
[dockers](dockers/README.md) folder contains docker images, to be built 1st.\
[setups](setups/README.md) folder contains different head-tracker setups.\
A certain ***setup*** is what to be run, an actual head-tracker setup.\
[scripts](scripts/README.md) folder contains some usefull scripts, to install Docker, etc.




# Prerequisites
* Ubuntu 24.04 as host OS




# Install docker and docker-compose
Every setup is run as Multi-Container Applications, i.e.\
all components are running as separated docker containers for sake of izolation and simplification.\
[docker](https://en.wikipedia.org/wiki/Docker_(software)) and [docker-compose](https://docs.docker.com/compose/gettingstarted/) shall be installed 1st.\
Here is a set of bash scripts in [./scripts](./scripts) folder with docker setup scripts.

Install docker:
```
cd ./scripts
sudo bash docker.install.sh
```
Check your docker version:
```
docker -v
Docker version 28.3.3, build 980b856
```

Install docker-compose:
```
sudo bash docker.compose.install.sh
```

Check your docker version:
```
docker-compose -v
Docker Compose version v2.39.1
```

Reboot PC since user groups were updated.




# Build docker images
[Build instructions](dockers/README.md)




# Start basic opentrack+aitrack setup.
[opentrack + aitrack setup](setups/opentrack_aitrack/README.md)
