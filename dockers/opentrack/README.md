# Info
opentrack running inside a docker container.\
opentrack is built from sources.\
Therefor here are 2 docker images shall be built 1st:
* builder image, an image for ***building*** opentrack sources into some build-artefacts.
* run-time image, an image for ***running*** i.e. run-time image running previously made build-artefacts.

4(four) steps shall be made to run opentrack:
* Build builder image
* Build opentrack sources into build-artefacts
* Build run-time image
* Start run-time image(start opentrack itself)




## Build builer image
```
bash ./build-builder.sh
```
As result here is a bulder shall appear:
```
docker image ls | grep opentrack
opentrack-builder    latest    ceda0c9e33d7   57 seconds ago   2.37GB
opentrack-builder    v1.0      ceda0c9e33d7   57 seconds ago   2.37GB
```




## Build opentrack sources into build-artefacts

Start building opentrack sources.
```
bash ./run-builder.sh 
Cloning into 'opentrack'...
remote: Enumerating objects: 45269, done.
remote: Counting objects: 100% (1032/1032), done.
remote: Compressing objects: 100% (360/360), done.
remote: Total 45269 (delta 861), reused 672 (delta 672), pack-reused 44237 (from 3)
Receiving objects: 100% (45269/45269), 243.81 MiB | 9.72 MiB/s, done.
Resolving deltas: 100% (33086/33086), done.
Updating files: 100% (1055/1055), done.
Note: switching to 'opentrack-2024.1.1'.
...
...
...
./share/doc/opentrack/README.md
./share/opentrack/
./share/opentrack/i18n/
./share/opentrack/i18n/zh_CN.qm
./share/opentrack/i18n/nl_NL.qm
./share/opentrack/i18n/stub.qm
./share/opentrack/i18n/ru_RU.qm
```

As resut here a tar-ball containing build-artefacts shall appear in ***files*** directory:
```
ls -Al files/opentrack-opentrack-2024.1.1-bin.tar.gz
-rw-rw-r-- 1 ptaranov ptaranov 45183469 Sep 24 16:32 files/opentrack-opentrack-2024.1.1-bin.tar.gz
```




## Build run-time image
```
bash ./build.sh
```
As result here is a run-time shall appear:
```
docker image ls | grep opentrack
opentrack-opentrack-2024.1.1   latest    d2c418753fe9   53 seconds ago   2.17GB
opentrack                      latest    d2c418753fe9   53 seconds ago   2.17GB
opentrack                      v1.0      d2c418753fe9   53 seconds ago   2.17GB
opentrack-builder              latest    ceda0c9e33d7   16 minutes ago   2.37GB
opentrack-builder              v1.0      ceda0c9e33d7   16 minutes ago   2.37GB
```




## Start run-time image(start oprntrack itself)
```
bash ./run.sh
```
You will be prompted for super user password.\
Mandatory for X server permissions setup.

The opentrack shall appear on the screen.
<p align="center"><img width="100%" src="images/Screenshot from 2025-09-24 16-42-15.png"></p>
