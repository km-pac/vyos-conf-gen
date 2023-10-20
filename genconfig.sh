#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
touch config.txt

#array of system and snmp configuration
declare -a sys_conf_keys=("sys_hostname" "sys_timezone" "sys_banner" "sys_ntp")
declare -a snmp_conf_keys=("snmp_community" "snmp_contact" "sys_banner" "sys_ntp")

#loop through different system configuration
for key in ${sys_conf_keys[@]}; do
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
  sys_conf[$key]=$sys_value
  echo "Successfully set $key to ${sys_conf[$key]}"
done

#outputs the set system configuration
for key in ${sys_conf[@]}; do
  echo ${sys_conf[$key]}
done





