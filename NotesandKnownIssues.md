--- This software relies on the Xilinx Linux Kernel located at www.github.com/Xilinx/linux-xlnx
		With specific tag v2017.2.  This software may work with other version of Petalinux and
		the Xilinx Kernel, but has only been tested and developed on 2017.2

---	The "&" operator cannot be used in the device tree overlays
		--- Interrupt controller must be referenced by phandle
		--- Clock sources must be referenced by phandle
		--- Overlays must specify a 'target-path' rather than a 'target'

--- Uart 16550 is used over UartLite
		--- Allows for the change of baud rates in software

--- GPIO and PWM devices must be listed as compatible = "generic-uio"
		--- GPIO devices must be contain "xlnx,is-dual" and "xlnx,gpio-width" fields
				These fields are included in the generated device tree by meta-xilinx
				when generating from a .hdf file
		--- Currently only one GPIO device and one PWM device are supported at one time.
		--- Additionally, these must be the first two "generic-uio" devices listed in the
				the device tree
		--- The PWM hardware supported by this library is "PWMv2.0" which is provided by
				Digilent and can be found at www.github.com/Digilent/vivado-library
		--- GPIO devices must appear as gpio@********* in the device tree, where '********'
				is the valid memory address assigned in Vivado.

--- There may be compatibility issues with SPI and the power management in the kernel
		--- Can be solved be unselecting CONFIG_SUSPEND in the kernel options.
			 	Unselecting CONFIG_SUSPEND will automatically deselect CONFIG_RUNTIME_PM
			 	which is the culprit in any issues with the SPI device driver

--- Bitstreams must be loaded before loading the applicable overlays

--- The provided scripts can be used for loading overlays and bitstreams
		--- The relevant files must be in /lib/firmware for the scripts to work
			--- Usage Notes:
				./bitstream.sh someBitStream.bit 		Loads the bitstream onto the FPGA
				./overlay.sh load someOverlay.dtbo 		Loads the specified overlay
				./overlay.sh unload someOverlay.dtbo 	Unloads the specified overlay

---	To work with device tree overlays, the most recent version of dtc is recommended
		These versions can be found at https://git.kernel.org/pub/scm/utils/dtc/dtc.git
		--- Overlays must follow a specific format using the /plugin/ property
				and are compiled with the '-@' flag

--- Spi ports in /dev/spidev****.* are populated starting at 32766. Thus the first spi device
		loaded via overlay will appear as /dev/spidev32766.0, the next will appear as /dev/spidev32765.0
		and so on.

--- Spi masters and slaves can be loaded at the same time. However, this may bring about kernel issues
		when both are unloaded at the same time. The best practice is to first load the spi masters.
		Then, in a seperate overlay, load the spi slaves. When the time comes to unload the overlays, 
		first unload the spi slaves before unloading the spi masters.

--- Spi transfer speeds are linked to the hardware design in Vivado. It is not possible to change
		the Spi transfer speeds from software. These transfer speeds are linked to the clock
		which is fed to the "ext spi clock" port in block design and then divided down in the 
		IP configuration menu. Additionally, it will be helpful to the user to specify this speed
		in the device tree for the SPI slave to be used using the "spi-max-frequency" property.

--- Max Number of Devices Supported:
		--- Uart16550 		10
		--- I2C 			10
		--- SPI 			10
		--- PWMv2.0 		1		This PWM device supports multiple channels. The number of channels to be used is set in Vivado
		--- GPIO 			1		The GPIO device can be dual-channel for a max # of GPIOS set to 64 (32 GPIOs / channel)