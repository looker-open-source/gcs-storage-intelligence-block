# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 17, 2026
# Modified Date: Feb 17, 2026
# Purpose: Manages caching for Storage Intelligence Activity (eventCode = 3).
#          Since activity loads are rolling per region every ~4 hours, this
#          trigger refreshes whenever a new time window is finalized or
#          when additional regions report in for the current window.
# --------------------------------------------------------------------------

datagroup: storage_intelligence_activity_datagroup {
  sql_trigger:
    SELECT
      CONCAT(
        CAST(MAX(activityJournal.windowEndTime) AS STRING),
        "|",
        CAST(COUNT(DISTINCT activityJournal.location) AS STRING)
      )
    FROM
      `@{PROJECT_ID}.@{BIGQUERY_DATASET}.events_view`
    WHERE
      eventCode = 3;;
  max_cache_age: "4 hours"
  description: "Triggers a refresh when a new activity window (eventCode 3) is finalized or when the count of reporting regions changes."
}
