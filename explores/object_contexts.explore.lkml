# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Oct 5, 2026
# Modified Date: Nov 4, 2026
# Purpose: Explore for GCS object contexts and extended metadata catalog.
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: object_contexts_catalog {
  persist_with: storage_intelligence_metadata_datagroup
  description: "Comprehensive catalog of object-level context annotations and extended data payloads, joined with project attributes and regional metadata. Use this explore to audit custom key-value tags, inspect extended data annotations, and track context adoption across buckets and projects."

  join: regions_information {
    type: left_outer
    sql_on: ${object_contexts_catalog.location} = ${regions_information.location} ;;
    relationship: many_to_one
  }

  join: project_attributes {
    type: left_outer
    sql_on: ${object_contexts_catalog.project} = ${project_attributes.project} ;;
    relationship: many_to_one
  }

  join: object_contexts_catalog__contexts {
    view_label: "Object Contexts"
    sql: LEFT JOIN UNNEST(${object_contexts_catalog.contexts}) AS object_contexts_catalog__contexts ;;
    relationship: one_to_many
  }
}
