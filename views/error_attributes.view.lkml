# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Error Attributes View Table inside the Storage Intelligence linked Dataset.
# -------------------------------------------------------------------------
view: error_attributes {

  sql_table_name: `@{PROJECT_ID}.@{BIGQUERY_DATASET}.error_attributes_view` ;;

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: GENERATE_UUID();;
    description: "A hidden, system-generated, universally unique identifier (UUID) stored as a string. This field serves as the primary key for each error, ensuring unique identification across the system. UUIDs are generated using the GENERATE UUID function."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_error_record__bucket_name {
    type: string
    sql: ${TABLE}.bucketErrorRecord.bucketName ;;
    group_label: "Bucket Error Record"
    group_item_label: "Bucket Name"
    description: "The name of the Google Cloud Storage bucket identified in the error record. Use this dimension to pinpoint which specific bucket is triggering errors or failing to report data."
  }

  dimension: bucket_error_record__service_account {
    type: string
    sql: ${TABLE}.bucketErrorRecord.serviceAccount ;;
    group_label: "Bucket Error Record"
    group_item_label: "Service Account"
    description: "The Google Cloud Service Account that encountered the error. Use this to identify which identity was attempting the operation."
  }

  dimension: error_code {
    type: number
    sql: ${TABLE}.errorCode ;;
    description: "The internal numeric identifier for the Storage Intelligence error. Use this for filtering specific failure types."
  }

  dimension: error_source {
    type: string
    sql: ${TABLE}.errorSource ;;
    description: "The source that generated the GCS Storage Intelligence error."
  }

  dimension: project_error_record__organization_name {
    type: string
    sql: ${TABLE}.projectErrorRecord.organizationName ;;
    group_label: "Project Error Record"
    group_item_label: "Organization Name"
    description: "The name of the Google Cloud Organization that owns the project reporting the GCS Storage Intelligence error."
  }

  dimension: project_error_record__project_number {
    type: number
    sql: ${TABLE}.projectErrorRecord.projectNumber ;;
    group_label: "Project Error Record"
    group_item_label: "Project Number"
    description: "The Google Cloud Project number associated with the GCS error."
  }

  dimension: source_gcs_location {
    label: "Location"
    type: string
    sql: ${TABLE}.sourceGcsLocation ;;
    description: "The Google Cloud region (e.g., 'us-central1') or multi-region (e.g., 'US') location associated with the GCS Storage Intelligence error."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: error_case {
    label: "Error case"
    type: string
    sql:
      CASE
        WHEN ${error_code} = 1 THEN 'Source project does not belong to the organization'
        WHEN ${error_code} = 2 THEN 'Bucket authorization error'
        WHEN ${error_code} = 3 THEN 'Destination project does not belong to the organization'
        WHEN ${error_code} = 4 THEN 'Source project does not have Storage Intelligence configured'
        WHEN ${error_code} = 5 THEN 'Bucket does not have Storage Intelligence configured'
        WHEN ${error_code} = 6 THEN 'Bucket access authentication error'
      END;;
    description: "The human-readable explanation of the numeric 'Error Code'. Use this to identify the root cause of the failure, such as organization mismatches (Codes 1, 3), missing configurations (Codes 4, 5), or authorization errors (Codes 2, 6)."
  }

  dimension: error_message {
    label: "Error message"
    type: string
    sql:
      CASE
        WHEN ${error_code} = 1 THEN 'Source project projectErrorRecord.projectNumber does not belong to the organization projectErrorRecord.organizationName.'
        WHEN ${error_code} = 2 THEN 'Permission denied for ingesting objects for bucket bucketErrorRecord.bucketName.'
        WHEN ${error_code} = 3 THEN 'Destination project projectErrorRecord.projectNumber not in organization projectErrorRecord.organizationName.'
        WHEN ${error_code} = 4 THEN 'Source project projectErrorRecord.projectNumber does not have Storage Intelligence configured.'
        WHEN ${error_code} = 5 THEN 'Bucket bucketErrorRecord.bucketName does not have Storage Intelligence configured.'
        WHEN ${error_code} = 6 THEN 'ACTIVITY_BUCKET_ACCESS_AUTHORIZATION_ERROR for bucket bucketErrorRecord.bucketName.'
      END;;
    description: "The standard description for the error code. Provides a generic explanation of the failure (e.g., 'Bucket authorization error') without specific resource names, making it ideal for grouping and counting errors by type."
  }

  dimension: error_with_buckets {
    label: "Has Associated Bucket?"
    hidden: no
    type: yesno
    sql: ${bucket_error_record__bucket_name} IS NOT NULL  ;;
    description: "Returns 'Yes' if the error log identified a specific bucket name. Returns 'No' for project-wide configuration errors."
  }

  dimension: troubleshooting {
    label: "Troubleshooting"
    sql:
      CASE
        WHEN ${error_code} = 1 THEN 'Add source project projectErrorRecord.projectNumber to organization projectErrorRecord.organizationName.'
        WHEN ${error_code} = 2 THEN 'Give service account bucketErrorRecord.serviceAccount Identity and Access Management (IAM) permissions to allow ingestion of objects for bucket bucketErrorRecord.bucketName.'
        WHEN ${error_code} = 3 THEN 'Add destination project projectErrorRecord.projectNumber to organization projectErrorRecord.organizationName.'
        WHEN ${error_code} = 4 THEN 'Configure Storage Intelligence for the source project projectErrorRecord.projectNumber.'
        WHEN ${error_code} = 5 THEN 'Configure Storage Intelligence for the bucket bucketErrorRecord.bucketName.'
        WHEN ${error_code} = 6 THEN 'Grant service account bucketErrorRecord.serviceAccount Identity and Access Management (IAM) permissions to allow ingestion of activity for bucket bucketErrorRecord.bucketName.'
      END;;
    description: "The recommended resolution step for the specific error. Follow these instructions (e.g., 'Grant IAM permissions') to resolve configuration or authorization issues."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: error {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.errorTime ;;
    description: "The date and time when the Storage Intelligence error was logged. Use this to identify when failures started occurring or to analyze error trends over time."
  }

  ################################## Measures ##################################

  measure: total_errors {
    type: count
    description: "The total number of Storage Intelligence failures logged during the selected timeframe."
    drill_fields: [
      error_time,
      bucket_error_record__bucket_name,
      error_case,
      troubleshooting
    ]
  }
}