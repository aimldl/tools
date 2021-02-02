# CMake generated Testfile for 
# Source directory: /home/k8smaster/github/tools/yolov3/bash_scripts/opencv-master/modules/highgui
# Build directory: /home/k8smaster/github/tools/yolov3/bash_scripts/build/modules/highgui
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_highgui "/home/k8smaster/github/tools/yolov3/bash_scripts/build/bin/opencv_test_highgui" "--gtest_output=xml:opencv_test_highgui.xml")
set_tests_properties(opencv_test_highgui PROPERTIES  LABELS "Main;opencv_highgui;Accuracy" WORKING_DIRECTORY "/home/k8smaster/github/tools/yolov3/bash_scripts/build/test-reports/accuracy")
