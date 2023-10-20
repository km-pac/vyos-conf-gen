#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
rm -rf config.txt
touch config.txt

#array of system and snmp configuration
declare -a sys_conf_key=("sys_hostname" "sys_timezone" "sys_login" "sys_ntp")
declare -a snmp_conf_key=("snmp_community" "snmp_contact" "snmp_location")

#loop through different system configuration
# echo "\nCONFIGURING SYSTEM CONFIGURATION"
# while [[ $sys_done != "y" ]]
# do
#   declare -a sys_conf_values=()
#   for syskey in ${sys_conf_key[@]}; do
#     #sys_ntp config is optional;
#     if [[ $syskey == "sys_ntp" ]]
#     then
#         read -p "Do you want to set the NTP Server? [y/n]: " response
#         if [[ $response == "n" ]]
#         then
#           echo "Skipping NTP Server setup"
#           break
#         fi
#     fi
#     read -p "Set $syskey: " sys_values
#     sys_conf_values+=("$sys_values")
#   done
#   #outputs the set system configuration
#   for index in "${!sys_conf_key[@]}"; do
#       sys_key="${sys_conf_key[$index]}"
#       sys_values="${sys_conf_values[$index]}"
#       echo "$sys_key : $sys_values"
#   done
#   #confirm if satisfied with the configuration set
#   read -p "Are you satisfied with this SYS configuration? [y/n]: " sys_done
# done

#loop through different snmp configuration
# echo -e "\nCONFIGURING SNMP SERVICES"
# while [[ $snmp_done != "y" ]]
# do
#   declare -a snmp_conf_values=()
#   for snmpkey in ${snmp_conf_key[@]}; do
#     read -p "Set $snmpkey: " snmp_value
#     snmp_conf_values+=("$snmp_value")
#   done
#   #outputs the set system configuration
#   for index in "${!snmp_conf_key[@]}"; do
#       snmp_key="${snmp_conf_key[$index]}"
#       snmp_values="${snmp_conf_values[$index]}"
#       echo "$snmp_key : $snmp_values"
#   done
#   #confirm if satisfied with the configuration set
#   read -p "Are you satisfied with this SNMP configuration? [y/n]: " snmp_done
# done

# echo -e "\nCONFIGURING SNMP SERVICES"
while [[ $snmp_done != "y" ]]
do
  declare -a snmp_conf=()
  for snmpkey in ${!snmp_conf[@]}; do
    read -p "Set $snmpkey: " snmp_value
    snmp_conf[$snmpkey]=$snmp_value
  done
  #outputs the set system configuration
  for snmpkey in "${!snmp_conf[@]}"; do
      snmp_key="$snmpkey"
      snmp_values="${snmp_conf_values[$snmpkey]}"
      echo "$snmp_key : $snmp_values"
  done
  #confirm if satisfied with the configuration set
  read -p "Are you satisfied with this SNMP configuration? [y/n]: " snmp_done
done

#loop through interface configuration
# echo -e "\nCONFIGURING INTERFACES"
# while [[ ipv4_done != 'y' ]]
# do
#   declare -a int_ipv4_values=()
#   read -p "Number of interafaces: " interface_count
#   for ((int = 0; int < interface_count; int++)); do
#     read -p "IP Address for eth$int: " ipv4_value
#     int_ipv4_values+=("$ipv4_value")
#   done
#   for index in "${!int_ipv4_values[@]}"; do
#       interface="eth$index"
#       ipv4_address="${int_ipv4_values[$index]}"
#       echo "$interface : $ipv4_address"
#   done
#   read -p "Are you satisfied with this IPv4 configuration? [y/n]: " ipv4_done
# done

# cat << EOF > config.txt
# set system host-name ${sys_conf_values[0]}
# set system time-zone ${sys_conf_values[1]}
# set system login banner post-login ${sys_conf_values[2]}
# set system login banner pre-login ${sys_conf_values[2]}
# set system ntp server ${sys_conf_values[3]}

# set snmp community ${snmp_conf_values[0]}
# set snmp contact ${snmp_conf_values[1]}
# set snmp location ${snmp_conf_values[2]}
# EOF






