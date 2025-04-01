include: "/views/*.view.lkml"

#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
#####################################################################

explore: bucket_attributes  {
  description: "The Explore establishes relationships between the Bucket Attributes table (primary), the Regions CTE View (via INNER JOIN), and the Project Attributes View (via LEFT OUTER JOIN)."

  join: regions_information {
    type: inner
    sql_on: ${bucket_attributes.location} = ${regions_information.location} ;;
    relationship: many_to_one
  }

  join: project_attributes {
    type: left_outer
    sql_on: ${bucket_attributes.project} = ${project_attributes.project} ;;
    relationship: many_to_one
  }
}
