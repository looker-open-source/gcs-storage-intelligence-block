# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 17, 2026
# Purpose: Contains information about the Project Attributes View Table inside the Storage Intelligence linked Dataset.
# -------------------------------------------------------------------------

view: project_attributes {
  derived_table: {
    sql:
      SELECT DISTINCT
        name,
        id,
        CAST(number AS STRING) number
      FROM
        `@{PROJECT_ID}.@{BIGQUERY_DATASET}.project_attributes_view` ;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: project {
    label: "Project Number"
    primary_key: yes
    type: string
    sql: CAST(${TABLE}.number AS STRING) ;;
    description: "The Google Cloud project number associated with the project ID"
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: project_name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the Google Cloud Storage (GCS) project from which data is being sourced."
  }

  dimension: project_id {
    label: "Project ID"
    type: string
    sql: ${TABLE}.id ;;
    description: "The Project ID is a unique, immutable identifier for your GCP project. It is a globally unique string, often derived from the project name."
  }

}
