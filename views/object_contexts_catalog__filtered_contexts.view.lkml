# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Oct 5, 2026
# Modified Date: Nov 4, 2026
# Purpose: Native Derived Table for filtered object context counts with predicate pushdown.
# --------------------------------------------------------------------------

view: object_contexts_catalog__filtered_contexts {

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Derived Table -------------------------------
  # --------------------------------------------------------------------------------------------------------

  derived_table: {
    explore_source: object_contexts_catalog {
      column: bucket_name {}
      column: object_count {
        field: object_contexts_catalog.object_count
      }
      column: project {}

      bind_filters: {
        from_field: bucket_attributes.bucket_name
        to_field: object_contexts_catalog.bucket_name
      }
      bind_filters: {
        from_field: bucket_attributes.filter_context_key
        to_field: object_contexts_catalog__contexts.key
      }
      bind_filters: {
        from_field: bucket_attributes.filter_context_value
        to_field: object_contexts_catalog__contexts.value
      }
      bind_filters: {
        from_field: bucket_attributes.location
        to_field: object_contexts_catalog.location
      }
      bind_filters: {
        from_field: project_attributes.project_id
        to_field: project_attributes.project_id
      }
    }
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    label: "Primary key"
    hidden: yes
    primary_key: yes
    type: string
    sql: CONCAT(${TABLE}.project, '_', ${TABLE}.bucket_name) ;;
    description: "A composite primary key uniquely identifying each bucket-level filtered context aggregation."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_name {
    label: "Bucket name"
    type: string
    hidden: yes
    description: "The name of the GCS bucket, used as the primary join key against bucket_attributes."
  }

  dimension: object_count_dim {
    label: "Object count dim"
    type: number
    hidden: yes
    sql: ${TABLE}.object_count ;;
    description: "Raw hidden dimension storing the pre-aggregated object count from the subquery."
  }

  dimension: project {
    label: "Project ID"
    type: string
    hidden: yes
    description: "The Google Cloud project identifier associated with the contexts, used for outer query joins."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_filtered_objects {
    label: "Total objects with contexts"
    type: number
    sql: COALESCE(SUM(${object_count_dim}), 0) ;;
    description: "Safely sums the filtered object counts, gracefully falling back to zero if a bucket has no matching contexts."
  }
}
