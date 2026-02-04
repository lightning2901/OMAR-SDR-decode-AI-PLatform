# listen-SDR-decode-AI
I want to use my rtl-sdr to listen radio, and ai to understand it 
# 1.- Understanding how this willl work
## To understand the architecture, check belof for the tree of how things are being build
![diagrama](Diagrama.png)

## Install the rtl-sdr software
##### dont : sudo apt install rtl-sdr
##### Instead we will use the setup.sh file, that file installs

### This will install the librtlsdr library, and command line tools such as rtl_sdr, rtl_tcp, rtl_fm, and rtl_test.

## Next, install the Python wrapper for librtlsdr using:

sudo pip install pyrtlsdr

### If you are using Ubuntu through WSL, on the Windows side download the latest Zadig and run it to install the “WinUSB” driver for the RTL-SDR (there may be two Bulk-In Interfaces, in which case install “WinUSB” on both). Unplug and replug the RTL-SDR once Zadig finishes.

### Next, you will need to forward the RTL-SDR USB device to WSL, first by installing the latest usbipd utility msi (this guide assumes you have usbipd-win 4.0.0 or higher), then opening PowerShell in administrator mode and running:

## (unplug RTL-SDR)
usbipd list
## (plug in RTL-SDR)
usbipd list
## (find the new device and substitute its index in the command below)
usbipd bind --busid 1-5
usbipd attach --wsl --busid 1-5

## Architecture
I've come up with the solution of creating setup tools in bash wich are responsible for preparing the system and enviroment of the reciever station (system), after it will create the virtual envieroment just and only to connect via internet to the core server wich will gain control of the system far away in order to make the system accesible far away.

## Things for completing on this process:
- Keep the system running and change config for the reset wich implies a demon running and/or crontab?
- DO NOT ask for any in place changes
- Quickly and automatically connect to the server to use wget to update the local data before starting the GET POST process for data excgange. 



