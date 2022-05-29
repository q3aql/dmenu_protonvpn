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
echo -n "* Password OpenVPN / IKEv2: " ; read pass_openvpn
if [ -z "${pass_openvpn}" ] ; then
  echo "# Pass canceled"
else
  echo "${pass_openvpn}" > ${pass_credentials}
fi
