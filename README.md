# raspberry-pi-wifi-checker

**Raspberry Pi WiFi dropping? Keep it alive, automatically!** Automatically setup a scheduled task via Cron that will reboot your Pi when it loses connection to your router. Log when it reboots, so you can see when things happen.

_Based on https://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/_

## Setup

```
# Initial Rust tomfoolery
brew install rustup-init
rustup-init

# Target, linker, et al. for ARM (raspi)
# TODO: what is really needed here?
# https://amritrathie.vercel.app/posts/2020/03/06/cross-compiling-rust-from-macos-to-raspberry-pi/
brew install gcc
brew tap osx-cross/arm
brew install arm-gcc-bin
brew install arm-linux-gnueabihf-binutils
rustup target add armv7-unknown-linux-gnueabihf
```

## Usage

TODO

## License

TODO
