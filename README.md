# dynip
A super simple API to keep track of raspberry pis


### Coresponding script
```
!/bin/bash

temp=$(/opt/vc/bin/vcgencmd measure_temp | cut -d '=' -f 2)
ipaddress=$(ifconfig wlan0 | grep -Eo 'inet ([0-9]*\.){3}[0-9]*' | cut -d ' ' -f 2)


echo "Temp: $temp"
echo "localip: $ipaddress"

curl --data "id=5&name=timelaps&temp=$temp&internalIP=$ipaddress" http://IP:Port/pis/
```
