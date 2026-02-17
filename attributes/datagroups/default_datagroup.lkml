# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 16, 2026
# Purpose: The default datagroup for the storage_intelligence model.
#          Optimized with a sql_trigger to refresh the cache only when 
#          new ingestion events are detected in the events_view.
# --------------------------------------------------------------------------

datagroup: gcs_storage_intelligence_default_datagroup {
  sql_trigger: SELECT MAX(eventTime) FROM `@{PROJECT_ID}.@{BIGQUERY_DATASET}.events_view` ;;
  max_cache_age: "24 hours"
}
