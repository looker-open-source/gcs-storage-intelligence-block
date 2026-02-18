# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 17, 2026
# Modified Date: Feb 17, 2026
# Purpose: This datagroup manages the caching lifecycle for Storage Intelligence
#          metadata. It anchors the cache refresh to the global injection
#          completion signal (eventCode = 2), ensuring reports only update
#          once all GCS regions have finalized their daily data load.
# --------------------------------------------------------------------------

datagroup: storage_intelligence_metadata_datagroup {
  sql_trigger:
    SELECT
      MAX(eventTime)
    FROM
      `@{PROJECT_ID}.@{BIGQUERY_DATASET}.events_view`
    WHERE
      eventCode = 2;;
  max_cache_age: "24 hours"

  description: "Triggers a cache refresh only after the full global injection cycle (all regions) is finalized, identified by eventCode = 2 in the events_view."
}
