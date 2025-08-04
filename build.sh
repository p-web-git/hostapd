#! /bin/bash

## Don't install anything
#sudo apt install build-essential pkgconf libnl-genl-3-dev

## Build and install openssl
echo "$pwd"
echo "$ls -la"
git clone https://github.com/openssl/openssl.git
cd openssl
./Configure
make -j8
make install

## Clone hostpad
echo "$pwd"
echo "$ls -la"
git clone git://w1.fi/hostap.git
cd hostap

## Checkout version and apply patch
#git checkout hostap_2_10
git apply For_intel_Wi-Fi_cards_v2_10.patch

## Generate config
cd ./hostapd
cp defconfig .config

## Edit .config



## Build
make build -j4
