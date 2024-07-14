#include "ptpd.h"
#include <FreeRTOS.h>
#include <timers.h>

// Static array of PTPD timers.
static TimerHandle_t ptpd_timer_id[TIMER_ARRAY_SIZE];
static bool ptpd_timers_expired[TIMER_ARRAY_SIZE];

// Callback for timers.
static void ptpd_timer_callback(TimerHandle_t xTimer)
{
  int index = (int)pvTimerGetTimerID(xTimer);

  // Sanity check the index.
  if (index < TIMER_ARRAY_SIZE)
  {
    // Mark the indicated timer as expired.
    ptpd_timers_expired[index] = true;

    // Notify the PTP thread of a pending operation.
    ptpd_alert();
  }
}

// Initialize PTPD timers.
void ptpd_timer_init(void)
{
  int32_t i;

  // Create the various timers used in the system.
  for (i = 0; i < TIMER_ARRAY_SIZE; i++)
  {
    // Mark the timer as not expired.
    ptpd_timers_expired[i] = false;

    // Create the timer.
    ptpd_timer_id[i] = xTimerCreate("ptpd", 1, 1, (void*)i, ptpd_timer_callback);
  }
}

// Start the indexed timer with the given interval.
void ptpd_timer_start(int32_t index, uint32_t interval_ms)
{
  // Sanity check the index.
  if (index >= TIMER_ARRAY_SIZE) return;
  if (ptpd_timer_id[index] == 0) return;

  // Reset the timer expired flag.
  ptpd_timers_expired[index] = false;

  if (interval_ms == 0)
  {
    interval_ms = 1;
  }
  xTimerChangePeriod(ptpd_timer_id[index], interval_ms, 100);
  xTimerStart(ptpd_timer_id[index], 100);
}

// Stop the indexed timer.
void ptpd_timer_stop(int32_t index)
{
  // Sanity check the index.
  if (index >= TIMER_ARRAY_SIZE) return;

  DBGV("PTPD: stop timer %li\n", index);

  // Stop the timer.
  xTimerStop(ptpd_timer_id[index], 0);

  // Reset the expired flag.
  ptpd_timers_expired[index] = false;
}

// If the timer has expired, this function will reset the
// expired flag and return true, otherwise it will false.
bool ptpd_timer_expired(int32_t index)
{
  // Sanity check the index.
  if (index >= TIMER_ARRAY_SIZE) return false;

  // Return false if the timer hasn't expired.
  if (!ptpd_timers_expired[index]) return false;

  // We only return the timer expired once.
  ptpd_timers_expired[index] = false;

  // Return true since the timer expired.
  return true;
}
