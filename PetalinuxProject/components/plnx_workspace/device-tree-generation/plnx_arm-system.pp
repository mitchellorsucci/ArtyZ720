# 1 "/home/mitchellorsucci/ptlnproj/overlay/build/../components/plnx_workspace/device-tree-generation/system-top.dts"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/mitchellorsucci/ptlnproj/overlay/build/../components/plnx_workspace/device-tree-generation/system-top.dts"







/dts-v1/;
/include/ "zynq-7000.dtsi"
/include/ "pl.dtsi"
/include/ "pcw.dtsi"
/ {
 chosen {
  bootargs = "earlycon";
  stdout-path = "serial0:115200n8";
 };
 aliases {
  ethernet0 = &gem0;
  serial0 = &uart1;
  serial1 = &axi_uart16550_1;
  serial2 = &uart0;
  serial3 = &axi_uart16550_0;
  spi0 = &qspi;
  spi1 = &SPI_OLED;
  spi2 = &SPI_Shield;
 };
 memory {
  device_type = "memory";
  reg = <0x0 0x20000000>;
 };
 cpus {
 };
};
# 1 "/home/mitchellorsucci/ptlnproj/overlay/build/tmp/work/plnx_arm-xilinx-linux-gnueabi/device-tree-generation/xilinx+gitAUTOINC+94fc615234-r0/system-user.dtsi" 1
/include/ "system-conf.dtsi"
/ {

 model = "Zynq ARTY Z7 Development Board";
 compatible = "digilent,zynq-artyz7", "xlnx,zynq-7000";
 /delete-node/ amba_pl;

 xlnk {
  compatible = "xlnx,xlnk-1.0";
 };

 chosen {
  bootargs = "console=ttyPS0,115200 earlyprintk root=/dev/mmcblk0p2 dyndbg=\"func bus_add_driver +p\" dyndbg=\"func driver_prove_device +p\" dyndbg=\"func of_platform_bus_create +p\" dyndbg=\"func really_probe +p\" rw rootwait uio_pdrv_genirq.of_id=generic-uio
  dyndbg=\"func device_add +p\" dyndbg=\"func driver_probe_device +p\" dyndbg=\"func driver_bound +p\" dyndbg=\"func deferred_probe_work_func +p\" dyndbg=\"func driver_deferred_probe_add +p\"
  dyndbg=\"func driver_deferred_probe_del +p\"";
 };

 aliases {
  serial0 = &uart0;
  serial1 = &uart1;
  ethernet0 = &gem0;
  spi0 = &qspi;
  spi1 = "/axi_quad_spi@41e10000";
  spi2 = "/axi_quad_spi@41e00000";
  serial2 = "/serial@42c00000";
  serial3 = "/serial@42c30000";
  serial4 = "/serial@e0000000";
  serial5 = "/serial@42c10000";
  serial6 = "/serial@43c10000";
  serial7 = "/serial@43c20000";
 };

 usb_phy0: usb_phy@0 {
  compatible = "ulpi-phy";
  #phy-cells = <0>;
  reg = <0xe0002000 0x1000>;
  view-port = <0x0170>;
  drv-vbus;
 };


};

&qspi {
 u-boot,dm-pre-reloc;
};

&flash0 {
 compatible = "micron,m25p80", "s25fl128s";
};

&gem0 {
 phy-handle = <&ethernet_phy>;

 ethernet_phy: ethernet-phy@0 {
 reg = <1>;
 device_type = "ethernet-phy";
 };
};

&usb0 {
 usb-phy = <&usb_phy0>;
 /delete-property/ usb-reset;
};

&sdhci0 {
 u-boot,dm-pre-reloc;
};

&uart0 {
 u-boot,dm-pre-reloc;
 port-number = <0>;
};

&uart1 {
 port-number = <1>;
};
# 34 "/home/mitchellorsucci/ptlnproj/overlay/build/../components/plnx_workspace/device-tree-generation/system-top.dts" 2
