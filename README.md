# dynip
A super simple API to keep track of raspberry pis


### Coresponding script
```bash
!/bin/bash

temp=$(/opt/vc/bin/vcgencmd measure_temp | cut -d '=' -f 2)
ipaddress=$(ifconfig wlan0 | grep -Eo 'inet ([0-9]*\.){3}[0-9]*' | cut -d ' ' -f 2)


echo "Temp: $temp"
echo "localip: $ipaddress"

curl --data "id=5&name=timelaps&temp=$temp&internalIP=$ipaddress" http://IP:Port/pis/
```

### Script for taking images and sending to ftp server

```bash
#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H%M")
raspistill -o /home/pi/timelapse/images/$DATE.jpg

cd '/home/pi/timelapse/images'
wput --remove-source-files ./* ftp://IP/timelapse/testing/
```
