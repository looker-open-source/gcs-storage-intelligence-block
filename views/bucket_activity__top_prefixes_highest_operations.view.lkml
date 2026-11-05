# -------------------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Nov 4, 2026
# Purpose: Contains information about the Bucket Activity View Table inside the Storage Intelligence linked Dataset. This view specifically is related to the top object prefixes that experienced the highest volume of operations during the hourly capture period.
# -------------------------------------------------------------------------------------
view: bucket_activity__top_prefixes_highest_operations {

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    label: "Primary key"
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${bucket_activity.primary_key}, '_', ${TABLE}.prefix) ;;
    description: "A composite primary key uniquely identifying each top prefix operations record per bucket activity window."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: operations_count {
    label: "Hourly-based operations"
    type: number
    sql: ${TABLE}.count ;;
    hidden: yes
    description: "The number of operations recorded for this prefix during the hour."
  }

  dimension: prefix {
    label: "Top object prefix"
    type: string
    sql: ${TABLE}.prefix ;;
    description: "The object key prefix (folder path) associated with the operations count. Represents the directory structure where operations occurred."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_operations {
    group_label: "Operations"
    label: "Total volume of operations"
    type: sum
    sql: ${operations_count} ;;
    description: "The total number of operations recorded for the specific object prefixes identified as hotspots."
  }

}
