#!/bin/bash

# Replace names in the following files


# check for new package name
if [ -z "$1" ]; then
  echo Package name unspecified
  echo Please run: bash rename_pkg.sh pkg_name
fi

# rename files
curr_dir=`pwd`

echo Configuring project

echo Configuring CMakeLists.txt
cd $curr_dir/ros_package_template
sed -i 's/ros_package_template/'$1'/g' CMakeLists.txt

echo Configuring package.xml
cd $curr_dir/ros_package_template
sed -i 's/ros_package_template/'$1'/g' package.xml

echo Configuring include directory
cd $curr_dir/ros_package_template/include
mv ros_package_template $1
cd $1
sed -i 's/ros_package_template/'$1'/g' algorithm.hpp
sed -i 's/ros_package_template/'$1'/g' ros_package_template.hpp
mv ros_package_template.hpp $1.hpp


echo Configuring launch directory
cd $curr_dir/ros_package_template/launch
sed -i 's/ros_package_template/'$1'/g' ros_package_template_overlying_params.launch
sed -i 's/ros_package_template/'$1'/g' ros_package_template.launch
mv ros_package_template_overlying_params.launch $1_overlying_params.launch
mv ros_package_template.launch $1.launch

echo Configuring src directory
cd $curr_dir/ros_package_template/src
sed -i 's/ros_package_template/'$1'/g' algorithm.cpp
sed -i 's/ros_package_template/'$1'/g' ros_package_template.cpp
sed -i 's/ros_package_template/'$1'/g' ros_package_template_node.cpp
mv ros_package_template.cpp $1.cpp
mv ros_package_template_node.cpp $1_node.cpp

echo Configuring test directory
cd $curr_dir/ros_package_template/test
sed -i 's/ros_package_template/'$1'/g' test_algorithm.cpp
sed -i 's/ros_package_template/'$1'/g' test_ros_package_template.cpp
mv test_ros_package_template.cpp test_$1.cpp

echo Renaming directories
cd $curr_dir
mv ros_package_template $1

echo Renaming repository name
cd $curr_dir
cd ..
mv ROS_BEST_PRACTICES ${1^^}