# CMake generated Testfile for 
# Source directory: /home/k8smaster/github/tools/yolov3/bash_scripts/opencv_contrib-master/modules/saliency
# Build directory: /home/k8smaster/github/tools/yolov3/bash_scripts/build/modules/saliency
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_saliency "/home/k8smaster/github/tools/yolov3/bash_scripts/build/bin/opencv_test_saliency" "--gtest_output=xml:opencv_test_saliency.xml")
set_tests_properties(opencv_test_saliency PROPERTIES  LABELS "Extra;opencv_saliency;Accuracy" WORKING_DIRECTORY "/home/k8smaster/github/tools/yolov3/bash_scripts/build/test-reports/accuracy")
