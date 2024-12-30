# hostapd

This page contains a patch so that hostapd is able unlock the 5GHz bands for Intel network cards. During my tests I wasn't able to create any network on mode "a" because all the 5GHz bands were set as "no-IR", this was happenig because the Intel cards needs to detect other base stations to set the country code.


My  Hardware:
  Intel NUC with "Intel Corporation Wireless 8265 / 8275 (rev 78)" card

Patch: for hostapd v2.10/2.11
