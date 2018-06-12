#!/usr/bin/sh

# Terminate already running bar instances
#killall -q polybar

if ! killall -q polybar
then
    # Wait until the processes have been shut down
    while pgrep -x polybar >/dev/null; do sleep 1; done
fi

# since we use NetworkManager let's use it to snag our network interfaces in a platform agnostic fashon
export NM_ETHERNET_INTERFACE=$(nmcli device show | grep ethernet -B 1 | awk 'NR==1{print $2}')
export NM_WIFI_INTERFACE=$(nmcli device show | grep wifi -B 1 | awk 'NR==1{print $2}')

# deal with XRandR monitor name randomization
MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')

# Launch bar1 and bar2
#polybar example &

for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar example -c ~/.config/polybar/config & done

echo "Bars launched..."
