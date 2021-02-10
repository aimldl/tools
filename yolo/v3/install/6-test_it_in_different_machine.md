* Draft: 2021-02-10 (We

#

```bash
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ docker images
REPOSITORY          TAG                    IMAGE ID            CREATED             SIZE
nvidia/cuda         11.0-base-driver-455   0f98611c048c        9 days ago          3.26GB
nvidia/cuda         10.1-base              6fa731bcd2fd        8 weeks ago         105MB
nvidia/cuda         11.0-base              2ec708416bb8        5 months ago        122MB
hello-world         latest                 bf756fb1ae65        13 months ago       13.3kB
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ docker import baseimage-darknet_ver0_3.tar 
sha256:2ebc9269e56c969b77cc5d699d08c475afa9364701f29829db8edace835a01b5
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ docker images
REPOSITORY          TAG                    IMAGE ID            CREATED             SIZE
<none>              <none>                 2ebc9269e56c        58 seconds ago      10.2GB
nvidia/cuda         11.0-base-driver-455   0f98611c048c        9 days ago          3.26GB
nvidia/cuda         10.1-base              6fa731bcd2fd        8 weeks ago         105MB
nvidia/cuda         11.0-base              2ec708416bb8        5 months ago        122MB
hello-world         latest                 bf756fb1ae65        13 months ago       13.3kB
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ 

(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ 
```
이름이 없으므로 tag로 rename합니다.

```bash
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ docker tag 2ebc9269e56c aimldl/baseimage-darknet:ver0.3
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ docker images
REPOSITORY                 TAG                    IMAGE ID            CREATED             SIZE
aimldl/baseimage-darknet   ver0.3                 2ebc9269e56c        3 minutes ago       10.2GB
nvidia/cuda                11.0-base-driver-455   0f98611c048c        9 days ago          3.26GB
nvidia/cuda                10.1-base              6fa731bcd2fd        8 weeks ago         105MB
nvidia/cuda                11.0-base              2ec708416bb8        5 months ago        122MB
hello-world                latest                 bf756fb1ae65        13 months ago       13.3kB
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ 
```

이미지에서 컨테이너를 만듭니다.

```bash
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ docker run -it --gpus all aimldl/baseimage-darknet bash
Unable to find image 'aimldl/baseimage-darknet:latest' locally
docker: Error response from daemon: manifest for aimldl/baseimage-darknet:latest not found: manifest unknown: manifest unknown.
See 'docker run --help'.
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ docker run -it --gpus all aimldl/baseimage-darknet:ver0.3 bash
root@cc284448a358:/# 
```

컨테이너 내용을 확인합니다.
```bash
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ docker run -it --gpus all aimldl/baseimage-darknet:ver0.3 bash
root@cc284448a358:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@cc284448a358:/# cd /home/user/darknet/
root@cc284448a358:/home/user/darknet# ls
LICENSE       LICENSE.gpl   LICENSE.v1  backup  darknet   include                      jasper-version-2.0.16         obj            opencv_contrib-master  python   src
LICENSE.fuck  LICENSE.meta  Makefile    build   data      install_opencv_contrib       jasper-version-2.0.16.tar.gz  opencv-master  opencv_contrib.zip     results  yolov3.weights
LICENSE.gen   LICENSE.mit   README.md   cfg     examples  install_opencv_dependencies  libdarknet.a                  opencv.zip     predictions.jpg        scripts
root@cc284448a358:/home/user/darknet# head Makefile 
GPU=1
CUDNN=0
OPENCV=1
OPENMP=0
DEBUG=0

#ARCH= -gencode arch=compute_30,code=sm_30 \
ARCH= -gencode arch=compute_35,code=sm_35 \
      -gencode arch=compute_50,code=[sm_50,compute_50] \
      -gencode arch=compute_52,code=[sm_52,compute_52]
root@cc284448a358:/home/user/darknet# 
```

에러를 재생산합니다.
```bash
root@cc284448a358:/home/user/darknet# make
gcc -Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors -fPIC -Ofast -DOPENCV -DGPU -shared obj/gemm.o obj/utils.o obj/cuda.o obj/deconvolutional_layer.o obj/convolutional_layer.o obj/list.o obj/image.o obj/activations.o obj/im2col.o obj/col2im.o obj/blas.o obj/crop_layer.o obj/dropout_layer.o obj/maxpool_layer.o obj/softmax_layer.o obj/data.o obj/matrix.o obj/network.o obj/connected_layer.o obj/cost_layer.o obj/parser.o obj/option_list.o obj/detection_layer.o obj/route_layer.o obj/upsample_layer.o obj/box.o obj/normalization_layer.o obj/avgpool_layer.o obj/layer.o obj/local_layer.o obj/shortcut_layer.o obj/logistic_layer.o obj/activation_layer.o obj/rnn_layer.o obj/gru_layer.o obj/crnn_layer.o obj/demo.o obj/batchnorm_layer.o obj/region_layer.o obj/reorg_layer.o obj/tree.o obj/lstm_layer.o obj/l2norm_layer.o obj/yolo_layer.o obj/iseg_layer.o obj/image_opencv.o obj/convolutional_kernels.o obj/deconvolutional_kernels.o obj/activation_kernels.o obj/im2col_kernels.o obj/col2im_kernels.o obj/blas_kernels.o obj/crop_layer_kernels.o obj/dropout_layer_kernels.o obj/maxpool_layer_kernels.o obj/avgpool_layer_kernels.o -o libdarknet.so -lm -pthread  `pkg-config --libs opencv` -lstdc++ -L/usr/local/cuda/lib64 -lcuda -lcudart -lcublas -lcurand -lstdc++ 
/usr/bin/ld: cannot find -lopencv_contrib
/usr/bin/ld: cannot find -lopencv_legacy
collect2: error: ld returned 1 exit status
Makefile:83: recipe for target 'libdarknet.so' failed
make: *** [libdarknet.so] Error 1
root@cc284448a358:/home/user/darknet# 
```




```bash
root@cc284448a358:/home/user/darknet# nvidia-smi
Wed Feb 10 11:52:17 2021       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.102.04   Driver Version: 450.102.04   CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  GeForce GTX 1080    On   | 00000000:01:00.0  On |                  N/A |
|  0%   37C    P8    12W / 200W |    482MiB /  8118MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+
root@cc284448a358:/home/user/darknet# 
```

로컬 컴퓨터의 버전을 확인합니다.

```bash
root@cc284448a358:/home/user/darknet# (base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ nvidia-smi
Wed Feb 10 11:52:41 2021       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.102.04   Driver Version: 450.102.04   CUDA Version: 11.0     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  GeForce GTX 1080    On   | 00000000:01:00.0  On |                  N/A |
|  0%   39C    P0    44W / 200W |    498MiB /  8118MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A      1179      G   /usr/lib/xorg/Xorg                251MiB |
|    0   N/A  N/A      1312      G   /usr/bin/gnome-shell              115MiB |
|    0   N/A  N/A      2907      G   ...AAAAAAAAA= --shared-files       38MiB |
|    0   N/A  N/A      3148      G   ...gAAAAAAAAA --shared-files       88MiB |
+-----------------------------------------------------------------------------+
(base) aimldl@aimldl-home-desktop:~/docker_with_yolov$ 
```
