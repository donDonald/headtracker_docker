# Info
Aitrack-linux running inside a docker container.\
Aitrack is built from sources.\
Therefor here are 2 docker images shall be built 1st:
* builder image, an image for ***building*** Aitrack sources into some build-artefacts.
* run-time image, an image for ***running*** i.e. run-time image running previously made build-artefacts.

4(four) steps shall be made to run Aitrack:
* Build builder image
* Build Aitrack sources into build-artefacts
* Build run-time image
* Start run-time image(start Aitrack itself)




## Build builer image
```
bash ./build-builder.sh
```
As result here is a bulder shall appear:
```
docker image ls | grep aitrack
aitrack-builder                latest    2888c8cce7ee   5 minutes ago   2.11GB
aitrack-builder                v1.0      2888c8cce7ee   5 minutes ago   2.11GB
```




## Build Aitrack sources into build-artefacts

Start building Aitrack sources.
```
bash ./run-builder.sh 
Cloning into 'aitrack-linux'...
remote: Enumerating objects: 1620, done.
remote: Counting objects: 100% (563/563), done.
remote: Compressing objects: 100% (131/131), done.
remote: Total 1620 (delta 472), reused 432 (delta 432), pack-reused 1057 (from 1)
Receiving objects: 100% (1620/1620), 66.53 MiB | 10.95 MiB/s, done.
Resolving deltas: 100% (1022/1022), done.
Already on 'master'
Your branch is up to date with 'origin/master'.
Info: creating stash file /home/somebody/builder-output/aitrack-linux/.qmake.stash
Makefile:470: warning: overriding recipe for target 'qrc_Resource.cpp'
Makefile:465: warning: ignoring old recipe for target 'qrc_Resource.cpp'
...
...
...
g++ -Wl,-rpath,'$ORIGIN/../share/aitrack/lib' -Wl,-O1 -o aitrack data.o filters.o imageprocessor.o model.o PositionSolver.o Main.o CameraFactory.o CameraSettings.o OCVCamera.o Config.o UDPSender.o UpdateChecker.o presenter.o TrackerFactory.o TrackerWrapper.o ConfigWindow.o WindowMain.o HeadCalibrationWindow.o qglobalshortcut.o qglobalshortcut_x11.o qrc_Resource.o moc_UpdateChecker.o moc_ConfigWindow.o moc_HeadCalibrationWindow.o moc_WindowMain.o moc_qglobalshortcut.o   -L onnxruntime-linux-x64-1.4.0/lib -lonnxruntime -fopenmp -lopencv_stitching -lopencv_alphamat -lopencv_aruco -lopencv_barcode -lopencv_bgsegm -lopencv_bioinspired -lopencv_ccalib -lopencv_cvv -lopencv_dnn_objdetect -lopencv_dnn_superres -lopencv_dpm -lopencv_face -lopencv_freetype -lopencv_fuzzy -lopencv_hdf -lopencv_hfs -lopencv_img_hash -lopencv_intensity_transform -lopencv_line_descriptor -lopencv_mcc -lopencv_quality -lopencv_rapid -lopencv_reg -lopencv_rgbd -lopencv_saliency -lopencv_shape -lopencv_stereo -lopencv_structured_light -lopencv_phase_unwrapping -lopencv_superres -lopencv_optflow -lopencv_surface_matching -lopencv_tracking -lopencv_highgui -lopencv_datasets -lopencv_text -lopencv_plot -lopencv_ml -lopencv_videostab -lopencv_videoio -lopencv_viz -lopencv_wechat_qrcode -lopencv_ximgproc -lopencv_video -lopencv_xobjdetect -lopencv_objdetect -lopencv_calib3d -lopencv_imgcodecs -lopencv_features2d -lopencv_dnn -lopencv_flann -lopencv_xphoto -lopencv_photo -lopencv_imgproc -lopencv_core -lspdlog -pthread -lfmt -lQt5Widgets -lQt5Network -lQt5X11Extras -lQt5Gui -lQt5Core -lxcb -lXsettings-client -lX11 /usr/lib/x86_64-linux-gnu/libQt5Widgets.so /usr/lib/x86_64-linux-gnu/libQt5Gui.so /usr/lib/x86_64-linux-gnu/libQt5Core.so -lGL -lpthread   
./bin/
./bin/aitrack
./lib/
./lib/libonnxruntime.so.1.4.0
./share/
./share/aitrack/
./share/aitrack/models/
./share/aitrack/models/detection.onnx
./share/aitrack/models/lm_fast_exp1.onnx
./share/aitrack/models/lm_m.onnx
./share/aitrack/models/lm_b.onnx
./share/aitrack/models/lm_f.onnx
ptaranov@pt-swift:~/src/donDonald/headtracker_docker/images/aitrack$ git status
On branch main
Your branch is up to date with 'donDonald/main'
```

As resut here a tar-ball containing build-artefacts shall appear in ***files*** directory:
```
ls -Al files/aitrack-linux-master-bin.tar.gz
-rw-rw-r-- 1 ptaranov ptaranov 72248631 Sep 24 09:26 files/aitrack-linux-master-bin.tar.gz
```




## Build run-time image
```
bash ./build.sh
```
As result here is a run-time shall appear:
```
docker image ls | grep aitrack
aitrack-master                 latest    9153e240a053   7 minutes ago    2.01GB
aitrack                        latest    9153e240a053   7 minutes ago    2.01GB
aitrack                        v1.0      9153e240a053   7 minutes ago    2.01GB
aitrack-builder                latest    2888c8cce7ee   27 minutes ago   2.11GB
aitrack-builder                v1.0      2888c8cce7ee   27 minutes ago   2.11GB
```




## Start run-time image(start Aitrack itself)
```
bash ./run.sh
```
You will be prompted for super user password.\
Mandatory for X server permissions setup.

The Aitrack shall appear on the screen.
<p align="center"><img width="100%" src="images/Screenshot from 2025-09-24 09-50-06.png"></p>

Click ***Start tracking***
<p align="center"><img width="100%" src="images/Screenshot from 2025-09-24 09-51-57.png"></p>
