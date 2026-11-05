# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Nov 4, 2026
# Purpose: Explore for latest bucket attributes, regional metadata, and context coverage.
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: bucket_attributes {
  persist_with: storage_intelligence_metadata_datagroup
  description: "A comprehensive view of the latest bucket-level attributes, mapping each bucket to its physical region, parent project, and object context catalog (including filtered context counts) for cross-functional metadata and context coverage reporting."

  join: regions_information {
    type: left_outer
    sql_on: ${bucket_attributes.location} = ${regions_information.location} ;;
    relationship: many_to_one
  }

  join: project_attributes {
    type: left_outer
    sql_on: ${bucket_attributes.project} = ${project_attributes.project} ;;
    relationship: many_to_one
  }

  join: object_contexts_catalog {
    type: left_outer
    sql_on:${bucket_attributes.bucket_name} = ${object_contexts_catalog.bucket_name} ;;
    relationship: one_to_many
  }

  join: object_contexts_catalog__filtered_contexts {
    view_label: "Filtered Context Counts"
    type: left_outer
    sql_on: ${bucket_attributes.bucket_name} = ${object_contexts_catalog__filtered_contexts.bucket_name} ;;
    relationship: one_to_one
  }
}
