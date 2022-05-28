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

function insertCredentials() {
  if [ -f "${1}" ] ; then
    check_credentials=$(cat "${1}" | grep "auth-user-pass ${file_credentials}")
    if [ -z "${check_credentials}" ] ; then
     sed -i "s/auth-user-pass/auth-user-pass ${sed_file_credentials}/g" "${1}"
    fi
  fi
}

function checkFileCredentials() {
  check_file=$(cat ${file_credentials} 2> /dev/null | wc -l)
  if [ ${check_file} -ne 2 ] ; then
    editCredentials
  fi
}

function checkFileCredentials() {
  check_file=$(cat ${file_credentials} 2> /dev/null | wc -l)
  if [ ${check_file} -ne 2 ] ; then
    editCredentials
  fi
}

clear
echo ""
echo -e "${green}* dmenu_protonvpn${end}${purple} v${VERSION} ${end}${green}(${M_DATE})${end}"
echo ""
echo -e "${purple}+ URL Credentials:${end}${yellow} ${url_credentials}${end}"
echo ""
echo -ne "${green}* User OpenVPN / IKEv2:${end} " ; read user_openvpn
echo -ne "${green}* Password OpenVPN / IKEv2:${end} " ; read pass_openvpn
if [ -z "${user_openvpn}" ] ; then
 echo "# User / Password canceled" 
else
  echo "${user_openvpn}" > ${file_credentials}
  echo "${pass_openvpn}" >> ${file_credentials}
fi

