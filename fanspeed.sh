#!/bin/bash
date
# Initialize previous temperature to 30
PREV_TEMP=30

#try if nvidia-smi works, auto mean controlled by ipmi (full speed)
if ! nvidia-smi > /dev/null
 then
  echo auto
  ipmitool raw 0x30 0x30 0x01 0x01
  exit 1
 else
  echo manual
  ipmitool raw 0x30 0x30 0x01 0x00
  ipmitool raw 0x30 0x30 0x02 0xff 0x28
  # start with low speed
fi

while [ 1 ]
do
#echo newloop
 #try if nvidia-smi works
 if ! nvidia-smi > /dev/null
  then
   echo auto
   ipmitool raw 0x30 0x30 0x01 0x01
   exit 1
 fi

 #get max temprature of GPUs
 TEMP=$( nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader | datamash max 1)
#echo $PREV_TEMP
#echo $TEMP

 #adjust fan speed
 if [ $PREV_TEMP -lt 50 ]
   then
     if [ $TEMP -gt 50 ]
       then
         echo turnup
         ipmitool raw 0x30 0x30 0x02 0xff 0x64
#       else
#         echo keep
       #else temp < 50 keep the same
     fi
   else
   #prev_temp > 50
     if [ $TEMP -lt 50 ]
       then
         echo turndown
         ipmitool raw 0x30 0x30 0x02 0xff 0x28
#       else
#         echo keep
     #else temp > 50 keep the same
     fi
  fi
 PREV_TEMP=$TEMP
 sleep 30
done
