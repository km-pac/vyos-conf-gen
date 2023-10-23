#!/bin/bash

#Initial Router Setup

#This is where the config will be saved
rm -rf config.txt
touch config.txt

#title font config
heading_style=$(tput setaf 5)
highlight_style=$(tput setaf 2)
cyan_style=$(tput setaf 6)
warning_style=$(tput setaf 1)
bold=$(tput bold)
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
#     read -p "Set ${cyan_style}$syskey${reset_style}: " sys_values
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
#     read -p "Set ${cyan_style}$snmpkey${reset_style}: " snmp_value
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
# while [[ $ipv4_done != 'y' ]]
# do
#   clear
#   echo -e "${heading_style}======================================${reset_style}"
#   echo -e "${heading_style}\tCONFIGURING INTERFACES\t${reset_style}"
#   echo -e "${heading_style}======================================${reset_style}"
#   declare -a ipv4_values=()
#   read -p "Number of interafaces: " interface_count

  
#   for ((int = 0; int < interface_count; int++)); do
#     #VIF Configuration prompt
#     vif_done="n"
#     vif_add_done="y"

#     printf "\n"
#     read -p "Do you want to configure ${highlight_style}eth$int${reset_style} as VIF? [y/n]: " response
#     if [[ $response == "y" ]]
#     then
#       while [[ $vif_done != "y" ]]
#       do
#         #reset all the values if not satisfied with the vif configuration
#         vif_add_done="y"
#         declare -a temp_ipv4_vif_values=()
#         while [[ $vif_add_done != "n" ]]
#         do
#           printf "\n"
#           read -p "Set ${cyan_style}VIF number${reset_style}: " vif_id
#           read -p "Set ${cyan_style}VIF $vif_id${reset_style} as ${highlight_style}192.168.$vif_id.1/24${reset_style}? [y/n]: " def_net
#           if [[ $def_net == "y" ]]
#           then
#             temp_ipv4_vif_values+=("eth$int vif $vif_id address 192.168.$vif_id.1/24")
#             #ipv4_vif_values+=("eth$int vif $vif_id address 192.168.$vif_id.1/24")
#           else
#             read -p "Set ${cyan_style}IP Address${reset_style} for VIF $vif_id: " first_octet subnet_mask
#             temp_ipv4_vif_values+=("eth$int vif $vif_id address $first_octet.168.$vif_id.1/$subnet_mask")
#             #ipv4_vif_values+=("eth$int vif $vif_id address $first_octet.168.$vif_id.1/$subnet_mask")
#           fi
#           read -p "${bold}ADD another VIF? [y/n]: ${reset_style}" vif_add_done
#         done
        
#         #outputs the vif configuration
#         printf "\n"
#         for index in "${!temp_ipv4_vif_values[@]}"; do
#           echo "eth$int : ${highlight_style}${temp_ipv4_vif_values[$index]}${reset_style}"
#         done 
#         read -p "Are you satisfied with this VIF configuration for eth$int? [y/n]: " vif_done
#       done
    
#       for index in "${!temp_ipv4_vif_values[@]}"; do
#         ipv4_vif_values+=("${temp_ipv4_vif_values[$index]}")
#       done
      
#       printf "\n"

#     #configuration for normal ip assignment
#     else
#       read -p "Set ${cyan_style}First Octet and VLAN ID${reset_style} for ${highlight_style}eth$int${reset_style}: " first_octet vlan_id
#       if [[ $first_octet == 192 ]]
#       then
#         second_octet="168"
#         subnet_mask="24"
#       elif [[ $first_octet == 172 ]]
#       then
#         second_octet="16"
#         subnet_mask="30"
#       fi
      
#       read -p "Set ${cyan_style}eth$int${reset_style} as ${highlight_style}${first_octet}.${second_octet}.${vlan_id}.1/${subnet_mask}${reset_style}? [y/n]: " def_net 
#       if [[ $def_net == "y" ]]
#       then
#         ipv4_values+=("eth$int address ${first_octet}.${second_octet}.${vlan_id}.1/${subnet_mask}")
#       else
#         read -p "Set ${cyan_style}IP Address${reset_style} for ${highlight_style}eth$int${reset_style}: " ip_address subnet_mask
#         ipv4_values+=("eth$int address $ip_address/$subnet_mask")
#         if ! [[ $ip_address =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]
#         then
#           echo -e "${warning_style}Error: Not a valid IP Address please follow the syntax!\n${reset_style}"
#           #wrong input decrements the i. This allows the user to input an ip add on the same ethernet number
#           (( int-- ))
#         fi
#       fi
#     fi
#   done

