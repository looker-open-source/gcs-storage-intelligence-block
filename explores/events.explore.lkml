# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 17, 2026
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: events {
  persist_with: storage_intelligence_activity_datagroup
  description: "Injection event tracking for Storage Intelligence datasets. This view only includes events associated with valid geographic regions to ensure data integrity and regional reporting accuracy."

  join: regions_information {
    type: left_outer
    sql_on: ${events.location} = ${regions_information.location} ;;
    relationship: many_to_one
  }
}
