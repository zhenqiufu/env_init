#!/bin/bash  


# @Author: Zhenqiu Fu
# @Date:   2020-06-05 13:23:26
# @Last Modified by:   Zhenqiu Fu
# @Last Modified time: 2020-06-05 17:06:15

### 更新系统//
# 
### 安装ROS
# 
### 桌面美化
# 
### 修复双系统时间同步问题//
# 
### 工具列表:
# git
# Curl
# gdebi
# vim及配置
# unzip   ----解压工具
# unrar   ----解压工具
# v2ray及配置
# terminator//
# 
# 
### 软件列表:
# Visual Studio Code
# sublime text 3
# WPS 并卸载自带LibreOffice
# 网易云
# 搜狗拼音
# Google Chrome
# 微信
# typora
# 
# 
### 包库列表:
# mosek 9
# sqlite3
# Eigen
# 
# 
# 


echo ""
echo "#######################################################################"
echo "#                            Auto Env config!                         #"
echo "#                          Start to configurate!                      #"
echo "#                             By Zhenqiu Fu                           #"
echo "#                                 V 1.0.0                             #"
echo "#######################################################################"
echo ""

echo ""


echo ""
echo "#######################################################################"
echo "#                          Start to Remove Software                   #"
echo "#######################################################################"
echo ""


# swDir="/SW"
# #downloadFolderName="ubuntuSW"

# # 在系统根目录
# sudo mkdir ${swDir}
# #sudo mkdir ~/Downloads/${downloadFolder}

# update system
echo "update system"
sudo apt-get update -y
sudo apt-get upgrade -y

echo ""
echo "#######################################################################"
echo "#                          Start to Install Tools                     #"
echo "#######################################################################"
echo ""

# install some tools:
echo "install git"
sudo apt-get install git -y

echo "install g++"
sudo apt install g++ -y 

echo "install curl"
apt-get install curl -y

echo "install gdebi"
apt-get install gdebi -y

echo "install vim"
sudo apt-get install -y vim

echo "install unzip"
sudo apt-get install unzip -y

# echo "install kolour paint"
# sudo apt-get install  kolourpaint4 -y 

echo "install unrar"
sudo apt-get install unrar -y

# fixed time zone problem
sudo timedatectl set-local-rtc true
sudo timedatectl set-ntp true


#install terminator
echo "install terminator"
sudo apt-get install terminator


#install v2ray
bash <(curl -L -s https://install.direct/go.sh)
sudo rm /etc/v2ray/config.json
sudo cp config.json /etc/v2ray/
sudo service v2ray sart

# install CMake (https://apt.kitware.com/)
CMAKE_VERSION="3.17.2-0kitware1"
if [ ! -f ./cmake-data.deb ]; then
    wget -O cmake-data.deb "https://apt.kitware.com/ubuntu/pool/main/c/cmake/cmake-data_${CMAKE_VERSION}_all.deb"
fi
if [ ! -f ./cmake.deb ]; then
    wget -O cmake.deb "https://apt.kitware.com/ubuntu/pool/main/c/cmake/cmake_${CMAKE_VERSION}_amd64.deb"
fi
sudo dpkg -i ./cmake-data.deb
sudo dpkg -i ./cmake.deb



echo ""
echo "#######################################################################"
echo "#                          Start to Remove Software                   #"
echo "#######################################################################"
echo ""

# 卸载libreoffice和小游戏
sudo apt remove -y libreoffice*
sudo apt remove -y thunderbird aisleriot gnome-mines gnome-sudoku rhythmbox gnome-mahjongg 


echo ""
echo "#######################################################################"
echo "#                         Start to Install Software                   #"
echo "#######################################################################"
echo ""




# install typora (https://typora.io/#linux)
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt update && sudo apt install -y typora




# chromeName="chrome.deb"
# sudo wget -O ${chromeName} -c ${googleChromeLink}
# sudo dpkg -i ${chromeName}

# install wps (https://linux.wps.cn/)
if [ ! -f ./wps-office.deb ]; then
    wget -O wps-office.deb https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/9505/wps-ofapt --fix-broken installfice_11.1.0.9505_amd64.deb
fi
sudo apt install -y ./wps-office.deb
 

# install netease-cloud-music (https://music.163.com/#/download)
if [ ! -f ./netease-cloud-music.deb ]; then
    wget -O netease-cloud-music.deb http://d1.music.126.net/dmusic/netease-cloud-music_1.2.1_amd64_ubuntu_20190428.deb
fi
sudo dpkg -i ./netease-cloud-music.deb

echo ""
echo "#######################################################################"
echo "#                      Start to Install gnome desktop                 #"
echo "#######################################################################"
echo ""


echo ""
echo "#######################################################################"
echo "# 已完成目录:                                                          "
echo "# 1. git                                                               "
echo "# 2. g++                                                   		   "
echo "# 3. curl                                                              "
echo "# 4. cmake                                                            "
echo "# 5. terminator                                                        "
echo "# 6. wps-officee                                               	    "
echo "# 7. netease-cloud-music                                               "
echo "# 8. typora                                                            "
echo "# 9. unrar                                                             "
echo "# 10.unzip                                                             "
echo "# 11.vim                                                               "
echo "# 12.gdebi                                                             "
echo "# 13.v2ray                                                                    "
echo "# finishi!                                                            "
echo "#                                                                     "
echo "#                                                                     "
echo "#######################################################################"
echo ""

