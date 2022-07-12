#!/usr/bin/env bash
#
# Raspberry Pi WiFi Checker
#
# Ping a device and if it fails, reboot the Pi.
#
# Author:    Michael Thompson <actionscripted@gmail.com>
# License:   MIT
# Requires:  None
# Usage:     ./rpi-wifi-checker.sh [setup]
# Version:   0.0.1


# Configuration w/safe defaults.
upstream_ip=127.0.0.1


# Related files
name_script=$(basename "$0" .sh)
path_config="/etc/${name_script}.conf"
path_log="/var/log/${name_script}.log"
path_script="/usr/local/bin/${name_script}.sh"


# To create files and reboot, sudo required.
if ! sudo true; then
    echo "ERROR: Unable to run via sudo! Cannot log or run properly."
    exit 1
fi


function setup_file {
    if [[ ! -f "$1" ]]; then
        sudo echo "$2" >> $1
        sudo chown root:adm $1
        sudo chown 775 $1
    fi
}

setup_file $path_config "upstream_ip=${upstream_ip}"
setup_file $path_log "# See ${path_script}"


# Setup cron, guide the user a bit.
if [[ "$1" == "setup" ]]; then
    #cron_task="*/5 * * * * /usr/bin/sudo -H ${path_script} /dev/null 2>&1"
    #( crontab -l | grep -v -F "$path_script" ; echo "$cron_task" ) | crontab -
    echo "Setup complete! Edit $path_config and set your upstream (router) IP"
fi


# Load config.
source $path_config

# Ping upstream device.
ping -c4 $upstream_ip > /dev/null

# If we had errors pinging, log and reboot.
if [ $? != 0 ]; then
    echo "[$(date)]: Upstream ($upstream_ip) not found via ping; rebooting." >> $path_log
    sudo /sbin/shutdown -r now
fi
