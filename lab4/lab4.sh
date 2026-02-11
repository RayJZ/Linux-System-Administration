#!/bin/bash

touch /etc/sudoers.d/lab4
echo 'oldo5582 ALL = (ALL) ALL' >> /etc/sudoers.d/lab4
echo 'dschrute ALL = (ALL) ALL' >> /etc/sudoers.d/lab4

#this overwrite
if [[ $(hostname) =~ machineb ]] || [[ $(hostname) =~ machinec ]] || [[ $(hostname) =~ machined ]] || [[ $(hostname) =~ machinef ]] ; then
  echo 'mscott ALL = /sbin/shutdown -h +[2-9][0-9][0-9], /sbin/shutdown -h +[1][2-9][0-9], /sbin/shutdown -c' >> /etc/sudoers.d/lab4
  fi

100.64.11.3 michaelscottpapercompany.com www.michaelscottpapercompany.com
100.64.11.3 dundermifflin.com www.dundermifflin.com
100.64.11.3 schrutefarms.com www.schrutefarms.com
