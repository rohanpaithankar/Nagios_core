#!/bin/sh

#  Client.sh
#  
#
#  Created by Rohan Paithankar on 7/3/16.
#
#Monitered server plugin
wget https://www.nagios-plugins.org/download/nagios-plugins-1.5.tar.gz
#to download nagios plugins 1.5
tar xvf nagios-plugins-1.5.tar.gz
cd nagios-plugins-1.5
./configure
make
make install
service xinetd restart
/usr/local/nagios/libexec/check_nrpe -H <ip address of monitoring server>
iptables -A INPUT -p tcp -m tcp  - -dport 5666 -j ACCEPT
service iptables save 	#assigning port for nagios plugin to operate
service nrpe restart #(On client)
service nagios restart #(On monitoring server)
