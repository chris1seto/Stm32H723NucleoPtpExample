#ifndef ETHERNETIF_H
#define ETHERNETIF_H

#include <stdint.h>
#include <stdbool.h>
#include "FreeRTOS.h"
#include "lwip/netif.h"

#define PTP_TIMESTAMP_RECORD_MAGIC 0x55667788

typedef struct
{
  int tv_sec;
  int tv_nsec;
} PtpTime_t;

err_t ethernetif_init(struct netif *netif);
bool ethernetif_GetTxTimestamp(PtpTime_t* const timestamp, const TickType_t block_time);
void ethernetif_SetTime(const PtpTime_t* ptp_time);
void ethernetif_GetTime(PtpTime_t* const ptp_time);
void ethernetif_PtpFxAdjust(const int32_t adjustment_ppb);

#endif
