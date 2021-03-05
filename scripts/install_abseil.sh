#!/bin/sh

# Copyright 2019 The Cartographer Authors
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

set -o errexit
set -o verbose

git clone https://github.com/abseil/abseil-cpp.git
cd abseil-cpp
#git checkout d902eb869bcfacc1bad14933ed9af4bed006d481
#Always enable proper symbolize implementation on Windows ... by Loo Rong Jie <loorongjie@gmail.com>
git checkout ecc0033b54847f6c9ee37dbb0be8aa17e5b6d37b
mkdir build
cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DCMAKE_INSTALL_PREFIX=c:/opt/rosdeps/stow/absl/ 
  ..
ninja
sudo ninja install
cd /usr/local/stow
sudo stow absl
