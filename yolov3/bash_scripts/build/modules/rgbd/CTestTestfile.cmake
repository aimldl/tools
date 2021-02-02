# CMake generated Testfile for 
# Source directory: /home/k8smaster/github/tools/yolov3/bash_scripts/opencv_contrib-master/modules/rgbd
# Build directory: /home/k8smaster/github/tools/yolov3/bash_scripts/build/modules/rgbd
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_rgbd "/home/k8smaster/github/tools/yolov3/bash_scripts/build/bin/opencv_test_rgbd" "--gtest_output=xml:opencv_test_rgbd.xml")
set_tests_properties(opencv_test_rgbd PROPERTIES  LABELS "Extra;opencv_rgbd;Accuracy" WORKING_DIRECTORY "/home/k8smaster/github/tools/yolov3/bash_scripts/build/test-reports/accuracy")
add_test(opencv_perf_rgbd "/home/k8smaster/github/tools/yolov3/bash_scripts/build/bin/opencv_perf_rgbd" "--gtest_output=xml:opencv_perf_rgbd.xml")
set_tests_properties(opencv_perf_rgbd PROPERTIES  LABELS "Extra;opencv_rgbd;Performance" WORKING_DIRECTORY "/home/k8smaster/github/tools/yolov3/bash_scripts/build/test-reports/performance")
add_test(opencv_sanity_rgbd "/home/k8smaster/github/tools/yolov3/bash_scripts/build/bin/opencv_perf_rgbd" "--gtest_output=xml:opencv_perf_rgbd.xml" "--perf_min_samples=1" "--perf_force_samples=1" "--perf_verify_sanity")
set_tests_properties(opencv_sanity_rgbd PROPERTIES  LABELS "Extra;opencv_rgbd;Sanity" WORKING_DIRECTORY "/home/k8smaster/github/tools/yolov3/bash_scripts/build/test-reports/sanity")
