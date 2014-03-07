APM Planner

Project:
http://github.com/diydrones/apm_planner

Files:
https://github.com/diydrones/apm_planner

Credits:
http://planner2.ardupilot.com/credits-and-contributors/

Documentation:
see http://planner2.ardupilot.com


Mac OS X
===============================================================================

To build on Mac OS X (10.6 or later):

Install SDL
-----------
1) Download SDL from:  <http://www.libsdl.org/release/SDL-1.2.14.dmg>

2) From the SDL disk image, copy the `sdl.framework` bundle to `/Library/Frameworks`
   directory (if you are not an admin copy to `~/Library/Framewroks`)

Install QT
-----------
1) Download Qt 4.8.x (Does not current work with Qt5.x)

2) Double click the package installer

Build APM Planner
-----------------
1) From the terminal go to the `apm_planner` directory created when you cloned the repository.

2) Run `qmake -spec macx-g++ qgroundcontrol.pro`

3) Run `make -j8`


Linux 
===============================================================================

Building on Linux (tested against Ubuntu 13.10):

1) Install the required packages:

```
sudo apt-get install phonon libqt4-dev libqt4-opengl-dev \
 libphonon-dev libphonon4 phonon-backend-gstreamer \
 qtcreator libsdl1.2-dev libflite1 flite1-dev build-essential \
 libopenscenegraph-dev libssl-dev libqt4-opengl-dev libudev-dev 
```

2) Clone the repository in your workspace:

```
cd ~/workspace
git clone https://github.com/diydrones/apm_planner
```

3) Build APM Planner:

```
cd ~/workspace/apm_planner
qtmake-qt4 qgroundcontrol.pro
make
```

Or try `qmake qgroundcontrol.pro` if the `qtmake-qt4` command doesn't exist on your version of Ubuntu.

4) Run APM Planner:

```
./release/apmplanner2
```

5) Permanent installation (optional, if you'd like to install APM Planner in a fixed location)
 
There are two ways to do this:
a) You can build a .deb using ```scripts/LinuxBuildPackage.sh```, and then install the deb via
   ```dpkg -i ~/Documents/APMPlanner2-$NOW.deb``` (where $NOW is today's date). This should add it to
   your launcher too.

b) Alternatively, run ```sudo make install```. This will place the binary in your /bin/ folder and
   corresponding files in /share/.


Windows
===============================================================================

GNU GCC / MINGW IS UNTESTED, COULD WORK
VISUAL STUDIO 2008 / 2010 / 2013

Steps for Visual Studio 2008 / 2010 / 2013:

Windows XP/7:

1) Download and install Visual Studio from http://www.visualstudio.com/downloads/download-visual-studio-vs
   - select "Visual Studio Express 2013 for Windows Desktop"
   - or
   - select "Visual C++ 2010 Express", then make sure you install SP1

2) Download and install Qt from http://qt-project.org/downloads
   - Select "Qt Online Installer for Windows"
   - On the "Select Components" page, click the checked "Qt->Qt 5.x.x" to open it
TODO then click to select "msvc2010 32-bit"
     (or "msvc2010 32-bit OpenGL" or "msvc2012 32-bit") TODO

3) Go to the apm_planner/libs/thirdParty/libxbee and build it following the instructions in win32.README
   This step may be skipped

4) Install external dependencies
   - ?
   
5) Open the Qt Command Prompt program (should be in the Start Menu)
   - navigate to the source folder of apm_planner
   - ```qmake -tp vc qgroundcontrol.pro``` to create the Visual Studio project
   
6) Start Visual Studio and load the generated qgroundcontrol.vcproj or qgroundcontrol.vcxproj

7) Compile and edit in Visual Studio. If you need to add new files, add them to qgroundcontrol.pro
   and re-run 5)


Repository Layout
===============================================================================
```
qgroundcontrol:
	demo-log.txt
	license.txt 
	qgcunittest.pro - For the unit tests.
	qgcunittest.pro.user
	qgcvideo.pro
	qgroundcontrol.pri - Used by qgroundcontrol.pro
	qgroundcontrol.pro - Project opened in QT to run qgc.
	qgroundcontrol.pro.user 
	qgroundcontrol.qrc - Holds many images.
	qgroundcontrol.rc - line of code to point toward the images
	qserialport.pri - generated by qmake.
	testlog.txt
	testlog2.txt 
	user_config.pri.dist - Custom message specs to be added here. 
data: 
	Maps from yahoo and kinect and earth. 
deploy: 
	Install and uninstall for win32.
	Create a debian packet.
	Create .DMG file for publishing for mac.
	Audio test on mac.	
doc: 
	Doxyfile is in this directory and information for creating html documentation for qgc.
files: 
	Has the audio for the vehicle and data output. 
		ardupilotmega: 
			widgets and tool tips for pilot heading for the fixed wing.
			tooltips for quadrotor
		flightgear:
			Aircraft: 
				Different types of planes and one jeep. 
			Protocol: 
				The protocol for the fixed_wings and quadrotor and quadhil.holds info about the fixed wing yaw, roll etc. 					Quadrotor. Agian holds info about yaw, roll etc.
		Pixhawk:
			Widgets for hexarotor. Widgets and tooltips for quadrotor.
		vehicles: 
			different vehicles. Seems to hold the different kinds of aircrafts as well as files for audio and the hexarotor 			and quadrotor.
		widgets: 
			Has a lot of widgets defined for buttons and sliders.

images: 
	For the UI. Has a bunch of different images such as images for applications or actions or buttons.
lib: 
	SDL is located in this direcotry. 
	Msinttypes: 
		Defines intteger types for microsoft visual studio. 
	sdl:
		Information about the library and to run the library on different platforms. 
mavlink: 
	The files for the library mavlink. 
qgcunittest: 
	Has the unittests for qgc
settings: 
	Parameter lists for alpha, bravo and charlie. 
	Data for stereo, waypoints and radio calibrartion. 
src:
	Code for QGCCore, audio output, configuration, waypoints, main and log compressor.
	apps - Code for mavlink generation and for a video application.
	comm - Code for linking to simulation, mavlink, udp, xbee, opal, flight gear and interface.
	Has other libraries. Qwt is in directory named lib. The other libraries are in libs.
	lib - qwt library
	libs - eigen, opmapcontrol, qestserialport, qtconcurrent, utils.
	input - joystick and freenect code.
	plugins - Qt project for PIXHAWK plugins.
	uas - Ardu pilot, UAS, mavlink factory, uas manager, interface, waypoint manager and slugs.
	ui - Has code for data plots, waypoint lists and window congfiguration. All of the ui code.
thirdParty: 
	Library called lxbee.
	Library called QSerialPort.

