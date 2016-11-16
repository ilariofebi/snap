#!/bin/bash

DIR="SNAP_"`date +%Y%m%d%H%M`
mkdir $DIR

cd $DIR

if [ -f /usr/bin/dpkg]
then
    dpkg --get-selections > dpkg-get-selections.txt
fi

if [ -f /bin/rpm ]
then
    rpm -qa > rpm_qa.txt
fi

tar cvfz etc.tgz /etc/
tar cvfz boot.tgz /boot/

pstree > pstree.sh
iptables-save > iptables.save

ifconfig -a > ifconfig.txt
mount > mount.txt
route -n > route.txt

netstat -putano > netstat_putano.txt

procenv --format=crumb > procenv.crumb

# BRIDGE
if [ -f /usr/sbin/brctl ]
then
        brctl show > brctl-show.txt
fi

cd -
