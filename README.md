
# Stm32H723NucleoPtpExample
There is no ST provided or even user contributed Stm32H7 PTP example.

I cobbled this one together to get more visibility on issues in ST's Eth driver, and as a reference for others struggling with the same issues I did.

This is based on the Stm32H723 Nucleo LWIP HTTP Socket server from ST's examples. I wanted to start with a foundation which would be the most universally applicable and familiar with everyone, so this seemed like the best choice. You should be able to simply build and run this on your unmodified Stm32H723 Nucleo.

The PTP code is based on work  from this repo: https://github.com/mpthompson/stm32_f4_ptpd. I took the PTPD port, cleaned it up just slightly, and then included it in here.

I did tweak the Eth RX buffer config in this project a bit from the stock HTTP server project. Because PTP packs the timestamp into a separate descriptor (a context descriptor), timestamping is descriptor usage heavy (each packet which would otherwise consume n descriptors now consumes n + 1 for the timestamp in the context descriptor). So, I increased the number of descriptors and number of buffers to avoid allocation and descriptor availability issues,

# Quickstart
* Flash this example to an Stm32H723-Nucleo
* Start PTPD on some host on the network with `sudo ptpd -i <eth interface name> -M -E`
* Connect to the Nucleo debugger's VCP port with serial settings: 4000000 baud, 8n1 
* Watch for messages showing the PTP offset and sync status
	* You'll first see state PTP_UNCALIBRATED
	* After a few minutes (this should not take this long!!) you will see the clock converge and enter PTP_SLAVE state

# Example Serial Messages:
```
ptpd_servo: offset from master: 0 sec -222411 nsec, observed drift: 3716708 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -303416 nsec, observed drift: 3697745 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -369119 nsec, observed drift: 3674676 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -471137 nsec, observed drift: 3645230 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -590735 nsec, observed drift: 3608310 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -810188 nsec, observed drift: 3557674 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -791888 nsec, observed drift: 3508181 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -627718 nsec, observed drift: 3468949 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -384423 nsec, observed drift: 3444923 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -192966 nsec, observed drift: 3432863 PTP_SLAVE
ptpd_servo: offset from master: 0 sec -30441 nsec, observed drift: 3430961 PTP_SLAVE
```
# Issues
* The Stm32CubeH7 HAL's Eth RX timestamp retrevial is broken
  	* Bug filed here: https://github.com/STMicroelectronics/stm32h7xx_hal_driver/issues/63
  	* I patched it in the HAL eth driver in this project
  	* The idea behind the patch is that if a timestamp is available for a packet, we do not return from HAL_ETH_ReadData() until we collect the timestamp
  	* There is a buffer associated with the descriptor which ends up being used as context descriptor, but I *don't think* the descriptor needs to be rebuilt (buffer relinked) after the descriptor is used. I *think* the buffer is still associated with the descriptor, and of course it wasn't used for data, so I *think* the only thing required to do to recycle this descriptor for use again is simply returning it to DMA with the OWN bit. Is this correct?
* The clock state oscillates between PTP_UNCALIBRATED and PTP_SLAVE
	*  I don't really know why yet
	* I do have a port of this project on another board where this doesn't happen. Possibly a hardware clock issue?
* Optimization: RX descriptor use could be less intensive if the Eth mac *only* timestamped PTP packets,
	* I have yet to figure out how to make this work.
	* Right now, all RX packets are timestamped with TSENALL set
	* It seems like with the RESET value of the MACTSCR (3094/3357 RM0468 Rev 3), the version bit is reset but mac processing of UDP IPV4 PTP messages is enabled with TSIPV4ENA being set. So this should mean that the only thing needed to do to get the MAC to automatically timestamp UDP PTP packets is to set TSVER2ENA. If you keep TSENALL reset but set TSVER2ENA, reception works until right after DHCP, and then reception is halted with HAL_ETH_GetDMAError() = 0x1100 (RPS set, FBE set,  REB = 0). I have no idea why this is happening.
