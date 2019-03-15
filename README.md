# dynip
A super simple API to keep track of raspberry pis


## Scripts
`updateIP.sh`
```bash
#!/bin/bash

SERVER=http://dynip.vapor.cloud/pis/

temp=$(/opt/vc/bin/vcgencmd measure_temp | cut -d '=' -f 2)
ipaddress=$(ifconfig wlan0 | grep -Eo 'inet ([0-9]*\.){3}[0-9]*' | cut -d ' ' -f 2)

curl --data "id=2&name=timelapse&temperature=$temp&internalIP=$ipaddress" $SERVER
```

`capturetimelapse.sh`
```bash
#!/bin/bash

DATE=$(date +"%Y-%m-%d")
DATETIME=$(date +"%Y-%m-%d_%H%M")
raspistill -w 1920 -h 1080 -o /home/pi/timelapse/images/$DATETIME.jpg

gpio write 24 1 # Give LED indication while uploading
cd '/home/pi/timelapse/images'
wput -t 2 --remove-source-files ./* ftp://IP/PATH/$DATE/
gpio write 24 0
```

 `checkInternet.sh` Script for cheking internet access
```bash
#!/bin/bash

gpio mode 23 out
gpio mode 24 out
gpio mode 25 out

wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo "Online"
    gpio write 23 1
    gpio write 25 0
else
    echo "Offline"
    gpio write 23 0
    gpio write 25 1
fi
```

