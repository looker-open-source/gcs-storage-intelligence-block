# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Nov 4, 2026
# Purpose: Template file for defining LookML view and explore refinements.
# --------------------------------------------------------------------------

# views
include: "/views/*.view.lkml"
# explores
include: "/explores/*.explore.lkml"

# #
# Use LookML refinements to refine views and explores defined in the remote project.
# Learn more at: https://cloud.google.com/looker/docs/data-modeling/learning-lookml/refinements
#
#
# For example we could add a new dimension to a view:
#     view: +flights {
#       dimension: air_carrier {
#         type: string
#         sql: ${TABLE}.air_carrier ;;
#       }
#     }
#
# Or apply a label to an explore:
#     explore: +aircraft {
#       label: "Aircraft Simplified"
#     }
#
