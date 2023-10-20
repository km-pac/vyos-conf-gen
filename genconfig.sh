#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
touch config.txt

#array of system and snmp configuration
declare -a sys_conf_key=("host-name" "time-zone" "login banner" "ntp server")
declare -a snmp_conf=("snmp_community" "snmp_contact" "snmp_location")

#loop through different system configuration
while [[ $sys_done != "y" ]]
do
  declare -a sys_conf_value=()
  for key in ${sys_conf_key[@]}; do
    #sys_ntp config is optional;
    if [[ $key == "sys_ntp" ]]
    then
        read -p "Do you want to set the NTP Server? [y/n]: " response
        if [[ $response == "n" ]]
        then
          echo "Skipping NTP Server setup"
          break
        fi
    fi
    read -p "Set $key to: " sys_value
    sys_conf_value+=($sys_value)
    echo "Successfully set $key to $sys_value"
  done
  #outputs the set system configuration
  for index in "${!sys_conf_key[@]}"; do
      key="${sys_conf_key[$index]}"
      value="${sys_conf_value[$index]}"
      echo "$key : $value"
  done
  #confirm if satisfied with the configuration set
  read -p "Are you satisfied with this configuration? [y/n]: " sys_done
done





