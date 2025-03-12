#!/bin/bash
# port requirements

if [ "$(id -u)" != "0" ] && [ "$(uname -m)" == "x86_64" ]  && [  "$(uname)" == "Linux" ];then
    echo "Please run this as root!"
    exit
fi

if [ "$(grep -q "ubuntu" /etc/os-release)" ] || [ "$(grep -q "debian" /etc/os-release)" ]; then
    apt update -y
    apt upgrade -y
    apt install -y aria2 python3 busybox zip unzip p7zip-full openjdk-8-jre zipalign zstd bc android-sdk-libsparse-utils xmlstarlet
    if [ $? -ne 0 ];then
        echo "Installation not successful. Please manually install the following packages: aria2 python3 busybox zip unzip p7zip-full openjdk-8-jre zipalign zstd bc xmlstarlet"
    fi
fi

if [ "$(grep -q "fedora" /etc/os-release)" ] || [ "$(grep -q "suse" /etc/os-release)" ] || [ "$(grep -q "rhel" /etc/os-release)" ]; then
    dnf -y update
    dnf -y install -y aria2 android-tools python3 busybox zip unzip p7zip java-openjdk zstd bc xmlstarlet
    echo "zipalign and android-sdk-libsparse-utils were not instaklled."
    exit
fi

if [ "$(uname)" == "Darwin" ] && [ "$(uname -m)" == "x86_64" ];then
    echo "Device arch: MacOS X86_X64"
    pip3 install buysbox
    brew install aria2 openjdk zstd coreutils gdu gnu-sed gnu-getopt grep xmlstarlet
    exit
fi

echo "Distro not supported. Please install the following packages manually: aria2 python3 busybox zip unzip p7zip-full openjdk-8-jre zipalign zstd bc android-sdk-libsparse-utils xmlstarlet"
