# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: November 15, 2025
# Modified Date: Feb 12, 2026
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: bucket_attributes_history {
  description: "Historic bucket-level metadata joined with project attributes. This view preserves the state of bucket settings over time for longitudinal analysis."

  join: project_attributes {
    type: left_outer
    sql_on: ${bucket_attributes_history.project} =  ${project_attributes.project};;
    relationship: many_to_one
  }
}
