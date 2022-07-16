#!/usr/bin/env bash
#
# Raspberry Pi Check Upstream Installer
#
# Intall script, setup things.
#
# Author:    Michael Thompson <actionscripted@gmail.com>
# License:   MIT
# Requires:  None
# Usage:     ./install.sh
# Version:   0.0.1


script_name="raspi-check-upstream"
script_remote="https://raw.githubusercontent.com/ActionScripted/raspi-check-upstream/main/${script_name}"

echo "Downloading and installing; you may be prompted for your password (sudo)."

# Download
curl -s ${script_remote} -O

# Install
chmod a+x ${script_name}
sudo mv ${script_name} /usr/local/bin/

# Setup
sudo /usr/local/bin/${script_name} setup
