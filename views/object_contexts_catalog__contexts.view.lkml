# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Oct 5, 2026
# Modified Date: Nov 4, 2026
# Purpose: Unnested view for object contexts records.
# --------------------------------------------------------------------------

view: object_contexts_catalog__contexts {

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    label: "Context primary key"
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${object_contexts_catalog.primary_key}, '_', ${TABLE}.key) ;;
    description: "A composite primary key uniquely identifying each context record per object version."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: extended_data {
    label: "Extended data"
    type: string
    sql: ${TABLE}.extendedData ;;
    description: "Extended data associated with the context."
  }

  dimension: key {
    label: "Context key"
    type: string
    sql: ${TABLE}.key ;;
    description: "The key of the context entry."
  }

  dimension: value {
    label: "Context value"
    type: string
    sql: ${TABLE}.value ;;
    description: "The value of the context entry."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: key_value {
    label: "Context key:value"
    type: string
    sql: CONCAT(${key}, ':', ${value}) ;;
    description: "A concatenated string of the context key and its corresponding value, formatted as 'key:value'. Useful for visualizing and counting objects by unique key-value pairs."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Groups --------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: catalog_updated {
    group_label: "Catalog updated time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.catalogUpdatedTime ;;
    description: "Timestamp when the catalog was updated."
  }

  dimension_group: context_creation {
    group_label: "Context creation time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.contextCreationTime ;;
    description: "Timestamp when the context was created."
  }

  dimension_group: context_update {
    group_label: "Context update time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.contextUpdateTime ;;
    description: "Timestamp when the context was last updated."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_contexts {
    label: "Total contexts"
    type: count
    drill_fields: [context_detail*]
    value_format_name: decimal_0
    description: "The total number of context entries."
  }

  measure: total_contexts_with_keys {
    label: "Total contexts with keys"
    type: count_distinct
    sql: ${key} ;;
    drill_fields: [key, total_contexts]
    value_format_name: decimal_0
    description: "The total distinct count of context keys."
  }

  measure: total_extended_data_entries {
    label: "Total extended data entries"
    type: count
    filters: [extended_data: "-NULL"]
    drill_fields: [context_detail*]
    value_format_name: decimal_0
    description: "The total number of context entries that contain extended data."
  }

  measure: total_objects_with_extended_data {
    label: "Total objects with extended data"
    type: count_distinct
    sql:
      CASE
        WHEN ${TABLE}.extendedData IS NOT NULL
        THEN CONCAT(
               COALESCE(${object_contexts_catalog.bucket_name}, ''), '_',
               COALESCE(${object_contexts_catalog.object_name}, ''), '_',
               COALESCE(${object_contexts_catalog.generation}, '')
             )
        ELSE NULL
      END
    ;;
    drill_fields: [context_detail*]
    value_format_name: decimal_0
    description: "The total count of unique objects that contain at least one context with extended data."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Sets (Drill Fields) ------------------------
  # --------------------------------------------------------------------------------------------------------

  set: context_detail {
    fields: [
      object_contexts_catalog.project,
      object_contexts_catalog.bucket_name,
      object_contexts_catalog.object_name,
      key,
      value,
      context_creation_time,
      context_update_time
    ]
  }

  drill_fields: [context_detail*]
}
