# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 17, 2026
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: bucket_region_activity {
  persist_with: storage_intelligence_activity_datagroup
  description: "A comprehensive view of regional bucket activity contrasted with total bucket metrics. Use this to analyze performance trends relative to overall storage volume and project-level ownership."

  join: bucket_totals_summary {
    type: left_outer
    relationship: many_to_one
    sql_on: ${bucket_region_activity.bucket_name} =  ${bucket_totals_summary.bucket_name};;
  }

  join: project_attributes {
    type: left_outer
    relationship: many_to_one
    sql_on: ${bucket_region_activity.project} = ${project_attributes.project} ;;
  }

}
