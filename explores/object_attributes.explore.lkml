# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: object_attributes {
  description: "Detailed inventory of storage objects. Ideal for auditing object distribution across storage classes, verifying regional placement, and performing deep-dives into bucket contents at the project level."

  join: regions_information {
    type: left_outer
    sql_on: ${object_attributes.location} = ${regions_information.location} ;;
    relationship: many_to_one
  }

  join: project_attributes {
    type: left_outer
    sql_on: ${object_attributes.project} = ${project_attributes.project} ;;
    relationship: many_to_one
  }

}
