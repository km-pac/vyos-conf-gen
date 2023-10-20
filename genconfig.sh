#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
touch config.txt


#sys_conf_array=array([sys_hostname], [sys_timezone], [sys_ntp], [sys_banner])
#snmp_conf_array = (snmp_community, snmp_contact, snmp_location)

#array of system and snmp configuration
sys_conf_key=("sys_hostname" "sys_timezone", "sys_banner", "sys_ntp")
snmp_conf_key=("snmp_community", "snmp_contact", "sys_banner", "sys_ntp")

for i in ${sys_conf_key[@]};
do
  read -p "Set ${sys_conf_key[$i]} to: " ${sys_value[$i]}
  #sys_conf_value+=("$sys_value")
  echo "Successfully set the ${sys_conf_key[$i]} to ${sys_conf_value[$i]}"
  # if [${sys_conf_key[$i]} == "sys_ntp"]
  # then
  #   read -p "Do you want to set the NTP Server? " response
  #   if [
  # fi
done




