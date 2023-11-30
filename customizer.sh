#!/bin/bash
#
# Copyright (C) 2022 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Verify bash version. macOS comes with bash 3 preinstalled.
if [[ ${BASH_VERSINFO[0]} -lt 3 ]]
then
  echo "You need at least bash 3 to run this script."
  exit 1
fi

# exit when any command fails
set -e

if [[ $# -lt 3 ]]; then
   echo "Usage: bash customizer.sh my.new.package project-name [ApplicationName" >&2
   exit 3
fi

PACKAGE=$1
PROJECTNAME=$2
APPNAME=$3
SUBDIR=${PACKAGE//.//} # Replaces . with /

for n in $(find . -type d \( -path '*/android/app' \) )
do
  echo "Creating $n/src/main/kotlin/$SUBDIR"
  mkdir -p $n/src/main/kotlin/$SUBDIR
  echo "Moving files to $n/src/main/kotlin/$SUBDIR"
  mv $n/src/main/kotlin/com/theprojectfactory/civstart/* $n/src/main/kotlin/$SUBDIR
  echo "Removing old $n/android/com/theprojectfactory/civstart"
  rm -rf mv $n/src/main/kotlin/com/theprojectfactory/civstart
done


# Rename package and imports
echo "Renaming pubspec.yalm project name to $PROJECTNAME"
find ./ -type f -name "pubspec.yaml" -exec sed -i.bak "s/civstart/$PROJECTNAME/g" {} \;
echo "Renaming all dart file project package to to $PROJECTNAME"
find ./ -type f -name "*.dart" -exec sed -i.bak "s/package:civstart/package:$PROJECTNAME/g" {} \;
find ./ -type f -name "*.dart" -exec sed -i.bak "s/com.theprojectfactory.civstart/$PACKAGE/g" {} \;
find ./ -type f -name "*.dart" -exec sed -i.bak "s/package:civstart/package:$PROJECTNAME/g" {} \;
find ./ -type f -name "assets.dart" -exec sed -i.bak "s/civstart/$PROJECTNAME/g" {} \;


#Android
echo "Renaming Android kt package to $PACKAGE"
find ./ -type f -name "*.kt" -exec sed -i.bak "s/package com.theprojectfactory.civstart/package $PACKAGE/g" {} \;
find ./ -type f -name "AndroidManifest.xml" -exec sed -i.bak "s/com.theprojectfactory.civstart/$PACKAGE/g" {} \;
echo "Renaming Android package to $PACKAGE"
find ./ -type f -name "*.gradle" -exec sed -i.bak "s/com.theprojectfactory.civstart/$PACKAGE/g" {} \;
echo "Renaming Android app name to $APPNAME"
find ./ -type f -name "*.gradle" -exec sed -i.bak "s/CivStart/$APPNAME/g" {} \;

#iOS
echo "Renaming iOS package to $PACKAGE"
find ./ -type f -name "project.pbxproj" -exec sed -i.bak "s/com.theprojectfactory.civstart/$PACKAGE/g" {} \;
echo "Renaming iOS app name to $APPNAME"
find ./ -type f -name "project.pbxproj" -exec sed -i.bak "s/CivStart/$APPNAME/g" {} \;

echo "Cleaning up"
find . -name "*.bak" -type f -delete
