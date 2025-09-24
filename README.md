# Info
Head tracker running inside a docker container.
* [dockers](dockers/README.md) folder contains docker images, to be built 1st.
* [setups](setups/README.md)folder contains different head-tracker setups.
A certain ***setup*** is what to be run, an actual head-tracker setup.




# Prerequisites
* Ubuntu 24.04 as host OS
* docker and docker-compose




## Install docker and docker-compose
Clone repository with setup scripts:
```
git clone https://github.com/donDonald/dev_factory_tools
```

Install docker:
```
cd dev_factory_tools
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




# Start generally working opentrack+aitrack setup.
