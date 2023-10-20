#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
touch config.txt

#array of system and snmp configuration
declare -a sys_conf_keys=("sys_hostname" "sys_timezone" "sys_banner" "sys_ntp")
declare -a snmp_conf_keys=("snmp_community" "snmp_contact" "sys_banner" "sys_ntp")

for key in ${sys_conf_keys[@]};
do
  if [[ $key == "sys_ntp" ]] 
  then
      read -p "Do you want to set the NTP Server? [y/n] " response
      if [[ $response == "y" ]] 
      then
        echo "Skipping NTP Server setup"
      # else
      #   read -p "Set $key to: " sys_value
      #   sys_conf[$key]=$sys_value
      #   echo "Successfully set $key to ${sys_conf[$key]}"
      fi
  fi
  read -p "Set $key to: " sys_value
  sys_conf[$key]=$sys_value
  echo "Successfully set $key to ${sys_conf[$key]}"
done

  # if ["$key"=="sys_ntp"];
  # then
  #   echo "SYS NTP HERE"
  #   read -p "Do you want to set the NTP Server? [y/n] " response
  #   if [$response == "y"];
  #   then
  #     echo "Skipping NTP Server setup"
  #   read -p "Set $key to: " ntp_value
  #   sys_conf[$key] = ntp_value
  #   fi
  # fi





