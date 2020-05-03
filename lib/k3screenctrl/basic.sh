#!/bin/sh
MAC_ADDR=$(nvram get et2macaddr)
BUILD_NO=`nvram get buildno`
EXTEND_NO=`nvram get extendno`
swmode=`nvram get sw_mode`

if [ "$swmode" == "1" ]; then
HW_VERSION=A1/A2
else
HW_VERSION=AP:$(nvram get lan_ipaddr)
fi
FW_VERSION="$BUILD_NO"_"$EXTEND_NO"
NEW_FW_VERSION=`nvram get new_fw_version`

echo K3
echo A1/A2
echo $FW_VERSION
echo $NEW_FW_VERSION
echo $MAC_ADDR
