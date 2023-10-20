#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
touch config.txt

#array of system and snmp configuration
declare -a sys_conf=(["sys_hostname"]="", ["sys_timezone"]="", ["sys_banner"]="", ["sys_ntp"]="")
declare -a snmp_conf=("snmp_community" "snmp_contact" "sys_banner" "sys_ntp")

#loop through different system configuration
for key in ${sys_conf[@]}; do
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
  echo "Successfully set $key to ${sys_conf_value[$key]}"
done

#outputs the set system configuration
# for x in ${sys_conf_key[@]}; do
#   echo ${sys_conf_key[$x]} : ${sys_conf_value[$x]}
# done
echo "${!sys_conf[1]} ${sys_conf[1]}"




