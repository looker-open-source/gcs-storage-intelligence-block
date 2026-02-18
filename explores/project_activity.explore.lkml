# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 17, 2026
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: project_activity {
  persist_with: storage_intelligence_activity_datagroup
  description: "Aggregated project activity metrics enriched with project metadata. Includes all possible error and status dimensions for standardized performance and compliance tracking."

  join: project_attributes {
    type: left_outer
    sql_on: ${project_activity.project} = ${project_attributes.project} ;;
    relationship: many_to_one
  }

  join: client_error_status {
    type: cross
    sql_on: 1 = 1 ;;
    relationship: one_to_many
  }

  join: status_values {
    type: cross
    sql_on: 1 = 1 ;;
    relationship: one_to_many
  }

}
