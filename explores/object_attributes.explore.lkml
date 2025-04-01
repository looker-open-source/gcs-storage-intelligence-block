include: "/views/*.view.lkml"

#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
#####################################################################

explore: object_attributes {
  description: "The Explore establishes relationships between the Object Attributes table (primary), the Bucket Attributes View (via INNER JOIN), the Regions CTE View (via INNER JOIN), and the Project Attributes View (via LEFT OUTER JOIN)."

  join: bucket_attributes {
    type: inner
    sql_on: ${object_attributes.bucket_name} = ${bucket_attributes.bucket_name} ;;
    relationship: many_to_one
  }

  join: regions_information {
    type: inner
    sql_on: ${object_attributes.location} = ${regions_information.location} ;;
    relationship: many_to_one
  }

  join: project_attributes {
    type: left_outer
    sql_on: ${bucket_attributes.project} = ${bucket_attributes.project} ;;
    relationship: many_to_one
  }

}
