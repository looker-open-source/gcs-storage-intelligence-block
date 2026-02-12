# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# Purpose: Defines custom geospatial map layers to enable regional
#          visualizations of GCS storage and activity metrics.
# --------------------------------------------------------------------------

map_layer: gcs_regions {
  #file: "/maps/regions.geojson"
  url: "https://raw.githubusercontent.com/looker-open-source/gcs-storage-intelligence-block/master/maps/regions.geojson"
  property_key: "Region"
}
