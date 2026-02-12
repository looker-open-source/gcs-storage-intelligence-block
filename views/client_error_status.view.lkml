# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: An unpivot helper view that generates a static list of 4xx error codes.
#          Joined via CROSS JOIN to the main activity explores, it converts the separate
#          count400/401/etc. columns into a single dimension ('Client Error Label'),
#          enabling breakdown visualizations like Pie Charts and Bar Graphs.
# --------------------------------------------------------------------------

view: client_error_status {

  derived_table: {
    sql:
      SELECT '400' AS client_error_label UNION ALL
      SELECT '401' AS client_error_label UNION ALL
      SELECT '403' AS client_error_label UNION ALL
      SELECT '429' AS client_error_label
    ;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: client_error_label {
    label: "Client Error Label"
    primary_key: yes
    type: string
    sql: ${TABLE}.client_error_label ;;
    description: "The specific HTTP 4xx status code (400, 401, 403, or 429). Use this dimension as a group-by or legend to break down the 'Total Client Error Requests by Status' measure by error type."
  }

}
