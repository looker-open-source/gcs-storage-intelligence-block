include: "/views/*.view.lkml"

#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
#####################################################################

explore: error_attributes  {
  description: "The Explore establishes relationships between the Error Attributes table (primary) and the Regions CTE View (via INNER JOIN)."

  join: regions_information {
    type: inner
    sql_on: ${error_attributes.source_gcs_location} = ${regions_information.location} ;;
    relationship: many_to_one
  }
}
