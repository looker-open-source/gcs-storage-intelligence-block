# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Nov 4, 2026
# Purpose: Explore for Storage Intelligence dataset ingestion and system events.
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: events {
  persist_with: storage_intelligence_activity_datagroup
  description: "System and ingestion event tracking for Storage Intelligence datasets, enriched with regional metadata to monitor snapshot generation, activity journals, and dataset readiness across locations."

  join: regions_information {
    type: left_outer
    sql_on: ${events.location} = ${regions_information.location} ;;
    relationship: many_to_one
  }
}
