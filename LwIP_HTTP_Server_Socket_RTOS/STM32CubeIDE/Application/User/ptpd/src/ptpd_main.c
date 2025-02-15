#include <stdlib.h>
#include <string.h>
#include "ptpd.h"
#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>
#include <event_groups.h>
#include "../../Log.h"

static PtpClock ptp_clock;
static ForeignMasterRecord ptp_foreign_records[DEFAULT_MAX_FOREIGN_RECORDS];

enum
{
  ALERT_EVENT_BIT = (1 << 0),
};
static EventGroupHandle_t ptp_alert_event_bits;

static void ptpd_thread(void *arg);

// PTPD initialization.
void ptpd_init(void)
{
  ptp_alert_event_bits = xEventGroupCreate();

  xTaskCreate(ptpd_thread, "ptpd", 500, NULL, 45, NULL);
}

static void ptpd_thread(void *arg)
{
  // Initialize the main PTP datastructure.
  memset(&ptp_clock, 0, sizeof(ptp_clock));

  // Run the clock in slave only?
  ptp_clock.rtOpts.slaveOnly = true;

  // Initialize run-time options to default values.
  ptp_clock.rtOpts.announceInterval = DEFAULT_ANNOUNCE_INTERVAL;
  ptp_clock.rtOpts.syncInterval = DEFAULT_SYNC_INTERVAL;
  ptp_clock.rtOpts.clockQuality.clockAccuracy = DEFAULT_CLOCK_ACCURACY;
  ptp_clock.rtOpts.clockQuality.clockClass = DEFAULT_CLOCK_CLASS;
  ptp_clock.rtOpts.clockQuality.offsetScaledLogVariance = DEFAULT_CLOCK_VARIANCE; // 7.6.3.3
  ptp_clock.rtOpts.priority1 = DEFAULT_PRIORITY1;
  ptp_clock.rtOpts.priority2 = DEFAULT_PRIORITY2;
  ptp_clock.rtOpts.domainNumber = DEFAULT_DOMAIN_NUMBER;
  ptp_clock.rtOpts.currentUtcOffset = DEFAULT_UTC_OFFSET;
  ptp_clock.rtOpts.servo.noResetClock = DEFAULT_NO_RESET_CLOCK;
  ptp_clock.rtOpts.servo.noAdjust = NO_ADJUST;
  ptp_clock.rtOpts.inboundLatency.nanoseconds = DEFAULT_INBOUND_LATENCY;
  ptp_clock.rtOpts.outboundLatency.nanoseconds = DEFAULT_OUTBOUND_LATENCY;
  ptp_clock.rtOpts.servo.sDelay = DEFAULT_DELAY_S;
  ptp_clock.rtOpts.servo.sOffset = DEFAULT_OFFSET_S;
  ptp_clock.rtOpts.servo.ap = DEFAULT_AP;
  ptp_clock.rtOpts.servo.ai = DEFAULT_AI;
  ptp_clock.rtOpts.maxForeignRecords = sizeof(ptp_foreign_records) / sizeof(ptp_foreign_records[0]);
  ptp_clock.rtOpts.stats = PTP_TEXT_STATS;
  ptp_clock.rtOpts.delayMechanism = DEFAULT_DELAY_MECHANISM;

  // Initialize the foriegn records buffers.
  ptp_clock.foreignMasterDS.records = ptp_foreign_records;

  // See: 9.2.2
  if (ptp_clock.rtOpts.slaveOnly) ptp_clock.rtOpts.clockQuality.clockClass = DEFAULT_CLOCK_CLASS_SLAVE_ONLY;

  // No negative or zero attenuation.
  if (ptp_clock.rtOpts.servo.ap < 1) ptp_clock.rtOpts.servo.ap = 1;
  if (ptp_clock.rtOpts.servo.ai < 1) ptp_clock.rtOpts.servo.ai = 1;

  // Wait until the network interface is up.

  // Enter state PTP_INITIALIZING.
  ptpd_protocol_to_state(&ptp_clock, PTP_INITIALIZING);

  // Loop forever.
  while (true)
  {
    // Process the current state.
    do
    {
      // ptpd_protocol_do_state() has a switch for the actions and events to be
      // checked for 'port_state'. The actions and events may or may not change
      // 'port_state' by calling ptpd_protocol_to_state(), but once they are done we loop around
      // again and perform the actions required for the new 'port_state'.
      ptpd_protocol_do_state(&ptp_clock);
    }
    while (ptpd_net_select(&ptp_clock.netPath, 0) > 0);

    xEventGroupWaitBits(ptp_alert_event_bits, ALERT_EVENT_BIT, true, true, 100);
  }
}

// Notify the PTPD thread of a pending operation.
void ptpd_alert(void)
{
  xEventGroupSetBits(ptp_alert_event_bits, ALERT_EVENT_BIT);
}

// Get the current PTPD state.
uint32_t ptpd_get_state(void)
{
  // Return the current PTPD state.
  return (uint32_t) ptp_clock.portDS.portState;
}
