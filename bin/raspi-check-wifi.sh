#!/usr/bin/env bash
#
# Raspberry Pi WiFi Checker
#
# Ping a device and if it fails, reboot the Pi.
#
# Author:    Michael Thompson <actionscripted@gmail.com>
# License:   MIT
# Requires:  None
# Usage:     ./raspi-check-wifi.sh [setup]
# Version:   0.0.1


# Configuration w/safe defaults.
cron_schedule="*/5 * * * *"
script_name=$(basename "$0" .sh)
upstream_ip=127.0.0.1

# Related files
path_config="/etc/${script_name}.conf"
path_log="/var/log/${script_name}.log"
path_script="/usr/local/bin/${script_name}.sh"


# Load config, ping upstream, reboot if errors.
function check_upstream {
    source $path_config

    ping -c4 $upstream_ip > /dev/null

    if [ $? != 0 ]; then
        echo "[$(date)]: Upstream ($upstream_ip) errors via ping; rebooting." >> $path_log
        /sbin/shutdown -r now
    fi
}


# Install cron task if not present.
function setup_cron {
    cron_task="${cron_schedule} ${path_script} /dev/null 2>&1"
    ( crontab -l | grep -v -F "$path_script" ; echo "$cron_task" ) | crontab -
}


# Setup config and log files if not present.
function setup_files {
    function setup_file {
        if [[ ! -f "$1" ]]; then
            echo "$2" >> $1
            chown root:adm $1
            chmod 775 $1
        fi
    }

    setup_file $path_config "upstream_ip=${upstream_ip}"
    setup_file $path_log "# See ${path_script}"
}


if [[ $(id -u) -ne 0 ]] ; then
    echo "Must run as root. Try \"sudo ./${script_name}.sh\""
    exit 1
fi

if [[ "$1" == "setup" ]]; then
    setup_cron
    setup_files
    echo "Setup complete! Edit $path_config and set your upstream (router) IP"
fi

if [[ "$1" == "check" ]]; then check_upstream; fi
