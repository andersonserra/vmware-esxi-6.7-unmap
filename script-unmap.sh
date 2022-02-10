#!/bin/sh
# AUTOR: ANDERSON SERRA
# Contact: anderson.silva.serra@gmail.com
# DATA: 09/02/2022
# ESXi version: VMware ESXi 6.7
# Instagram: @awksolutions
#
# Description:
# Script for reclaim space datastores with VMFS5
# UNMAPcreate source file with volumes labels datastores: /opt/scripts/unmap/volume_label

##################################################
# Variables Declaration
##################################################

ESXCLI="/bin/esxcli"
WORKDIR="/opt/scripts/unmap"
OUTPUT="$WORKDIR/output.txt"


if [ -d "$WORKDIR" ]; then
  # Take action if $DIR exists. #
  echo "Starting process unmap datastores..."
else
  echo "Folder does not exist! Creating folder!"
  mkdir $WORKDIR
fi

#In this step you need atencion for choose only specifics datastores. Use command:   egrep -v "(pattern1|pattern2|...)"
#Filter only datastores VMFS datastores, or specifics datastores:
$ESXCLI storage vmfs extent list |egrep -v "(ignore_examples1|ignore_examples2|UUID|-------------)" | awk '{print $1}' > $WORKDIR/volume_label


echo "" > $OUTPUT
echo "PATH NAME,START,END" >> $OUTPUT
for pathname  in `cat $WORKDIR/volume_label`;
do
  starttime=$(date +"%Y-%m-%d %H:%M:%S")
  $ESXCLI storage vmfs unmap -l $pathname
  wait
  endtime=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$pathname,$starttime,$endtime" >> $OUTPUT
done