#   #outputs the whole ipv4 address configuration
#   printf "\n"
#   declare -A eth_addresses

#   #interfaces with VIFs
#   for index in "${!ipv4_vif_values[@]}"; do
#     eth_addresses["$(echo ${ipv4_vif_values[$index]} | cut -d' ' -f1)"]+="$(echo ${ipv4_vif_values[$index]} | cut -d' ' -f5) "  
#     echo "${highlight_style}${ipv4_vif_values[$index]}${reset_style}"
#   done
#   #interfaces with ipv4 addresses only
#   for index in "${!ipv4_values[@]}"; do
#     eth_addresses["$(echo ${ipv4_values[$index]} | cut -d' ' -f1)"]+="$(echo ${ipv4_values[$index]} | cut -d' ' -f3) "
#     echo "${highlight_style}${ipv4_values[$index]}${reset_style}"
#   done

#   #DEBUGGING PRINTS IP ADDRESSES ASSOCIATED WITH ETHNUMS
#   # for key in "${!eth_addresses[@]}"; do
#   #   echo "Key: $key"
#   #   echo "Value: ${eth_addresses[$key]}"
#   # done
  
#   read -p "Are you satisfied with this IPv4 configuration? [y/n]: " ipv4_done
# done

# loop through firewall configuration
while [[ $firewall_done != 'y' ]]
do
  clear
  echo -e "${heading_style}======================================${reset_style}"
  echo -e "${heading_style}\tCONFIGURING FIREWALL\t${reset_style}"
  echo -e "${heading_style}======================================${reset_style}"
  read -p "Configure firewall rules? [y/n]: " firewall_done
  #option to skip firewall rule config
  if [[ $firewall_done == "n" ]]
  then
    break
  fi

  declare -A firewall_names
  declare -a rule_nums
  
  while [[ $firewall_add_done != "n" ]]
  do  
    while [[ $rule_num_add_done != "n" ]]
    do
      rule_num_done="n"
      while [[ $rule_num_done != "y" ]]
      do
        declare -a temp_rule_nums=()
        printf "\n"
        read -p "Set ${cyan_style}Rule Number${reset_style}: " rule_num
        read -p "Set ${cyan_style}Protocol${reset_style} for ${highlight_style}$rule_num${reset_style}: " protocol
        read -p "Set ${cyan_style}Source Address${reset_style} for ${highlight_style}$rule_num${reset_style}: " src_address
        read -p "Set ${cyan_style}Destination Address${reset_style} for ${highlight_style}$rule_num${reset_style}: " dest_address
        read -p "Set ${cyan_style}Destination Port Number${reset_style} for ${highlight_style}$rule_num${reset_style}: " port_num
        temp_rule_nums="RULE $rule_num : $protocol $src_address $dest_address $port_num"
        read -p "Are you satisfied with this rule number? [y/n]: " rule_num_done
      done

      rule_nums+=("${temp_rule_nums}")
      echo "${!rule_nums[@]}"
      
      read -p "${bold}ADD another Rule Number? [y/n]: ${reset_style}" rule_num_add_done
    done

    for index in "${!rule_nums[@]}"; do
      echo "${rule_nums[$index]}"
    done

    # for index in "${!temp_rule_nums[@]}"; do
    #   rule_nums+=("${temp_rule_nums}")
    # done

    # # echo ${rule_nums[@]}

    # for index in "${rule_nums[@]}"; do
    #   echo "${rule_nums[$index]}"
    # done


    # for key in "${!rule_nums[@]}"; do
    #   echo "Key: $key"
    #   echo "Value: ${rule_nums[$key]}"
    # done

    read -p "Are you satisfied with this firewall configuration? [y/n]: " firewall_add_done
  done

  # key: firewall_name values: rulenum
  # key: rulenum values: etc
  #   key = firewall name 
  #   values = 
  
  #   firewallname
  #     rulenum
  #       protocol 
  #       source
  #       dest
  #       destport
  done
  
  read -p "Are you satisfied with this Firewall configuration? [y/n]: " firewall_done
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
#   for index in "${!ipv4_vif_values[@]}"; do
#       echo "set interfaces ethernet ${ipv4_vif_values[$index]}"
#   done
# )

# $(
#   for index in "${!ipv4_values[@]}"; do
#       echo "set interfaces ethernet ${ipv4_values[$index]}"
#   done
# )
# EOF






