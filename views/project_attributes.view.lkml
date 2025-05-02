#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Purpose: Contains information about the Project Attributes View Table inside the Storage Intelligence linked Dataset.
#####################################################################
view: project_attributes {
  derived_table: {
    sql:
      SELECT DISTINCT
        name,
        id,
        CAST(number AS STRING) number
      FROM
        `@{project_id}.@{bigquery_dataset}.project_attributes_view` ;;
  }

  ################################### Primary Key #################################

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: GENERATE_UUID();;
    description: "A hidden, system-generated, universally unique identifier (UUID) stored as a string. This field serves as the primary key for each project, ensuring unique identification across the system. UUIDs are generated using the GENERATE UUID function."
  }

  ################################## Dimensions ##################################

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

  dimension: project {
    type: string
    sql: ${TABLE}.number ;;
    description: "The Google Cloud project number associated with the project ID"
  }

}
