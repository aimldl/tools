# CMake generated Testfile for 
# Source directory: /home/k8smaster/github/tools/yolov3/bash_scripts/opencv_contrib-master/modules/fuzzy
# Build directory: /home/k8smaster/github/tools/yolov3/bash_scripts/build/modules/fuzzy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_fuzzy "/home/k8smaster/github/tools/yolov3/bash_scripts/build/bin/opencv_test_fuzzy" "--gtest_output=xml:opencv_test_fuzzy.xml")
set_tests_properties(opencv_test_fuzzy PROPERTIES  LABELS "Extra;opencv_fuzzy;Accuracy" WORKING_DIRECTORY "/home/k8smaster/github/tools/yolov3/bash_scripts/build/test-reports/accuracy")
