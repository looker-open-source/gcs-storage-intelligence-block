# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# Purpose: Defines custom geospatial map layers to enable regional
#          visualizations of GCS storage and activity metrics.
# --------------------------------------------------------------------------

map_layer: single_countries {
  #file: "/maps/single_countries.geojson"
  url: "https://raw.githubusercontent.com/looker-open-source/gcs-storage-intelligence-block/master/maps/single_countries.geojson"
  property_key: "countries"
}
