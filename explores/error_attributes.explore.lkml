# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: error_attributes  {
  description: "Diagnostic view for identifying and resolving errors encountered during the setup of GCP Storage Intelligence datasets. Includes regional metadata to pinpoint location-specific deployment failures."

  join: regions_information {
    type: inner
    sql_on: ${error_attributes.source_gcs_location} = ${regions_information.location} ;;
    relationship: many_to_one
  }
}
