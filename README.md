# Raspberry Pi Check Upstream

Setup a task via Cron that will reboot your Pi when it loses connection to an upstream device. Log when it reboots so you can see when things happen.

Originally created to help with the Pi dropping wifi. Based on https://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/

## Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ActionScripted/raspi-check-upstream/main/install.sh)"
```

Now edit `/etc/raspi-check-upstream.conf` and set it to the upstream IP to check. This will usually be a router on your local network at `10.0.0.1` or `192.168.1.1`.

## Usage

Everything after installing is automatic! But here are available commands:

```bash
# Manually check/reboot (this is what runs via cron)
raspi-check-upstream check

# Show reboot logs
raspi-check-upstream logs

# Re-run setup
raspi-check-upstream setup

# Remove everything
raspi-check-upstream uninstall
```

## License

[MIT](LICENSE)
