#!/bin/bash
#
# Copyright (c) 2024 JetStream Software Inc. <legal@jetstreamsoft.com>
#
# Download the IDA RPMs from repo and initialize.
#
# Usage:
# [admin@fs123-alma9]$ bash initializeIda.sh <comma separated list of links to RPMs> 
if [ -z $1 ]
then
    echo "No list of RPMs specified"
    echo "Usage: "
    echo "[admin@fs123-alma9]$ bash initializeIda.sh <RPM1_link,RPM2_link>"
    exit 1
fi

sudo dnf install wget -y
sudo dnf install epel-release -y

rpms=(${1//,/ })
for rpm in "${rpms[@]}"; do
    wget $rpm
    rpmFileName=$(basename $rpm)
    sudo dnf install $rpmFileName -y
done
