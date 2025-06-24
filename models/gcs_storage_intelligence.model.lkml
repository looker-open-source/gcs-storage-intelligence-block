 #####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Apr 30, 2025
# Purpose: Main model inside the gcs_storage_intelligence_block project.
#####################################################################
connection: "@{CONNECTION_NAME}"

# views
include: "/views/*.view.lkml"
# datagorups
include: "/attributes/datagroups/*.lkml"
# explores
include: "/explores/*.explore.lkml"
# map_layers
include: "/attributes/map_layers/*.lkml"
# dashboards
include: "/dashboards/*.dashboard.lookml"


persist_with: gcs_storage_intelligence_default_datagroup
