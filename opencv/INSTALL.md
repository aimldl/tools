* Draft: 2021-01-26 (Tue)

# OpenCV 설치하기



### Step 1. OpenCV dependencies 설치하기

필요한 dependencies는 아래 글을 참고했습니다. 두 글에서 설치를 권장하는 패키지의 대부분이 겹치기 때문입니다. 겹치지 않는 패키지도 포함했습니다.

Google search: ubuntu 18.04 how to install opencv

*  [Ubuntu 18.04: How to install OpenCV](https://www.pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/), 2018-05-28, pyimagesearch
  * Step 2의 OpenCV 설치는 소스코드를 이용하는 것이라 참고하지 않았습니다.
* [Ubuntu 18.04에 OpenCV 4.2.0 설치하는 방법](https://webnautes.tistory.com/1186), 2020-03-29

```bash
$ sudo apt update
$ sudo apt upgrade -y

# C/C++ compiler, make, compile option, etc.
$ sudo apt install -y build-essential cmake unzip pkg-config 

# Image I/O packages for the standard image file formats, e.g.  JPEG, PNG, TIFF, etc
$ sudo apt -y install libjpeg-dev libpng-dev libtiff-dev
$ sudo apt -y install libjasper-dev

# Video I/O Packages I/O packages for camera stream & video files
$ sudo apt install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev v4l-utils libxvidcore-dev libx264-dev

#  GStreamer for video streaming
$ sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev 

# OpenCV’s highgui module relies on the GTK library for GUI operations
$ sudo apt install -y libgtk-3-dev

# sudo apt install -y libgtk-3-dev libqt4-dev libqt5-dev

# OpenGL support
$ sudo apt install -y mesa-utils libgl1-mesa-dri libgtkgl2.0-dev libgtkglext1-dev

# Optimization of OpenCV 
$ sudo apt install -y libatlas-base-dev gfortran libeigen3-dev

# OpenCV-Python binding
# Python 3 headers & libraries
# $ python --version
# Python 3.8.5

$ sudo apt-get install -y python3-dev

# 아래 명령어를 추가했으나 이미 최신 버전이 설치되어 있었음.
$ sudo apt install -y python2.7-dev python3-dev python-numpy python3-numpy

```



### Step 2. 

```bash
$ sudo apt install -y python3-opencv
```

TODO: organize from here

Google search: ubuntu 18.04 how to install opencv

[Ubuntu 18.04에 OpenCV 4.2.0 설치하는 방법](https://webnautes.tistory.com/1186) > OpenCV 설정과 컴파일 및 설치

Other links https://linuxize.com/post/how-to-install-opencv-on-ubuntu-18-04/

https://www.pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/

```bash
$ wget https://github.com/opencv/opencv/archive/4.5.1.zip
$ wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.5.1.zip
$ unzip opencv_contrib.zip 

```
```bash
$ ls -d */
opencv-4.5.1/  opencv_contrib-4.5.1/
```

```bash
~/opencv$ ls
opencv-4.5.1  opencv_contrib-4.5.1  opencv_contrib.zip
(base) k8smaster@k8smaster-Alienware-Aurora-R7:~/opencv$ cd opencv-4.5.1/
(base) k8smaster@k8smaster-Alienware-Aurora-R7:~/opencv/opencv-4.5.1$ cd build/
(base) k8smaster@k8smaster-Alienware-Aurora-R7:~/opencv/opencv-4.5.1/build$ cmake -D CMAKE_BUILD_TYPE=RELEASE \
> -D CMAKE_INSTALL_PREFIX=/usr/local \
> -D WITH_TBB=OFF \
> -D WITH_IPP=OFF \
> -D WITH_1394=OFF \
> -D BUILD_WITH_DEBUG_INFO=OFF \
> -D BUILD_DOCS=OFF \
> -D INSTALL_C_EXAMPLES=ON \
> -D INSTALL_PYTHON_EXAMPLES=ON \
> -D BUILD_EXAMPLES=OFF \
> -D BUILD_TESTS=OFF \
> -D BUILD_PERF_TESTS=OFF \
> -D WITH_QT=OFF \
> -D WITH_GTK=ON \
> -D WITH_OPENGL=ON \
> -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.5.1/modules \
> -D WITH_V4L=ON  \
> -D WITH_FFMPEG=ON \
> -D WITH_XINE=ON \
> -D BUILD_NEW_PYTHON_SUPPORT=ON \
> -D OPENCV_GENERATE_PKGCONFIG=ON ../
```



<img src='images/opencv-homepage-releases-2021-01-25.png'>

```bash
$ cat /proc/cpuinfo | grep processor | wc -l
12
$
```

```bash
$ time make -j4
```


TODO: start from here
https://webnautes.tistory.com/1186
이제 컴파일 결과물을 설치합니다.


https://medium.com/@theairbend3r/opencv4-1-0-ubuntu-18-04-anaconda-dc427aa216d9

Download OpenCV

Google search: anaconda how to install opencv on ubuntu

https://m.blog.naver.com/PostView.nhn?blogId=jooostory&logNo=221196559703&proxyReferer=https:%2F%2Fwww.google.com%2F

conda install -c conda-forge opencv

Conda-forge opencv

https://anaconda.org/conda-forge/opencv



### Step 3. 설치 확인

```bash
$ pkg-config --modversion opencv
```

설치가 안 된 경우 `No package 'opencv' found`라고 나옵니다.

```bash
Package opencv was not found in the pkg-config search path.
Perhaps you should add the directory containing `opencv.pc'
to the PKG_CONFIG_PATH environment variable
No package 'opencv' found
$
```



Step 3. Python3 환경을 

