#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Apr 30, 2025
# Purpose: The default datagroup for the storage_intelligence model sets a maximum cache age of 1 hour.
#####################################################################
datagroup: gcs_storage_intelligence_default_datagroup {
  interval_trigger: "8 hour"
  max_cache_age: "1 hour"
}
