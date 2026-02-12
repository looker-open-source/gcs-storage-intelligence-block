# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: An unpivot helper view that generates a static list of all status available.
#          Joined via CROSS JOIN to the main activity explores, it converts the separate
#          count2xx/4xxx/5xx. columns into a single dimension ('Status Label'),
#          enabling breakdown visualizations like Pie Charts and Bar Graphs.
# --------------------------------------------------------------------------

view: status_values {

  derived_table: {
    sql:
      SELECT '2xx' AS status_label UNION ALL
      SELECT '4xx' AS status_label UNION ALL
      SELECT '5xx' AS status_label
    ;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: status_label {
    label: "Status Label"
    primary_key: yes
    type: string
    sql: ${TABLE}.status_label ;;
    description: "The status related to the GCS Storage Intelligence bucket or project activity tables."
  }

}
