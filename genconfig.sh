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
#   declare -a sys_conf_value=()
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
#     read -p "Set $syskey: " sys_value
#     sys_conf_value+=("$sys_value")
#     echo "Successfully set $syskey to $sys_value"
#   done
#   #outputs the set system configuration
#   for index in "${!sys_conf_key[@]}"; do
#       sys_key="${sys_conf_key[$index]}"
#       sys_value="${sys_conf_value[$index]}"
#       echo "$sys_key : $sys_value"
#   done
#   #confirm if satisfied with the configuration set
#   read -p "Are you satisfied with this SYS configuration? [y/n]: " sys_done
# done

#loop through different snmp configuration
# echo "\nCONFIGURING SNMP SERVICES"
# while [[ $snmp_done != "y" ]]
# do
#   declare -a snmp_conf_value=()
#   for snmpkey in ${snmp_conf_key[@]}; do
#     read -p "Set $snmpkey: " snmp_value
#     snmp_conf_value+=("$snmp_value")
#     echo "Successfully set $snmpkey to $snmp_value"
#   done
#   #outputs the set system configuration
#   for index in "${!snmp_conf_key[@]}"; do
#       snmp_key="${snmp_conf_key[$index]}"
#       snmp_value="${snmp_conf_value[$index]}"
#       echo "$snmp_key : $snmp_value"
#   done
#   #confirm if satisfied with the configuration set
#   read -p "Are you satisfied with this SNMP configuration? [y/n]: " snmp_done
# done

# cat << EOF > config.txt
# set system host-name ${sys_conf_value[0]}
# set system time-zone ${sys_conf_value[1]}
# set system login banner post-login ${sys_conf_value[2]}
# set system login banner pre-login ${sys_conf_value[2]}
# set system ntp server ${sys_conf_value[3]}

# set snmp community ${snmp_conf_value[0]}
# set snmp contact ${snmp_conf_value[1]}
# set snmp location ${snmp_conf_value[2]}
# EOF

#loop through interface configuration
echo "CONFIGURING INTERFACES"
read -p "Number of interafaces: " interface_count
for index in {0..$interface_count}; do
  echo $index
done




