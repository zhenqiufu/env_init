#!/bin/bash  

# @Author: Zhenqiu Fu
# @Date:   2020-06-05 17:07:40
# @Last Modified by:   Zhenqiu Fu
# @Last Modified time: 2020-06-05 17:12:09


# update system
echo "update system"
sudo apt-get update -y
sudo apt-get upgrade -y


sudo apt install python3 python3-pip 

# install boost 1.71
cd ../
tar xvf boost_1_71_0.tar.gz 
cd boost_1_71_0
./bootstrap.sh --prefix=/usr
sudo ./b2 install

#### install mosek9   ###
cd ../mosek
tar xvf mosektoolslinux64x86.tar.bz2
sudo cp -rf mosek/ /opt/
sudo cp -rf /opt/mosek/9.0/tools/platform/linux64x86/bin/libmosek64.* /usr/lib/

echo '# environmental variable for mosek9' >> ~/.bashrc
echo 'PATH=/opt/mosek/9.0/tools/platform/linux64x86/bin:$PATH' >> ~/.bashrc
sudo source ~/.bashrc

sudo mkdir -m 777 ~/mosek
sudo mv mosek.lic ~/mosek/

#### install osqp   ###
cd ../osqp
sudo mkdir build
cd build
cmake -G "Unix Makefiles" ..
sudo cmake --build . --target install