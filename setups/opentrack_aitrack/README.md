# opentrack and AITrack
opentack uses AITrack as input.\
AITrack here acts as a sensor(camera) for opentrack.\
opentrack and AITrack are running in separated containers.




# Setup infrasturcture
<p align="center"><img src="images/deployment-diagram.drawio.png"></p>


AITrack's setup in mounted from ***host*** into ***container***:\
***./config/aitrack/prefs.ini:/home/somebody/prefs.ini***

opentrack 's setup in mounted from ***host*** into ***container***:\
***./config/opentrack/opentrack-2.3:/home/somebody/.config/opentrack-2.3***
***./config/opentrack/opentrack-2.3.conf:/home/somebody/.config/opentrack-2.3.conf***




# To start the setup
```
bash ./up.sh
```
Here 2 apps shall come up:
* AITrack
* opentrack
<p align="center"><img src="images/Screenshot from 2025-09-26 13-06-22.png"></p>

Click ***Start tracking*** in ***AITrack*** window.\
AITrack start video capturing and face detection.
<p align="center"><img src="images/Screenshot from 2025-09-26 13-06-29.png"></p>

Click ***Start*** in ***opentrack*** window.\
***opentrack*** receives input from AITrack and performs head trackig.
<p align="center"><img src="images/Screenshot from 2025-09-26 13-06-39.png"></p>
<p align="center"><img src="images/Screenshot from 2025-09-26 13-06-47.png"></p>
<p align="center"><img src="images/Screenshot from 2025-09-26 13-06-55.png"></p>
<p align="center"><img src="images/Screenshot from 2025-09-26 13-07-06.png"></p>




# To stop the setup
```
bash ./down.sh
