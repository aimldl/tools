# CMake generated Testfile for 
# Source directory: /home/k8smaster/github/tools/yolov3/bash_scripts/opencv_contrib-master/modules/wechat_qrcode
# Build directory: /home/k8smaster/github/tools/yolov3/bash_scripts/build/modules/wechat_qrcode
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_wechat_qrcode "/home/k8smaster/github/tools/yolov3/bash_scripts/build/bin/opencv_test_wechat_qrcode" "--gtest_output=xml:opencv_test_wechat_qrcode.xml")
set_tests_properties(opencv_test_wechat_qrcode PROPERTIES  LABELS "Extra;opencv_wechat_qrcode;Accuracy" WORKING_DIRECTORY "/home/k8smaster/github/tools/yolov3/bash_scripts/build/test-reports/accuracy")
