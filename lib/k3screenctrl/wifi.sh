#!/bin/sh
smart_connect=`nvram get smart_connect_x`
ssid_2g=`nvram get wl0_ssid`
pwd_2g=`nvram get wl0_wpa_psk`
enabled_2g=`nvram get wl0_bss_enabled`
num_2g=`wl -i eth1 assoclist| wc -l`
ssid_5g=`nvram get wl1_ssid`
pwd_5g=`nvram get wl1_wpa_psk`
enabled_5g=`nvram get wl1_bss_enabled`
num_5g=`wl -i eth2 assoclist| wc -l`

enabled_guest=0
num_guest01=0;num_guest02=0;num_guest03=0
num_guest11=0;num_guest12=0;num_guest13=0

enabled_guest_01=`nvram get wl0.1_bss_enabled`
enabled_guest_02=`nvram get wl0.2_bss_enabled`
enabled_guest_03=`nvram get wl0.3_bss_enabled`
enabled_guest_11=`nvram get wl1.1_bss_enabled`
enabled_guest_12=`nvram get wl1.2_bss_enabled`
enabled_guest_13=`nvram get wl1.3_bss_enabled`
if [ $(expr ${enabled_guest_01} + ${enabled_guest_02} + ${enabled_guest_03} + \
		${enabled_guest_11} + ${enabled_guest_12} + ${enabled_guest_13}) -ge 1 ]; then
	enabled_guest=1

	if [ ${enabled_guest_01} == 1 ]; then
		ssid_guest01=`nvram get wl0.1_ssid`"|"
		pwd_guest01=`nvram get wl0.1_wpa_psk`"|"
		num_guest01=`wl -i wl0.1 assoclist| wc -l`
		if [ $(nvram get wl0.1_auth_mode_x) == "open" ]; then
			pwd_guest01=" |"
		fi
	fi
	if [ ${enabled_guest_02} == 1 ]; then
		ssid_guest02=`nvram get wl0.2_ssid`"|"
		pwd_guest02=`nvram get wl0.2_wpa_psk`"|"
		num_guest02=`wl -i wl0.2 assoclist| wc -l`
		if [ $(nvram get wl0.2_auth_mode_x) == "open" ]; then
			pwd_guest02=" |"
		fi
	fi
	if [ ${enabled_guest_03} == 1 ]; then
		ssid_guest03=`nvram get wl0.3_ssid`"|"
		pwd_guest03=`nvram get wl0.3_wpa_psk`"|"
		num_guest03=`wl -i wl0.3 assoclist| wc -l`
		if [ $(nvram get wl0.3_auth_mode_x) == "open" ]; then
			pwd_guest03=" |"
		fi
	fi
	if [ ${enabled_guest_11} == 1 ]; then
		ssid_guest11=`nvram get wl1.1_ssid`"|"
		pwd_guest11=`nvram get wl1.1_wpa_psk`"|"
		num_guest11=`wl -i wl1.1 assoclist| wc -l`
		if [ $(nvram get wl1.1_auth_mode_x) == "open" ]; then
			pwd_guest11=" |"
		fi
	fi
	if [ ${enabled_guest_12} == 1 ]; then
		ssid_guest12=`nvram get wl1.2_ssid`"|"
		pwd_guest12=`nvram get wl1.2_wpa_psk`"|"
		num_guest12=`wl -i wl1.2 assoclist| wc -l`
		if [ $(nvram get wl1.2_auth_mode_x) == "open" ]; then
			pwd_guest12=" |"
		fi
	fi
	if [ ${enabled_guest_13} == 1 ]; then
		ssid_guest13=`nvram get wl1.3_ssid`"|"
		pwd_guest13=`nvram get wl1.3_wpa_psk`"|"
		num_guest13=`wl -i wl1.3 assoclist| wc -l`
		if [ $(nvram get wl1.3_auth_mode_x) == "open" ]; then
			pwd_guest13=" |"
		fi
	fi

	ssid_guest=${ssid_guest01}${ssid_guest02}${ssid_guest03}${ssid_guest11}${ssid_guest12}${ssid_guest13}
	pwd_guest=${pwd_guest01}${pwd_guest02}${pwd_guest03}${pwd_guest11}${pwd_guest12}${pwd_guest13}
	ssid_guest=${ssid_guest%|}
	pwd_guest=${pwd_guest%|}
	num_guest=`expr ${num_guest01} + ${num_guest02} + ${num_guest03} + \
					${num_guest11} + ${num_guest12} + ${num_guest13}`
fi

if [ -z ${num_guest} ]; then
	num_guest=0
fi

if [ $(nvram get wl0_auth_mode_x) == "open" ]; then
pwd_2g=" "
fi
if [ $(nvram get wl1_auth_mode_x) == "open" ]; then
pwd_5g=" "
fi
if [ "$(nvram get screen_2G5G_pwd_hide)" == 1 ]; then
pwd_2g="********"
pwd_5g="********"
fi
if [ "$(nvram get screen_guest_pwd_hide)" == 1 ]; then
pwd_guest="********"
fi

echo ${smart_connect}
echo ${ssid_2g}
echo "${pwd_2g}"
echo ${enabled_2g}
echo ${num_2g}
echo ${ssid_5g}
echo "${pwd_5g}"
echo ${enabled_5g}
echo ${num_5g}
echo ${ssid_guest}
echo "${pwd_guest}"
echo ${enabled_guest}
echo ${num_guest}
