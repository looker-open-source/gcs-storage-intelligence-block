connection: "@{connection_name}"

# views
include: "/views/*.view.lkml"
# datagorups
include: "/attributes/datagroups/*.lkml"
# map_layers
include: "/attributes/map_layers/*.lkml"
# explores
include: "/explores/*.explore.lkml"
# dashboards
include: "/dashboards/*.dashboard.lookml"

include: "/views/regions_information.view.lkml"

explore: regions_information {}



persist_with: gcs_storage_insights_default_datagroup
