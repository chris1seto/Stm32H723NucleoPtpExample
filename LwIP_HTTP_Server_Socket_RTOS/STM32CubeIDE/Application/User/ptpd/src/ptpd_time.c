#include "ptpd.h"
#include "../../ethernetif.h"

uint32_t ptpd_get_rand(uint32_t rand_max)
{
  return rand_max;
}

void ptpd_get_time(TimeInternal *time)
{
  PtpTime_t ts;

  ethernetif_GetTime(&ts);

  time->seconds = ts.tv_sec;
  time->nanoseconds = ts.tv_nsec;
}

void ptpd_set_time(const TimeInternal *time)
{
  PtpTime_t ts;

  ts.tv_sec = time->seconds;
  ts.tv_nsec = time->nanoseconds;

  ethernetif_SetTime(&ts);
}

bool ptpd_adj_freq(int32_t adj)
{
  if (adj > ADJ_FREQ_MAX)
  {
    adj = ADJ_FREQ_MAX;
  }
  else if (adj < -ADJ_FREQ_MAX)
  {
    adj = -ADJ_FREQ_MAX;
  }

  ethernetif_PtpFxAdjust(adj);

  return true;
}
