그런데 파일명이 다르네요. 

[cuDNN Library for Linux](https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.4.2/prod/10.0_20181213/cudnn-10.0-linux-x64-v7.4.2.24.tgz)

를 클릭하니 동일한 파일인 `cudnn-10.0-linux-x64-v7.4.2.24.tgz`를 다운로드 받습니다.



(base) aimldl@aimldl-home-desktop:~$ docker login
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /home/aimldl/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
(base) aimldl@aimldl-home-desktop:~$ docker pull nvidia/cuda:10.0-devel-ubuntu18.04
(base) aimldl@aimldl-home-desktop:~$ docker run -it --gpus all nvidia/cuda:10.0-devel-ubuntu18.04 bash
root@67315ceb667f:/# cd home/
root@67315ceb667f:/home# mkdir user
root@67315ceb667f:/home# cd user/
root@67315ceb667f:/home/user# mkdir downloads
root@67315ceb667f:/home/user# 

(base) aimldl@aimldl-home-desktop:~$ ls
AUTO_INSTALL  cuda-repo-ubuntu1804_10.0.130-1_amd64.deb  hello-kf-                             kubeflow_first_project                       yolov3    사진
Documents     cudnn-10.0-linux-x64-v7.4.2.24.tgz         install_atom-ubuntu_linux             libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb  공개      음악
Dropbox       darknet                                    install_docker_on_ubuntu              libcudnn7-doc_7.4.2.24-1+cuda10.0_amd64.deb  다운로드  템플릿
anaconda3     docker_with_yolov                          install_kubeflow                      libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb      문서
bin           examples.desktop                           install_nvidia_docker_on_ubuntu       opencv_contrib-4.5.1                         바탕화면
build         github                                     kfctl_v1.0.1-0-gf3edb9b_linux.tar.gz  pipelines                                    비디오
(base) aimldl@aimldl-home-desktop:~$ docker cp cudnn-10.0-linux-x64-v7.4.2.24.tgz infallible_rhodes:/home/user/downloads
(base) aimldl@aimldl-home-desktop:~$ docker attach infallible_rhodes
root@67315ceb667f:/home/user/downloads# ls
cudnn-10.0-linux-x64-v7.4.2.24.tgz
root@67315ceb667f:/home/user/downloads# tar -xzvf cudnn-10.0-linux-x64-v7.4.2.24.tgz
cuda/include/cudnn.h
cuda/NVIDIA_SLA_cuDNN_Support.txt
cuda/lib64/libcudnn.so
cuda/lib64/libcudnn.so.7
cuda/lib64/libcudnn.so.7.4.2
cuda/lib64/libcudnn_static.a
root@67315ceb667f:/home/user/downloads# cp -P cuda/include/cudnn.h /usr/local/cuda-10.0/include
root@67315ceb667f:/home/user/downloads# cp -P cuda/lib64/libcudnn* /usr/local/cuda-10.0/lib64/
root@67315ceb667f:/home/user/downloads# chmod a+r /usr/local/cuda-10.0/lib64/libcudnn*
root@67315ceb667f:/home/user/downloads# cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
#define CUDNN_MAJOR 7
#define CUDNN_MINOR 4
#define CUDNN_PATCHLEVEL 2
--
#define CUDNN_VERSION (CUDNN_MAJOR * 1000 + CUDNN_MINOR * 100 + CUDNN_PATCHLEVEL)

#include "driver_types.h"
root@67315ceb667f:/home/user/downloads# 


# apt update
# apt install -y git

https://github.com/aimldl/tools/blob/main/yolo/v3/install/2-prepare_darknet_on_baseimage.md

CPU Only version
# git clone https://github.com/pjreddie/darknet.git
# cd darknet/
# make

yolov3.weights 파일을 복사
# read escape sequence
(base) aimldl@aimldl-home-desktop:~$ docker ps
CONTAINER ID        IMAGE                                COMMAND             CREATED             STATUS              PORTS               NAMES
67315ceb667f        nvidia/cuda:10.0-devel-ubuntu18.04   "bash"              7 minutes ago       Up 7 minutes                            infallible_rhodes
(base) aimldl@aimldl-home-desktop:~$ docker cp yolov3.weights infallible_rhodes:/home/user/darknet
(base) aimldl@aimldl-home-desktop:~$ docker attach infallible_rhodes
root@67315ceb667f:/home/user/darknet# 


# ./darknet detect cfg/yolov3.cfg yolov3.weights data/dog.jpg

Loading weights from yolov3.weights...Done!
data/dog.jpg: Predicted in 20.008677 seconds.
dog: 100%
truck: 92%
bicycle: 99%
root@67315ceb667f:/home/user/darknet# 


# apt install -y nano


# nano Makefile  
GPU=1
CUDNN=0
OPENCV=0
OPENMP=0
DEBUG=0

# make
#

# # ./darknet detect cfg/yolov3.cfg yolov3.weights data/dog.jpg
  ...
Loading weights from yolov3.weights...Done!
data/dog.jpg: Predicted in 0.178809 seconds.
dog: 100%
truck: 92%
bicycle: 99%
root@67315ceb667f:/home/user/darknet# 



https://github.com/aimldl/tools/blob/main/yolo/v3/install/5-prepare_cudnn_for_darknet.md


# nano Makefile  
GPU=1
CUDNN=1
OPENCV=0
OPENMP=0
DEBUG=0

# make
#

# ./darknet detect cfg/yolov3.cfg yolov3.weights data/dog.jpg
CUDA Error: out of memory
darknet: ./src/cuda.c:36: check_error: Assertion `0' failed.
Aborted (core dumped)
#


https://github.com/aimldl/tools/blob/main/yolo/v3/install/4-prepare_opencv_for_darknet.md


install_opencv_contrib_without_sudo


# nano Makefile 
GPU=1
CUDNN=0
OPENCV=1
OPENMP=0
DEBUG=0

https://github.com/aimldl/tools/blob/main/yolo/v3/bash_scripts/install_opencv_contrib_without_sudo#L10

root@67315ceb667f:/home/user/darknet# nano install_opencv_contrib_without_sudo
root@67315ceb667f:/home/user/darknet# chmod +x install_opencv_contrib_without_sudo 
root@67315ceb667f:/home/user/darknet# ./install_opencv_contrib_without_sudo 


https://github.com/aimldl/tools/blob/main/yolo/v3/bash_scripts/install_opencv_dependencies_without_sudo

# nano install_opencv_dependencies_without_sudo
# chmod +x install_opencv_dependencies_without_sudo
# ./install_opencv_dependencies_without_sudo


https://github.com/aimldl/tools/blob/main/yolo/v3/install/4-prepare_opencv_for_darknet.md

# python3 -c 'import cv2; print(cv2.__version__)'
# pkg-config --modversion opencv


