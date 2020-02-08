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

echo Configuring CMakeList.txt
cd $curr_dir
sed -i 's/ros_package_template/'$1'/g' CMakeList.txt

echo Configuring package.xml
cd $curr_dir
sed -i 's/ros_package_template/'$1'/g' CMakeList.txt

echo Configuring template files
cd $curr_dir/ros_package_template
sed -i 's/ros_package_template/'$1'/g' algorithm.hpp
sed -i 's/ros_package_template/'$1'/g' ros_package_template.hpp
mv ros_package_template.hpp $1.hpp

echo Configuring 