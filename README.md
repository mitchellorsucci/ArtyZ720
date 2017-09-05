# ArtyZ20

There is how to use the project on this REPO

1) format a microSD card with two partitions
    - a partition about 0.5GB formatted as FAT32
    - the rest of the SD card set as ext4
2) Copy image.ub and BOOT.BIN into the FAT32 partition
3) Copy the image of the filesystem found here - (https://s3-us-west-2.amazonaws.com/digilent/Software/ArtyZ7/LinuxImages/ArtyZ7.ext4) using the "dd" command. Use "sudo lsblk" to discover the node of the second partition to use. The command would be "sudo dd if=ArtyZ7.ext4 of=/dev/sd****" where "****" is the specific node you are trying to write to.
4) Connect a live Ethernet cable to the Ethernet port. This is how the ArtyZ7 will obtain an IP address and how you can access the Arty
5) Connect a USB cable to the PROG/UART port to monitor the boot messages.
6) Insert the microSD card into the ArtyZ720 and apply power. 7-12v is recommended.
7) Open a console or terminal port associated with the USB/UART port to find the ip address associated with the linux OS. It will appear towards the end of the boot messages. It should be 10.16.9.65.
8) SSH into the ArtyZ7 from a host computer. "ssh root@the_provided_ip_address". The password is "root".
9) Type "overlay.sh load ArtyHW.dtbo"
10) Type "overlay.sh load spichild.dtbo"
11) Assuming that there is a PmodOLED_RGB attached to JB and a PmodCDC1 attached to JA using pull-up resistors, connect O1 of the CDC1 to IO4 and O2 to IO5.
12) Type "ArtyZ720demo". The demo will run after this. The OledRGB will display which buttons are activated on the CDC1 and corresponding LEDS will light up.
