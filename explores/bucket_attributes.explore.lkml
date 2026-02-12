# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: bucket_attributes  {
  description: "A comprehensive view of the latest bucket-level attributes, mapping each bucket to its physical region and parent project for cross-functional reporting."

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
}
