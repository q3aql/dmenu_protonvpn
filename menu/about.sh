#!/bin/bash

################################################################
# Script for manage your ProtonVPN connections (Dmenu VERSION) #
# Last change: 28-05-2022                                      #
# Author: q3aql                                                #
# Contact: q3aql@duck.com                                      #
# License: GPL v2.0                                            #
################################################################
VERSION="2.0"
M_DATE="280522"

# Variables
protonFiles="${HOME}/protonFiles"
url_download="https://account.protonvpn.com/downloads"
url_credentials="https://account.protonvpn.com/account#openvpn"
file_credentials="/opt/dmenu_protonvpn/proton-credentials.txt"
sed_file_credentials="\/opt\/dmenu_protonvpn\/proton-credentials.txt"
menu_files="/opt/dmenu_protonvpn/menu"

case "${TERM}" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ "${color_prompt}" == "yes" ] ; then
  blue='\e[34m' ; red='\e[31m' ; yellow='\e[33m'
  purple='\e[35m' ; green='\e[32m' ; end='\e[0m'
else
  blue='' ; red='' ; yellow='' ; morado=''
  verde='' ; end=''
fi

clear
echo ""
echo -e "${green}* About:${end}"
echo ""
echo -e " ${red}-${end} ${green}Software:${end}${purple} dmenu_protonvpn ${VERSION} (${M_DATE})${end}"
echo -e " ${red}-${end} ${green}Author:${end}${purple} q3aql${end}"
echo -e " ${red}-${end} ${green}Contact:${end}${purple} q3aql@duck.com${end}"
echo -e " ${red}-${end} ${green}License:${end}${purple} GPL v2.0${end}"
echo ""
echo -ne "${green}+ Press ${end}${purple}ENTER${end}${green} to return menu${end} " ; read return 
