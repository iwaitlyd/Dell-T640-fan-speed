# Dell-T640-fan-speed
Adjust Dell T640 fan speed when unauthorized GPU is installed

Dell T640 fans run at max speed when unauthorized GPU (e.g. 3090) is installed. The fan speed has to be adjusted manually to reduce noise.

Manual fan speed adjustment is NOT available when iDrac version > 3.30.30.30<br>
So the first step is downgrade iDrac to version 4.40.10.00, then downgrade to version 3.30.30.30.<br>
https://www.dell.com/support/kbdoc/en-us/000190151/idrac9-firmware-downgrade-failures-rac0181<br>
Then use fanpseed.sh to adjust fan speed according to GPU temprature.<br>

This script depend on nvidia-smi, datamash, ipmitool.

nvidia-smi is used to get all GPUs' temprature.<br>
datamash is used to get the max temprature from all cards.<br>
ipmitool is used to send the fan adjustment command.<br>
ipmitool raw 0x30 0x30 0x01 0x00 # adjust fan speed by iDrac<br>
ipmitool raw 0x30 0x30 0x01 0x01 # adjust fan speed manually<br>
ipmitool raw 0x30 0x30 0x02 0xff 0x64 #change fan speed, the last 0x64 mean 100% fan speed, 0x00 means 0% fan speed.

Enjoy!

Referrence: https://www.bilibili.com/opus/826964861583884344

# Dell-T640-风扇速度
戴尔T640安装未授权GPU(如3090等)时，调整风扇速度

如果安装了不在支持列表的GPU时，戴尔T640的风扇会全速运行，需要手动调整风扇速度以降低噪音。

iDrac版本大于3.30.30.30时无法手动调整风扇转速<br>
因此需要降级iDrac版本到4.40.10.00, 再降到3.30.30.30.<br>
https://www.dell.com/support/kbdoc/en-us/000190151/idrac9-firmware-downgrade-failures-rac0181<br>
然后用脚本fanpseed.sh根据GPU温度调整风扇转速.<br>

这个脚本有以下依赖：nvidia-smi, datamash, ipmitool.

nvidia-smi用来读取所有GPU的温度.<br>
datamash用来找到多卡的最高温度.<br>
ipmitool用来发送调整转速命令.<br>
ipmitool raw 0x30 0x30 0x01 0x00 # iDrac控制转速<br>
ipmitool raw 0x30 0x30 0x01 0x01 # 用户控制转速<br>
ipmitool raw 0x30 0x30 0x02 0xff 0x64 #设置转速, 最后的0x64是100%转速, 0x00是0%转速.

Enjoy!

参考: https://www.bilibili.com/opus/826964861583884344
