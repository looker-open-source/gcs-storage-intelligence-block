# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 17, 2026
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: object_events {
  persist_with: storage_intelligence_activity_datagroup
  description: "Object-level API event tracking, including creation, update, and deletion requests. Maps operational actions to project attributes for cross-functional usage analysis."

  join: project_attributes {
    type: left_outer
    sql_on: ${object_events.project} = ${project_attributes.project} ;;
    relationship: many_to_one
  }

}
