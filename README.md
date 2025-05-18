# Dell-T640-fan-speed
Adjust Dell T640 fan speed when unauthorized GPU is installed

Dell T640 fans run at max speed when unauthorized GPU is installed. The fan speed has to be adjusted manually to reduce noise.

Manual fan speed adjustment is NOT available when iDrac version > 3.30.30.30<br>
So the first step is downgrade iDrac to version 4.40.10.00, then downgrade to version 3.30.30.30.<br>
https://www.dell.com/support/kbdoc/en-us/000190151/idrac9-firmware-downgrade-failures-rac0181<br>
Then use fanpseed.sh to adjust fan speed according to GPU temprature.<br>

This script depend on nvidia-smi, datamash, ipmitool.

nvidia-smi is used to get GPU temprature.<br>
datamash is used to get the max temprature from all cards.<br>
ipmitool is used to send the fan adjustment command.<br>
ipmitool raw 0x30 0x30 0x01 0x00 # adjust fan speed by iDrac<br>
ipmitool raw 0x30 0x30 0x01 0x01 # adjust fan speed manually<br>
ipmitool raw 0x30 0x30 0x02 0xff 0x64 #the last 0x64 mean 100% fan speed, 0x00 means 0% fan speed.

Enjoy!

Referrence: https://www.bilibili.com/opus/826964861583884344
