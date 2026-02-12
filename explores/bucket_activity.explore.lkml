# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# -------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: bucket_activity {
  description: "Comprehensive view of storage bucket performance, including project metadata, top error prefixes (429s), and traffic volume (bytes/operations). Use this to analyze usage patterns and troubleshoot client errors across projects."

  join: project_attributes {
    type: left_outer
    sql_on: ${bucket_activity.project} = ${project_attributes.project} ;;
    relationship: many_to_one
  }

  join: bucket_activity__top_prefixes_429_errors {
    view_label: "Top 429 Error Prefixes"
    sql: LEFT JOIN UNNEST(${bucket_activity.top_prefixes_429_errors}) AS bucket_activity__top_prefixes_429_errors ;;
    relationship: one_to_many
  }

  join: bucket_activity__top_prefixes_request_bytes {
    view_label: "Top Prefixes Request Bytes"
    sql: LEFT JOIN UNNEST(${bucket_activity.top_prefixes_request_bytes}) AS bucket_activity__top_prefixes_request_bytes;;
    relationship: one_to_many
  }

  join: bucket_activity__top_prefixes_response_bytes {
    view_label: "Top Prefixes Response Bytes"
    sql: LEFT JOIN UNNEST(${bucket_activity.top_prefixes_response_bytes}) AS  bucket_activity__top_prefixes_response_bytes;;
    relationship: one_to_many
  }

  join: bucket_activity__top_prefixes_highest_operations {
    view_label: "Top Prefixes Highest Operations"
    sql: LEFT JOIN UNNEST(${bucket_activity.top_prefixes_highest_operations}) AS bucket_activity__top_prefixes_highest_operations;;
    relationship: one_to_many
  }

  join: client_error_status {
    type: cross
    sql_on: 1 = 1 ;;
    relationship: one_to_many
  }

  join: status_values {
    type: cross
    sql_on: 1 = 1 ;;
    relationship: one_to_many
  }

}
