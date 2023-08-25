# aaos-test
Building script for Android Automotive OS [AAOS]


## Ubuntu Install & Configuration 

### Hardware requirements

Your development workstation should meet or exceed these hardware requirements:

A 64-bit environment is required for Android 2.3.x (Gingerbread) and higher versions, including the master branch. You can compile older versions on 32-bit systems.

At least 250GB of free disk space to check out the code and an extra 150 GB to build it. If you conduct multiple builds, you need additional space.

At least 16 GB of available RAM is required, but Google recommends 64 GB.

In this case

```
AMD® Ryzen 5 3600 6-core processor × 12 (threads)
32 GB Ram DDR 4 2666 mhz
Graphics NVidia 8GB 
HD 1T SSD SATA 3 (~650GB free space)
```

Software

```
SO: Ubuntu 22.04.1 LTS type 64 bit
GNome version 42.4
Windowing System X11
gcc version 11.2.0
git version 2.34.1
JAVA (The Open JDK comes prebuilt with AOSP, so no need to install it separately)
OpenJDK 11.0.16 2022-07-19
Android Studio
Android Studio Chipmunk | 2021.2.1 Patch 2
Android Gradle Plugin version: 7.2.2
Gradle version: 7.3.3

Reference: https://source.android.com/docs/setup/start/requirements#hardware-requirements
```

System Setup

Install git 
```bash
sudo apt update
sudo apt install git
git --version
```

Install gcc 
```bash
$ sudo apt update
$ sudo apt install build-essential
$ gcc –version 
```

### Installing Required Packages

These packages are required according to AOSP guide 

Install: 

```bash
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig 
```

Then

```bash
sudo apt update
sudo apt upgrade
```

### Download the source code 

First create the work directory, in the home or where you feel more comfortable, then go there

```bash
mkdir aosp11 && cd aosp11
```

Config your git user & email

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Installing Repo (python utility):

```bash
sudo apt-get update
sudo apt-get install repo
```

After installation, verify that repo version 
Repo version 

You will see something similar to this

```bash
<repo not installed>
repo launcher version 2.15
(from /usr/bin/repo)
```

Downloading the source code by initializing the repo tool on aosp11 directory:
```bash
repo init -u https://android.googlesource.com/platform/manifest -b master [or tag branch]
```

In this case, I used this one:
```bash
repo init -u https://android.googlesource.com/platform/manifest -b android-11.0.0_r17
```

During repo init, if you face any python related issues like /usr/bin/env: ‘python’: No such file or directory then to fix it run the following command.

```bash
sudo ln -s /usr/bin/python3 /usr/bin/python
```

After some time, you should see a message “Enable color display in this user account?” Select y and press enter
You should see this message
```bash
repo has been initialized in /home/user/aosp11 
```
which confirms that you have initialized the repo. Then run:

```bash
repo sync
```

It will start the download android open source project process, it will take some time (a couple of hours or maybe more), I recommend using wired connection.

References:  	https://source.android.com/docs/setup/download
https://source.android.com/docs/setup/download/downloading

# Emulator build

## Build the source code 
Open terminal go to the repo dir (aosp11 or the name that you given) execute

```bash
source build/envsetup.sh
lunch
``````
