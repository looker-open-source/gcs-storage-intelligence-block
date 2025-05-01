project_name: "gcs_storage_intelligence_block"

################################### Constants ###################################

constant: connection_name {
  value: "gcs-storage-insights"
  export: override_optional

}

constant: project_id {
  value: "looker-marketplace"
  export: override_optional
}

constant: bigquery_dataset {
  value: "full_storage_insights_sync_data"
  export: override_optional
}
