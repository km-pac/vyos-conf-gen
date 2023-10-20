#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
touch config.txt

#array of system and snmp configuration
declare -a sys_conf_key=("sys_hostname" "sys_timezone" "sys_banner" "sys_ntp")
declare -a snmp_conf=("snmp_community" "snmp_contact" "snmp_location")

#loop through different system configuration
for key in ${sys_conf_key[@]}; do
  #sys_ntp config is optional;
  if [[ $key == "sys_ntp" ]]
  then
      read -p "Do you want to set the NTP Server? [y/n] " response
      if [[ $response == "n" ]]
      then
        echo "Skipping NTP Server setup"
        break
      fi
  fi
  read -p "Set $key to: " sys_value
  sys_conf_value+=($sys_value)
  echo "Successfully set $key to ${sys_conf_value[$key]}"
done

#outputs the set system configuration
for x in {1..$(( ${#sys_conf_key[@]}-1 ))}; do
  echo ${sys_conf_key[$x]} : ${sys_conf_value[$x]}
done





