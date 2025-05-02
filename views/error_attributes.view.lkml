#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Purpose: Contains information about the Error Attributes View Table inside the Storage Intelligence linked Dataset.
#####################################################################
view: error_attributes {

  sql_table_name: `@{bigquery_dataset}.error_attributes_view` ;;

  ################################### Primary Key #################################

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: GENERATE_UUID();;
    description: "A hidden, system-generated, universally unique identifier (UUID) stored as a string. This field serves as the primary key for each error, ensuring unique identification across the system. UUIDs are generated using the GENERATE UUID function."
  }

  ################################## Dimensions ##################################

  dimension: bucket_error_record__bucket_name {
    type: string
    sql: ${TABLE}.bucketErrorRecord.bucketName ;;
    group_label: "Bucket Error Record"
    group_item_label: "Bucket Name"
    description: "The name of the Google Cloud Storage (GCS) bucket associated with the GCS error."
  }

  dimension: bucket_error_record__service_account {
    type: string
    sql: ${TABLE}.bucketErrorRecord.serviceAccount ;;
    group_label: "Bucket Error Record"
    group_item_label: "Service Account"
    description: "The GCP Service account associated with the GCS error."
  }

  dimension: error_code {
    type: number
    sql: ${TABLE}.errorCode ;;
    description: "The specific error code that identifies the GCS error in this entry."
  }

  dimension: error_source {
    type: string
    sql: ${TABLE}.errorSource ;;
    description: "The source that generated the GCS error."
  }

  dimension: project_error_record__organization_name {
    type: string
    sql: ${TABLE}.projectErrorRecord.organizationName ;;
    group_label: "Project Error Record"
    group_item_label: "Organization Name"
    description: ""
  }

  dimension: project_error_record__project_number {
    type: number
    sql: ${TABLE}.projectErrorRecord.projectNumber ;;
    group_label: "Project Error Record"
    group_item_label: "Project Number"
    description: "The Google Cloud Project number associated with the GCS error."
  }

  dimension: source_gcs_location {
    type: string
    sql: ${TABLE}.sourceGcsLocation ;;
    description: "The region or multi-region location associated with the GCS error."
  }

  ############################ extra dimensions ##################################

  dimension: error_with_buckets {
    label: "Is bucket Related to Error"
    hidden: no
    type: yesno
    sql: ${bucket_error_record__bucket_name} IS NOT NULL  ;;
    description: "Dimension that help us to understand if the error is associated with a Bucket."
  }

  ################################## Dimension Group ##################################

  dimension_group: error {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.errorTime ;;
    description: "The timestamp of the GCS error occurrence."
  }

  ################################## Measures ##################################

  measure: total_errors {
    type: count
    description: "A measure that counts the total number of errors."
  }
}
