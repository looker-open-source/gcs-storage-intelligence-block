# -------------------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Bucket Activity View Table inside the Storage Intelligence linked Dataset. This view specifically is related to the top object prefixes that experienced the highest volume of 429 (Too Many Requests) errors during the hourly capture period.
# -------------------------------------------------------------------------------------

view: bucket_activity__top_prefixes_429_errors {

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
    description: "The object key prefix (folder path) associated with the error count. Represents the directory structure where rate-limiting occured."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_errors {
    group_label: "Request Status"
    label: "Total 429 errors"
    type: sum
    sql: ${errors_count} ;;
    description: "The total count of 'Too Many Requests' (429) errors aggregated for the identified object prefixes."
  }
}
