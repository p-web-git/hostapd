# hostapd

This page contains a patch so that hostapd is able unlock the 5GHz bands for Intel network cards. During my tests I wasn't able to create any network on mode "a" because all the 5GHz bands were set as "no-IR", this was happening because the Intel cards needs to detect other base stations to set the country code.


My  Hardware:
  Intel NUC with "Intel Corporation Wireless 8265 / 8275 (rev 78)" card

Patch: for hostapd v2.10/2.11

## Instructions

You will require a few packeges in order to compile hostapd, you can build them yourself or install the binary

``` bash
apt install pkgconf libnl-genl-3-dev
```

For openssl it will be a bit more involving

``` bash
git clone https://github.com/openssl/openssl.git
cd openssl
./Configure
make -j8
make install
```

Download hostapd
```
git clone git://w1.fi/hostap.git
cd hostap
```

Apply patch
```
git checkout hostap_2_10
git apply For_intel_Wi-Fi_cards_v2_10.patch
```

``` bash
cd ./hostapd
cp defconfig .config
```

Edit .config file and add:
``` bash
CFLAGS += -I/usr/include/libnl3
CONFIG_IEEE80211AC=y
CONFIG_IEEE80211AX=y
CONFIG_SAE=y
CONFIG_SAE_PK=y
```

Finally build hostapd:

```bash
make build
```

After copying the modifyed version to your system, run the command bellow so that the file doesn't get replaced or delete in case of system updates:
```
chattr +i /usr/sbin/hostapd
```
