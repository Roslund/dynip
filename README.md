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

