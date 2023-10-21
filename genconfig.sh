#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
rm -rf config.txt
touch config.txt

#title font config
heading_style=$(tput setaf 5)
highlight_style=$(tput setaf 2)
warning_style=$(tput setaf 1)
reset_style=$(tput sgr0)

# #array of system and snmp configuration
# declare -a sys_conf_key=("sys_hostname" "sys_timezone" "sys_banner" "sys_ntp")
# declare -a snmp_conf_key=("snmp_community" "snmp_contact" "snmp_location")

# # loop through different system configuration
# while [[ $sys_done != "y" ]]
# do
#   clear
#   echo -e "\n${heading_style}================================================${reset_style}"
#   echo -e "${heading_style}\tCONFIGURING SYSTEM CONFIGURATION\t${heading_style}"
#   echo -e "${heading_style}================================================${reset_style}"
#   declare -a sys_conf_values=()
#   for syskey in ${sys_conf_key[@]}; do
#     #sys_ntp config is optional;
#     if [[ $syskey == "sys_ntp" ]]
#     then
#         read -e -p "\nDo you want to set the NTP Server? [y/n]: " response
#         if [[ $response == "n" ]]
#         then
#           echo -e "Skipping NTP Server setup\n"
#           break
#         fi
#     fi
#     read -p "Set ${highlight_style}$syskey${reset_style}: " sys_values
#     sys_conf_values+=("$sys_values")
#   done
#   #outputs the set system configuration
#   for index in "${!sys_conf_key[@]}"; do
#       sys_key="${sys_conf_key[$index]}"
#       sys_values="${sys_conf_values[$index]}"
#       echo "$sys_key : ${highlight_style}$sys_values${reset_style}"
#   done
#   #confirm if satisfied with the configuration set
#   read -p "Are you satisfied with this SYS configuration? [y/n]: " sys_done
# done

# # loop through different snmp configuration
# while [[ $snmp_done != "y" ]]
# do
#   clear
#   echo -e "\n${heading_style}=========================================${reset_style}"
#   echo -e "${heading_style}\tCONFIGURING SNMP SERVICES\t${reset_style}"
#   echo -e "${heading_style}=========================================${reset_style}"
#   declare -a snmp_conf_values=()
#   for snmpkey in ${snmp_conf_key[@]}; do
#     read -p "Set ${highlight_style}$snmpkey${reset_style}: " snmp_value
#     snmp_conf_values+=("$snmp_value")
#   done
#   #outputs the set system configuration
#   for index in "${!snmp_conf_key[@]}"; do
#       snmp_key="${snmp_conf_key[$index]}"
#       snmp_values="${snmp_conf_values[$index]}"
#       echo "$snmp_key : ${highlight_style}$snmp_values${reset_style}"
#   done
#   #confirm if satisfied with the configuration set
#   read -p "Are you satisfied with this SNMP configuration? [y/n]: " snmp_done
# done

# loop through interface configuration
while [[ $ipv4_done != 'y' ]]
do
  clear
  echo -e "${heading_style}\n======================================${reset_style}"
  echo -e "${heading_style}\tCONFIGURING INTERFACES\t${reset_style}"
  echo -e "${heading_style}======================================${reset_style}"
  declare -a ipv4_values=()
  read -p "Number of interafaces: " interface_count

  for ((int = 0; int < interface_count; int++)); do
    #VIF Configuration prompt
    read -p "Do you want to configure ${highlight_style}eth$int${reset_style} as VIF? [y/n]: " response
    if [[ $response == "y" ]]
    then
      while [[ $vif_done != "y" ]]
      do
        while [[ $vif_add_done != "n" ]]
        do
          read -p "Set VIF number: " vif_id
          read -p "Set VIF $vif_id as 192.168.$vif_id.1/24? [y/n]: " def_net
          if [[ $def_net == y ]]
          then
            ipv4_values+=("eth$int vif $vif_id address 192.168.$vif_id.1/24")
          else
            read -p "Set IP Address for VIF $vif_id: " first_octet subnet_mask
            ipv4_values+=("eth$int vif $vif_id address $first_octet.168.$vif_id.1/$subnet_mask")
          fi
          (( vif_count++ ))
          "${int}_vif_count"=vif_count
          read -p "Do you want to ADD another VIF? [y/n]: " vif_add_done
          printf "\n"
        done
        for index in "${!ipv4_values[@]}"; do
          ipv4_address="${ipv4_values[$index]}"
          echo "eth$int : ${highlight_style}$ipv4_address${reset_style}"
        done
        read -p "Are you satisfied with this VIF configuration for eth$int? [y/n]: " vif_done
      done
      echo $int_vif_count
    fi
    
    # elif
    # then
    #   read -p "IP Address for ${highlight_style}eth$int${reset_style}: " first_octet vlan_id subnet_mask
    #   if [[ $first_octet == "192" ]]
    #   then
    #     ipv4_values+=("address $first_octet.168.$vlan_id.1/$subnet_mask")
    #   elif [[ $first_octet == "172" ]]
    #   then
    #     ipv4_values+=("address $first_octet.16.$vlan_id.1/$subnet_mask")
    #   else
    #     echo -e "${warning_style}Error: Not a valid IP Address please follow the syntax!\n${reset_style}"
    #     #wrong input decrements the i. This allows the user to input an ip add on the same ethernet number
    #     (( int-- ))
    #   fi
    # fi
  done
  
  for index in "${!ipv4_values[@]}"; do
      ipv4_address="${ipv4_values[$index]}"
      echo "eth$int : ${highlight_style}$ipv4_address${reset_style}"
  done

  # for eth in "${!ipv4_values[@]}"; do
  #   for 
  # done
  read -p "Are you satisfied with this IPv4 configuration? [y/n]: " ipv4_done
done

#ouputs the config file for the VYOS Router
# cat << EOF > config.txt
# set system host-name ${sys_conf_values[0]}
# set system time-zone ${sys_conf_values[1]}
# set system login banner post-login ${sys_conf_values[2]}
# set system login banner pre-login ${sys_conf_values[2]}
# set system ntp server ${sys_conf_values[3]}

# set snmp community ${snmp_conf_values[0]}
# set snmp contact ${snmp_conf_values[1]}
# set snmp location ${snmp_conf_values[2]}

# $(
#   for index in "${!ipv4_values[@]}"; do
#       echo "set interfaces ethernet eth$index ${ipv4_values[$index]}"
#   done
# )
# EOF






