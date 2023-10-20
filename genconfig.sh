#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
touch config.txt


#sys_conf_array=array([sys_hostname], [sys_timezone], [sys_ntp], [sys_banner])
#snmp_conf_array = (snmp_community, snmp_contact, snmp_location)

#array of system and snmp configuration
declare -a sys_conf=("sys_hostname" "sys_timezone" "sys_banner" "sys_ntp")
declare -a snmp_conf=("snmp_community" "snmp_contact" "sys_banner" "sys_ntp")

for key in ${sys_conf[@]};
do
  read -p "Set $key to: " sys_value
  sys_conf[$key]=$sys_value
  echo "Successfully set $key to ${sys_conf[$key]}"



  
  # if [${sys_conf_key[$i]} == "sys_ntp"]
  # then
  #   read -p "Do you want to set the NTP Server? " response
  #   if [
  # fi
done




