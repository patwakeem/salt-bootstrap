#!/bin/bash
# Author: pWakeem
# Script that bootstraps a new centos5 node with salt-stack with minimal interaction.
#

echo "Please enter the host environment: "
read environ

if [ ! -f /etc/yum.repos.d/epel.repo ];then

	rpm -Uvh 'http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm'
else
	:
fi


yum install -y salt-minion
rpm -Uvh http://docs.saltstack.com/downloads/cent5/libzmq3-3.2.2-13.1.x86_64.rpm
rpm -Uvh http://docs.saltstack.com/downloads/cent5/python26-zmq-13.1.0-1.x86_64.rpm
rpm -Uvh http://docs.saltstack.com/downloads/cent5/zeromq-3.2.2-13.1.x86_64.rpm

echo "

id: $(echo $(hostname) | cut -f'1' -d'.')${environ}
random_reauth_delay: 5
master: saltmaster host name goes here

tcp_keepalive: True
tcp_keepalive_idle: 180

" >> /etc/salt/minion 

#uncomment for highstate calls every hour

#echo '#/bin/bash
#
#salt-call state.highstate >/dev/null 2>/dev/null
#' > /etc/cron.hourly/highstate.cron

#chmod +x /etc/cron.hourly/highstate.cron

service salt-minion start
sleep 10
curl http://saltmaster host name goes here/salt/salt-key.php
