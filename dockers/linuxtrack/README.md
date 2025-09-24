# Info
linuxtrack running inside a docker container.\
linuxtrack is built from sources.\
Therefor here are 2 docker images shall be built 1st:
* builder image, an image for ***building*** linuxtrack sources into some build-artefacts.
* run-time image, an image for ***running*** i.e. run-time image running previously made build-artefacts.

4(four) steps shall be made to run linuxtrack:
* Build builder image
* Build linuxtrack sources into build-artefacts
* Build run-time image
* Start run-time image(start linuxtrack itself)




## Build builer image
```
bash ./build-builder.sh
```
As result here is a bulder shall appear:
```
docker image ls | grep linuxtrack
linuxtrack-builder             latest    63976ad14e71   59 seconds ago      2.44GB
linuxtrack-builder             v1.0      63976ad14e71   59 seconds ago      2.44GB
```




## Build linuxtrack sources into build-artefacts

Start building linuxtrack sources.
```
bash ./run-builder.sh 
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

somebody@2ffe35f7e614:~$ ./build.sh 
Cloning into 'linuxtrack'...
remote: Enumerating objects: 4898, done.
remote: Counting objects: 100% (2769/2769), done.
remote: Compressing objects: 100% (542/542), done.
remote: Total 4898 (delta 2318), reused 2227 (delta 2227), pack-reused 2129 (from 1)
Receiving objects: 100% (4898/4898), 13.94 MiB | 10.23 MiB/s, done.
Resolving deltas: 100% (3871/3871), done.
Already on 'master'
Your branch is up to date with 'origin/master'.
...
...
...
./share/linuxtrack/sparow_glass.obj
./share/linuxtrack/README.xplane
./share/linuxtrack/linuxtrack_hello_world.c
./share/linuxtrack/linuxtrack_hello_world_adv.c
./share/linuxtrack/sparow_opaq.obj
./share/linuxtrack/haarcascade_frontalface_alt2.xml
./share/linuxtrack/xm8_detail.png
./share/linuxtrack/README
./share/linuxtrack/README.devel
./share/linuxtrack/sphere.png
./share/linuxtrack/win7.reg
```

As resut here a tar-ball containing build-artefacts shall appear in ***files*** directory:
```
ls -Al ./files/linuxtrack-master-bin.tar.gz 
-rw-rw-r-- 1 ptaranov ptaranov 22059199 Sep 24 18:09 ./files/linuxtrack-master-bin.tar.gz
```




## Build run-time image
```
bash ./build.sh
```
As result here is a run-time shall appear:
```
docker image ls | grep linuxtrack
linuxtrack-master              latest    f5fbfe3950f4   52 seconds ago      2.1GB
linuxtrack                     latest    f5fbfe3950f4   52 seconds ago      2.1GB
linuxtrack                     v1.0      f5fbfe3950f4   52 seconds ago      2.1GB
linuxtrack-builder             latest    63976ad14e71   14 minutes ago      2.44GB
linuxtrack-builder             v1.0      63976ad14e71   14 minutes ago      2.44GB
```











## Start run-time image(start linuxtrack itself)
```
bash ./run.sh
```
You will be prompted for super user password.\
Mandatory for X server permissions setup.

The linuxtrack shall appear on the screen.\
Some complains about missing TrackIR device and WINE setup.\
<p align="center"><img width="100%" src="images/Screenshot from 2025-09-24 18-22-08.png"></p>
<p align="center"><img width="100%" src="images/Screenshot from 2025-09-24 18-22-38.png"></p>
<p align="center"><img width="100%" src="images/Screenshot from 2025-09-24 18-22-59.png"></p>
<p align="center"><img width="100%" src="images/Screenshot from 2025-09-24 18-23-25.png"></p>
<p align="center"><img width="100%" src="images/Screenshot from 2025-09-24 18-23-47.png"></p>




# References
* [Linuxtrack repo](https://github.com/RavenX8/linuxtrack.git)
* [Linuxtrack releases](https://github.com/uglyDwarf/linuxtrack/wiki/Downloads)
