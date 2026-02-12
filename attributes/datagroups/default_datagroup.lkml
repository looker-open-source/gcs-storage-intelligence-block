# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# Purpose: The default datagroup for the storage_intelligence model sets a maximum cache age of 2 hour.
# --------------------------------------------------------------------------

datagroup: gcs_storage_intelligence_default_datagroup {
  interval_trigger: "2 hour"
  max_cache_age: "2 hour"
}
