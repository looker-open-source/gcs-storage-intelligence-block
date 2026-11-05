# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Nov 4, 2026
# Purpose: Project manifest defining required connection, project, and dataset constants.
# --------------------------------------------------------------------------

project_name: "gcs_storage_intelligence_block"

# --------------------------------------------------------------------------------------------------------
# ---------------------------- Constants -------------------------------
# --------------------------------------------------------------------------------------------------------

constant: CONNECTION_NAME {
  value: ""
  export: override_required
}

constant: PROJECT_ID {
  value: ""
  export: override_required
}

constant: BIGQUERY_DATASET {
  value: ""
  export: override_required
}
