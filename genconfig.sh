#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
touch config.txt


#sys_conf_array=array([sys_hostname], [sys_timezone], [sys_ntp], [sys_banner])
#snmp_conf_array = (snmp_community, snmp_contact, snmp_location)

#array of system and snmp configuration
declare -a sys_conf_keys=("sys_hostname" "sys_timezone" "sys_banner" "sys_ntp")
declare -a snmp_conf_keys=("snmp_community" "snmp_contact" "sys_banner" "sys_ntp")

for key in ${sys_conf_keys[@]};
do
  read -p "Set $key to: " sys_value
  sys_conf[$key]=$sys_value
  echo "Successfully set $key to ${sys_conf[$key]}"
  if [$key=="sys_ntp"];
  then
    echo "SYS NTP HERE"
    # read -p "Do you want to set the NTP Server? [y/n] " response
    # if [$response == "y"];
    # then
    #   echo "Skipping NTP Server setup"
    # read -p "Set $key to: " ntp_value
    # sys_conf[$key] = ntp_value
    # fi
  fi
  
done




