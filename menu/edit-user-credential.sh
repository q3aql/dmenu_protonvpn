#!/bin/bash

################################################################
# Script for manage your ProtonVPN connections (Dmenu VERSION) #
# Last change: 29-05-2022                                      #
# Author: q3aql                                                #
# Contact: q3aql@duck.com                                      #
# License: GPL v2.0                                            #
################################################################
VERSION="2.0"
M_DATE="290522"

file_credentials="/opt/dmenu_protonvpn/proton-credentials.txt"
user_credentials="/opt/dmenu_protonvpn/proton-user.txt"
pass_credentials="/opt/dmenu_protonvpn/proton-pass.txt"

echo ""
echo -n "* User OpenVPN / IKEv2: " ; read user_openvpn
if [ -z "${user_openvpn}" ] ; then
  echo "# User canceled"
else
  echo "${user_openvpn}" > ${user_credentials}
fi
