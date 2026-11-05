# -------------------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Nov 4, 2026
# Purpose: Contains information about the Bucket Activity View Table inside the Storage Intelligence linked Dataset. This view specifically is related to the top object prefixes that experienced the highest volume of 429 (Too Many Requests) errors during the hourly capture period.
# -------------------------------------------------------------------------------------

view: bucket_activity__top_prefixes_429_errors {

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    label: "Primary key"
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${bucket_activity.primary_key}, '_', ${TABLE}.prefix) ;;
    description: "A composite primary key uniquely identifying each top prefix 429 error record per bucket activity window."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------


  dimension: errors_count {
    label: "Hourly-based errors"
    type: number
    sql: ${TABLE}.count ;;
    hidden: yes
    description: "The total count of 'Too Many Requests' (429) errors attributed to this specific object prefix during the hourly capture period. This metric quantifies the intensity of the rate-limiting event for the identified hotspot."
  }

  dimension: prefix {
    label: "Top object prefix"
    type: string
    sql: ${TABLE}.prefix ;;
    description: "The object key prefix (folder path) associated with the error count. Represents the directory structure where rate-limiting occurred."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_errors {
    group_label: "Request status"
    label: "Total 429 errors"
    type: sum
    sql: ${errors_count} ;;
    description: "The total count of 'Too Many Requests' (429) errors aggregated for the identified object prefixes."
  }
}
