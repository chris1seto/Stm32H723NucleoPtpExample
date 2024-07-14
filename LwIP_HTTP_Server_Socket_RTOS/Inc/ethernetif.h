/**
  ******************************************************************************
  * @file    LwIP/LwIP_HTTP_Server_Socket_RTOS/Inc/ethernetif.h 
  * @author  MCD Application Team
  * @brief   Header for ethernetif.c module
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2017 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */

#ifndef ETHERNETIF_H
#define ETHERNETIF_H

#include <stdint.h>
#include <stdbool.h>
#include "FreeRTOS.h"
#include "lwip/netif.h"
#include "lwip/err.h"
#include "lwip/netif.h"
#include "cmsis_os.h"

#define PTP_TIMESTAMP_RECORD_MAGIC 0x55667788

typedef struct
{
  int tv_sec;
  int tv_nsec;
} PtpTime_t;

err_t ethernetif_init(struct netif *netif);
void ethernet_link_thread( void* argument );
bool ethernetif_GetTxTimestamp(PtpTime_t* const timestamp, const TickType_t block_time);
void ethernetif_SetTime(const PtpTime_t* ptp_time);
void ethernetif_GetTime(PtpTime_t* const ptp_time);
void ethernetif_PtpFxAdjust(const int32_t adjustment_ppb);

#endif
