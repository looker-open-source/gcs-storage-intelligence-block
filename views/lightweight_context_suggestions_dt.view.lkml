# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Nov 4, 2026
# Modified Date: Nov 4, 2026
# Purpose: Lightweight Ephemeral DT for Dashboard Filter Dropdowns.
# --------------------------------------------------------------------------

view: lightweight_context_suggestions_dt {
  derived_table: {
    sql:
          SELECT DISTINCT
            ctx.key AS context_key,
            ctx.value AS context_value
          FROM `@{PROJECT_ID}.@{BIGQUERY_DATASET}.object_contexts_catalog_view`
          LEFT JOIN UNNEST(contexts) AS ctx
          WHERE ctx.key IS NOT NULL
        ;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    label: "Primary key"
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${TABLE}.context_key, '_', COALESCE(${TABLE}.context_value, '')) ;;
    description: "A composite primary key uniquely identifying each distinct context key-value pair."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: context_key {
    label: "Context key"
    type: string
    sql: ${TABLE}.context_key ;;
    description: "The distinct object context key used to populate dashboard filter suggestions."
  }

  dimension: context_value {
    label: "Context value"
    type: string
    sql: ${TABLE}.context_value ;;
    description: "The distinct object context value used to populate dashboard filter suggestions."
  }
}
