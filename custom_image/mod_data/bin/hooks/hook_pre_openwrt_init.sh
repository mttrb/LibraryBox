#!/bin/sh

# ---- TEMPLATE ----

# Hook for modifcation stuff before 
#          piratebox/bin/install  ... openwrt 
# is started


if [ !  -f $1 ] ; then 
  echo "Config-File $1 not found..." 
  exit 255
fi

#Load config
. $1 

#Load openwrt-common config and procedures file!
. /etc/piratebox.common


# You can uncommend this line to see when hook is starting:
 echo "------------------ Running $0 ------------------"

echo "Changing SSID to $SSID"
uci set "wireless.@wifi-iface[0].ssid=$SSID"
echo "Changing hostname to $HOST"
uci set "system.@system[0].hostname=$HOST"
echo "127.0.0.1 $HOST localhost." >/etc/hosts
echo "$IP $HOST" >>/etc/hosts

uci commit
