# Raspberry Pi Check Upstream

Setup a task via Cron that will reboot your Pi when it loses connection to an upstream device. Log when it reboots so you can see when things happen.

Originally created to help with the Pi dropping wifi. Based on https://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/

## Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ActionScripted/raspi-check-upstream/main/install.sh)"
sudo /usr/local/bin/raspi-check-upstream.sh setup
```

## License

[MIT](LICENSE)
