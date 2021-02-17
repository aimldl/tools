* Draft: 2021-02-17 (Wed)

# How to Prepare Darknet on Amazon EC2 Instance (with GPU, cuDNN, and OpenCV)

## Create an Amazon EC2 instance


## Check the computing environment
run
```bash
$ nvidia-smi
Wed Feb 17 04:23:29 2021       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.80.02    Driver Version: 450.80.02    CUDA Version: 11.0     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla V100-SXM2...  On   | 00000000:00:1E.0 Off |                    0 |
| N/A   29C    P0    24W / 300W |      0MiB / 16160MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
$ docker --version
Docker version 20.10.3, build 48d30b5
$ nvidia-docker --version
Docker version 20.10.3, build 48d30b5
$ cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
#define CUDNN_MAJOR 7
#define CUDNN_MINOR 5
#define CUDNN_PATCHLEVEL 1
--
#define CUDNN_VERSION (CUDNN_MAJOR * 1000 + CUDNN_MINOR * 100 + CUDNN_PATCHLEVEL)

#include "driver_types.h"
$ 
```
## Prepare the installation Bash scripts

```bash
$ ls
Nvidia_Cloud_EULA.pdf  README  src  tools
$ mkdir darknet
$ cd darknet/
$ nano install_opencv_in_linux
$ nano install_opencv_contrib
$ chmod +x install_opencv_contrib 
$ chmod +x install_opencv_in_linux 
$ ./install_opencv_in_linux
```
The next step is to compile OpenCV. This takes hours depending on machine.
```bash
$ ./install_opencv_contrib
```
