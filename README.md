# listen-SDR-decode-AI
I want to use my rtl-sdr to listen radio, and ai to understand it 

## Install the rtl-sdr software

sudo apt install rtl-sdr

### This will install the librtlsdr library, and command line tools such as rtl_sdr, rtl_tcp, rtl_fm, and rtl_test.

## Next, install the Python wrapper for librtlsdr using:

sudo pip install pyrtlsdr

### If you are using Ubuntu through WSL, on the Windows side download the latest Zadig and run it to install the “WinUSB” driver for the RTL-SDR (there may be two Bulk-In Interfaces, in which case install “WinUSB” on both). Unplug and replug the RTL-SDR once Zadig finishes.

## Next, you will need to forward the RTL-SDR USB device to WSL, first by installing the latest usbipd utility msi (this guide assumes you have usbipd-win 4.0.0 or higher), then opening PowerShell in administrator mode and running:

## (unplug RTL-SDR)
usbipd list
## (plug in RTL-SDR)
usbipd list
## (find the new device and substitute its index in the command below)
usbipd bind --busid 1-5
usbipd attach --wsl --busid 1-5



