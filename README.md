# Dell-T640-fan-speed
Adjust Dell T640 fan speed when unauthorized GPU is installed

Dell T640 fans run at max speed when unauthorized GPU is installed. The fan speed has to be adjusted manually to reduce the noise.

Manual fan speed adjustment is NOT available when iDrac version > 3.30.30.30
So the first step is downgrade iDrac to version 3.30.30.30.
Then use fanpseed.sh to adjust fan speed according to GPU temprature.

This script depend on nvidia-smi, datamash, ipmitool.
nvidia-smi is used to get GPU temprature.
datamash is used to get the max temprature from all cards.
ipmitool is used to send the fan adjust command. 
ipmitool raw 0x30 0x30 0x01 0x00 # adjust fan speed by iDrac
ipmitool raw 0x30 0x30 0x01 0x01 # adjust fan speed manually
ipmitool raw 0x30 0x30 0x02 0xff 0x64 #the last 0x64 mean 100% fan speed, 0x00 means 0% fan speed.

Enjoy!
