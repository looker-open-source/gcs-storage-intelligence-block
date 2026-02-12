# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Google Cloud Storage Regions catalog.
# --------------------------------------------------------------------------
view: regions_information {
  derived_table: {
    sql:
      WITH regions_data AS (
        SELECT 'africa-south1' AS location, 'Region' AS location_type, 'South Africa' AS countries, 'Africa' AS geographic_area, '-26.206619, 28.031437' AS geographic_area_coordinates, -26.206619 AS latitude, 28.031437 AS longitude, '-26.206619, 28.031437' AS location_coordinates
        UNION ALL SELECT 'asia', 'Multi-Region', 'Japan, Singapore, South Korea, Taiwan', 'Asia Pacific', '26.228877, 122.920555', 24.6345, 124.3211, '24.6345, 124.3211'
        UNION ALL SELECT 'asia-east1', 'Region', 'Taiwan', 'Asia Pacific', '26.228877, 122.920555', 24.04955, 120.516007, '24.04955, 120.516007'
        UNION ALL SELECT 'asia-east1, asia-southeast1', 'Dual-Region', 'Taiwan, Singapore', 'Asia Pacific', '26.228877, 122.920555', 12.827841, 111.729625, '12.827841, 111.729625'
        UNION ALL SELECT 'asia-east2', 'Region', 'China', 'Asia Pacific', '26.228877, 122.920555', 22.324061, 114.171655, '22.324061, 114.171655'
        UNION ALL SELECT 'asia-northeast1', 'Region', 'Japan', 'Asia Pacific', '26.228877, 122.920555', 35.673817, 139.65123, '35.673817, 139.65123'
        UNION ALL SELECT 'asia-northeast2', 'Region', 'Japan', 'Asia Pacific', '26.228877, 122.920555', 34.693925, 135.500077, '34.693925, 135.500077'
        UNION ALL SELECT 'asia-northeast3', 'Region', 'South Korea', 'Asia Pacific', '26.228877, 122.920555', 37.552242, 126.994724, '37.552242, 126.994724'
        UNION ALL SELECT 'asia-southeast1', 'Region', 'Singapore', 'Asia Pacific', '26.228877, 122.920555', 1.340198, 103.709014, '1.340198, 103.709014'
        UNION ALL SELECT 'asia1', 'Dual-Region', 'Japan', 'Asia Pacific', '26.228877, 122.920555', 35.201581, 137.563135, '35.201581, 137.563135'
        UNION ALL SELECT 'au', 'Multi-Region', 'Australia', 'Asia Pacific', '26.228877, 122.920555', -25.2744, 133.7751, '-25.2744, 133.7751'
        UNION ALL SELECT 'australia-southeast1, australia-southeast2', 'Dual-Region', 'Australia', 'Australia', '-35.871433, 148.163385', -35.871433, 148.163385, '-35.871433, 148.163385'
        UNION ALL SELECT 'australia-southeast1', 'Region', 'Australia', 'Australia', '-35.871433, 148.163385', -33.864912, 151.207943, '-33.864912, 151.207943'
        UNION ALL SELECT 'australia-southeast2', 'Region', 'Australia', 'Australia', '-35.871433, 148.163385', -37.797206, 144.963901, '-37.797206, 144.963901'
        UNION ALL SELECT 'eu', 'Multi-Region', 'Belgium, Finland, France, Germany, Italy, Netherlands, Poland, Spain, Sweden', 'Europe', '50.419437, 8.148756', 50.552525, 8.497373, '50.552525, 8.497373'
        UNION ALL SELECT 'de', 'Multi-Region', 'Germany', 'Europe', '50.419437, 8.148756', 51.1657, 10.4515, '51.1657, 10.4515'
        UNION ALL SELECT 'it', 'Multi-Region', 'Italy', 'Europe', '50.419437, 8.148756', 41.8719, 12.5674, '41.8719, 12.5674'
        UNION ALL SELECT 'eur4', 'Dual-Region', 'Finland, Netherlands', 'Europe', '50.419437, 8.148756', 57.415689, 16.025184, '57.415689, 16.025184'
        UNION ALL SELECT 'eur5', 'Dual-Region', 'Belgium, United Kingdom', 'Europe', '50.419437, 8.148756', 51.007176, 1.867803, '51.007176, 1.867803'
        UNION ALL SELECT 'eur7', 'Dual-Region', 'United Kingdom, Germany', 'Europe', '50.419437, 8.148756', 50.894615, 4.344756, '50.894615, 4.344756'
        UNION ALL SELECT 'eur8', 'Dual-Region', 'Germany, Switzerland', 'Europe', '50.419437, 8.148756', 48.7453, 8.610991, '48.7453, 8.610991'
        UNION ALL SELECT 'europe-central2', 'Region', 'Poland', 'Europe', '50.419437, 8.148756', 52.238354, 21.009223, '52.238354, 21.009223'
        UNION ALL SELECT 'europe-central2, europe-north1', 'Dual-Region', 'Poland, Finland', 'Europe', '50.419437, 8.148756', 56.443665, 23.760607, '56.443665, 23.760607'
        UNION ALL SELECT 'europe-central2, europe-southwest1', 'Dual-Region', 'Poland, Spain', 'Europe', '50.419437, 8.148756', 46.993183, 7.290628, '46.993183, 7.290628'
        UNION ALL SELECT 'europe-central2, europe-west1', 'Dual-Region', 'Poland, Belgium', 'Europe', '50.419437, 8.148756', 51.670086, 12.246141, '51.670086, 12.246141'
        UNION ALL SELECT 'europe-central2, europe-west3', 'Dual-Region', 'Poland, Germany', 'Europe', '50.419437, 8.148756', 51.338001, 14.703662, '51.338001, 14.703662'
        UNION ALL SELECT 'europe-central2, europe-west4', 'Dual-Region', 'Poland, Netherlands', 'Europe', '50.419437, 8.148756', 53.049773, 14.02046, '53.049773, 14.02046'
        UNION ALL SELECT 'europe-central2, europe-west8', 'Dual-Region', 'Poland, Italy', 'Europe', '50.419437, 8.148756', 49.004511, 14.693853, '49.004511, 14.693853'
        UNION ALL SELECT 'europe-central2, europe-west9', 'Dual-Region', 'Poland, France', 'Europe', '50.419437, 8.148756', 50.922267, 11.342654, '50.922267, 11.342654'
        UNION ALL SELECT 'europe-north1', 'Region', 'Finland', 'Europe', '50.419437, 8.148756', 60.573043, 27.190688, '60.573043, 27.190688'
        UNION ALL SELECT 'europe-north1, europe-southwest1', 'Dual-Region', 'Finland, Spain', 'Europe', '50.419437, 8.148756', 51.479744, 8.333168, '51.479744, 8.333168'
        UNION ALL SELECT 'europe-north1, europe-west1', 'Dual-Region', 'Finland, Belgium', 'Europe', '50.419437, 8.148756', 56.070808, 13.978923, '56.070808, 13.978923'
        UNION ALL SELECT 'europe-north1, europe-west3', 'Dual-Region', 'Finland, Germany', 'Europe', '50.419437, 8.148756', 55.687379, 16.701199, '55.687379, 16.701199'
        UNION ALL SELECT 'europe-north1, europe-west8', 'Dual-Region', 'Finland, Italy', 'Europe', '50.419437, 8.148756', 53.351265, 16.588117, '53.351265, 16.588117'
        UNION ALL SELECT 'europe-north1, europe-west9', 'Dual-Region', 'Finland, France', 'Europe', '50.419437, 8.148756', 55.339813, 12.942202, '55.339813, 12.942202'
        UNION ALL SELECT 'europe-north2', 'Region', 'Sweden', 'Europe', '50.419437, 8.148756', 59.3293, 18.0686, '59.3293, 18.0686'
        UNION ALL SELECT 'europe-southwest1', 'Region', 'Spain', 'Europe', '50.419437, 8.148756', 40.423203, -3.707017, '40.423203, -3.707017'
        UNION ALL SELECT 'europe-southwest1, europe-west1', 'Dual-Region', 'Spain, Belgium', 'Europe', '50.419437, 8.148756', 45.508623, -0.281364, '45.508623, -0.281364'
        UNION ALL SELECT 'europe-southwest1, europe-west3', 'Dual-Region', 'Spain, Germany', 'Europe', '50.419437, 8.148756', 45.434948, 1.955968, '45.434948, 1.955968'
        UNION ALL SELECT 'europe-southwest1, europe-west4', 'Dual-Region', 'Spain, Netherlands', 'Europe', '50.419437, 8.148756', 47.050201, 0.918886, '47.050201, 0.918886'
        UNION ALL SELECT 'europe-southwest1, europe-west8', 'Dual-Region', 'Spain, Italy', 'Europe', '50.419437, 8.148756', 43.127066, 2.471997, '43.127066, 2.471997'
        UNION ALL SELECT 'europe-southwest1, europe-west9', 'Dual-Region', 'Spain, France', 'Europe', '50.419437, 8.148756', 44.681187, -0.898924, '44.681187, -0.898924'
        UNION ALL SELECT 'europe-west1', 'Region', 'Belgium', 'Europe', '50.419437, 8.148756', 50.471449, 3.817129, '50.471449, 3.817129'
        UNION ALL SELECT 'europe-west1, europe-west3', 'Dual-Region', 'Belgium, Germany', 'Europe', '50.419437, 8.148756', 50.317925, 6.259341, '50.317925, 6.259341'
        UNION ALL SELECT 'europe-west1, europe-west4', 'Dual-Region', 'Belgium, Netherlands', 'Europe', '50.419437, 8.148756', 51.964664, 5.276023, '51.964664, 5.276023'
        UNION ALL SELECT 'europe-west1, europe-west8', 'Dual-Region', 'Belgium, Italy', 'Europe', '50.419437, 8.148756', 48.001489, 6.629576, '48.001489, 6.629576'
        UNION ALL SELECT 'europe-west1, europe-west9', 'Dual-Region', 'Belgium, France', 'Europe', '50.419437, 8.148756', 49.66779, 3.071821, '49.66779, 3.071821'
        UNION ALL SELECT 'europe-west10', 'Region', 'Germany', 'Europe', '50.419437, 8.148756', 52.523101, 13.401341, '52.523101, 13.401341'
        UNION ALL SELECT 'europe-west10, europe-west3', 'Dual-Region', 'Germany', 'Europe', '50.419437, 8.148756', 51.1657, 10.4515, '51.1657, 10.4515'
        UNION ALL SELECT 'europe-west12', 'Region', 'Italy', 'Europe', '50.419437, 8.148756', 45.211965, 7.379327, '45.211965, 7.379327'
        UNION ALL SELECT 'europe-west12, europe-west8', 'Dual-Region', 'Italy', 'Europe', '50.419437, 8.148756', 45.211965, 7.379327, '45.211965, 7.379327'
        UNION ALL SELECT 'europe-west2', 'Region', 'United Kingdom', 'Europe', '50.419437, 8.148756', 51.509726, -0.125643, '51.509726, -0.125643'
        UNION ALL SELECT 'europe-west3', 'Region', 'Germany', 'Europe', '50.419437, 8.148756', 50.11361, 8.683244, '50.11361, 8.683244'
        UNION ALL SELECT 'europe-west3, europe-west4', 'Dual-Region', 'Germany, Netherlands', 'Europe', '50.419437, 8.148756', 51.779731, 7.793091, '51.779731, 7.793091'
        UNION ALL SELECT 'europe-west3, europe-west8', 'Dual-Region', 'Germany, Italy', 'Europe', '50.419437, 8.148756', 47.791677, 8.943693, '47.791677, 8.943693'
        UNION ALL SELECT 'europe-west3, europe-west9', 'Dual-Region', 'Germany, France', 'Europe', '50.419437, 8.148756', 49.529773, 5.476431, '49.529773, 5.476431'
        UNION ALL SELECT 'europe-west4', 'Region', 'Netherlands', 'Europe', '50.419437, 8.148756', 53.438615, 6.834814, '53.438615, 6.834814'
        UNION ALL SELECT 'europe-west4, europe-west8', 'Dual-Region', 'Netherlands, Italy', 'Europe', '50.419437, 8.148756', 49.459807, 8.103901, '49.459807, 8.103901'
        UNION ALL SELECT 'europe-west4, europe-west9', 'Dual-Region', 'Netherlands, France', 'Europe', '50.419437, 8.148756', 51.170439, 4.481469, '51.170439, 4.481469'
        UNION ALL SELECT 'europe-west6', 'Region', 'Switzerland', 'Europe', '50.419437, 8.148756', 47.376947, 8.542569, '47.376947, 8.542569'
        UNION ALL SELECT 'europe-west8', 'Region', 'Italy', 'Europe', '50.419437, 8.148756', 45.469205, 9.181849, '45.469205, 9.181849'
        UNION ALL SELECT 'europe-west8, europe-west9', 'Dual-Region', 'Italy, France', 'Europe', '50.419437, 8.148756', 47.215085, 5.875479, '47.215085, 5.875479'
        UNION ALL SELECT 'europe-west9', 'Region', 'France', 'Europe', '50.419437, 8.148756', 48.859503, 2.350808, '48.859503, 2.350808'
        UNION ALL SELECT 'in', 'Dual-Region', 'India', 'Asia Pacific', '23.908849, 74.909677', 23.90885, 74.909678, '23.90885, 74.909678'
        UNION ALL SELECT 'asia-south1', 'Region', 'India', 'Asia Pacific', '23.908849, 74.909677', 19.07439, 72.878422, '19.07439, 72.878422'
        UNION ALL SELECT 'asia-south2', 'Region', 'India', 'Asia Pacific', '23.908849, 74.909677', 28.714557, 77.098665, '28.714557, 77.098665'
        UNION ALL SELECT 'asia-south1, asia-south2', 'Dual-Region', 'India', 'Asia Pacific', '23.908849, 74.909677', 23.90885, 74.909678, '23.90885, 74.909678'
        UNION ALL SELECT 'asia-southeast2', 'Region', 'Indonesia', 'Asia Pacific', '-6.187399, 106.822633', -6.187399, 106.822633, '-6.187399, 106.822633'
        UNION ALL SELECT 'me-central1', 'Region', 'Qatar', 'Middle East', '28.138307, 45.697549', 25.295093, 51.531892, '25.295093, 51.531892'
        UNION ALL SELECT 'me-central2', 'Region', 'Saudi Arabia', 'Middle East', '28.138307, 45.697549', 26.421517, 50.087281, '26.421517, 50.087281'
        UNION ALL SELECT 'me-west1', 'Region', 'Israel', 'Middle East', '28.138307, 45.697549', 32.088196, 34.780762, '32.088196, 34.780762'
        UNION ALL SELECT 'ca', 'Multi-Region', 'Canada', 'North America', '39.490678, -99.266138', 56.1304, -106.3468, '56.1304, -106.3468'
        UNION ALL SELECT 'northamerica-northeast1, northamerica-northeast2', 'Dual-Region', 'Canada', 'North America', '39.490678, -99.266138', 44.613403, -76.519054, '44.613403, -76.519054'
        UNION ALL SELECT 'nam4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 37.495021, -87.509075, '37.495021, -87.509075'
        UNION ALL SELECT 'northamerica-northeast1', 'Region', 'Canada', 'North America', '39.490678, -99.266138', 45.498936, -73.564944, '45.498936, -73.564944'
        UNION ALL SELECT 'northamerica-northeast2', 'Region', 'Canada', 'North America', '39.490678, -99.266138', 43.65407, -79.380818, '43.65407, -79.380818'
        UNION ALL SELECT 'us', 'Multi-Region', 'United States', 'North America', '39.490678, -99.266138', 39.226851, -99.750223, '39.226851, -99.750223'
        UNION ALL SELECT 'us-central1', 'Region', 'United States', 'North America', '39.490678, -99.266138', 41.264954, -95.860417, '41.264954, -95.860417'
        UNION ALL SELECT 'us-central1, us-east4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 40.520283, -86.522509, '40.520283, -86.522509'
        UNION ALL SELECT 'us-central1, us-east5', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 40.793702, -89.367268, '40.793702, -89.367268'
        UNION ALL SELECT 'us-central1, us-south1', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 37.031975, -96.356595, '37.031975, -96.356595'
        UNION ALL SELECT 'us-central1, us-west1', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 44.137471, -108.060859, '44.137471, -108.060859'
        UNION ALL SELECT 'us-central1, us-west2', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 38.201122, -107.605979, '38.201122, -107.605979'
        UNION ALL SELECT 'us-central1, us-west3', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 41.295649, -103.90781, '41.295649, -103.90781'
        UNION ALL SELECT 'us-central1, us-west4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 39.121295, -105.844031, '39.121295, -105.844031'
        UNION ALL SELECT 'us-east1', 'Region', 'United States', 'North America', '39.490678, -99.266138', 33.196352, -80.012519, '33.196352, -80.012519'
        UNION ALL SELECT 'us-east1, us-east4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 36.127768, -78.797054, '36.127768, -78.797054'
        UNION ALL SELECT 'us-east1, us-east5', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 36.589948, -81.440579, '36.589948, -81.440579'
        UNION ALL SELECT 'us-east1, us-south1', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 33.279208, -88.425525, '33.279208, -88.425525'
        UNION ALL SELECT 'us-east1, us-west1', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 41.248379, -98.677918, '41.248379, -98.677918'
        UNION ALL SELECT 'us-east1, us-west2', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 35.149434, -99.030803, '35.149434, -99.030803'
        UNION ALL SELECT 'us-east1, us-west3', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 38.064993, -95.137921, '38.064993, -95.137921'
        UNION ALL SELECT 'us-east1, us-west4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 35.979049, -97.246718, '35.979049, -97.246718'
        UNION ALL SELECT 'us-east4', 'Region', 'United States', 'North America', '39.490678, -99.266138', 39.045953, -77.487424, '39.045953, -77.487424'
        UNION ALL SELECT 'us-east4, us-south1', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 36.310235, -87.529362, '36.310235, -87.529362'
        UNION ALL SELECT 'us-east4, us-west1', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 44.449481, -98.137685, '44.449481, -98.137685'
        UNION ALL SELECT 'us-east4, us-west2', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 38.345123, -98.55482, '38.345123, -98.55482'
        UNION ALL SELECT 'us-east4, us-west3', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 41.202492, -94.46785, '41.202492, -94.46785'
        UNION ALL SELECT 'us-east4, us-west4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 39.146327, -96.687428, '39.146327, -96.687428'
        UNION ALL SELECT 'us-east4, us-west8', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 36.248, -94.77, '36.248, -94.77'
        UNION ALL SELECT 'us-east5', 'Region', 'United States', 'North America', '39.490678, -99.266138', 39.964944, -82.99977, '39.964944, -82.99977'
        UNION ALL SELECT 'us-south1', 'Region', 'United States', 'North America', '39.490678, -99.266138', 32.797148, -96.800281, '32.797148, -96.800281'
        UNION ALL SELECT 'us-south1, us-west1', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 39.83593, -107.859488, '39.83593, -107.859488'
        UNION ALL SELECT 'us-south1, us-west2', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 33.900635, -107.445958, '33.900635, -107.445958'
        UNION ALL SELECT 'us-south1, us-west3', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 37.021621, -103.951912, '37.021621, -103.951912'
        UNION ALL SELECT 'us-south1, us-west4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 34.83426, -105.780008, '34.83426, -105.780008'
        UNION ALL SELECT 'us-west1', 'Region', 'United States', 'North America', '39.490678, -99.266138', 45.602508, -121.184333, '45.602508, -121.184333'
        UNION ALL SELECT 'us-west1, us-west2', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 39.846614, -119.594169, '39.846614, -119.594169'
        UNION ALL SELECT 'us-west1, us-west3', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 43.279517, -116.354951, '43.279517, -116.354951'
        UNION ALL SELECT 'us-west1, us-west4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 40.931855, -117.943759, '40.931855, -117.943759'
        UNION ALL SELECT 'us-west2', 'Region', 'United States', 'North America', '39.490678, -99.266138', 34.072382, -118.25112, '34.072382, -118.25112'
        UNION ALL SELECT 'us-west2, us-west3', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 37.463026, -115.215179, '37.463026, -115.215179'
        UNION ALL SELECT 'us-west2, us-west4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 35.137433, -116.713346, '35.137433, -116.713346'
        UNION ALL SELECT 'us-west3', 'Region', 'United States', 'North America', '39.490678, -99.266138', 40.768691, -111.894407, '40.768691, -111.894407'
        UNION ALL SELECT 'us-west3, us-west4', 'Dual-Region', 'United States', 'North America', '39.490678, -99.266138', 38.48677, -113.566379, '38.48677, -113.566379'
        UNION ALL SELECT 'us-west4', 'Region', 'United States', 'North America', '39.490678, -99.266138', 36.182547, -115.13519, '36.182547, -115.13519'
        UNION ALL SELECT 'us-west8', 'Region', 'United States', 'North America', '39.490678, -99.266138', 33.45043, -112.075676, '33.45043, -112.075676'
        UNION ALL SELECT 'southamerica-east1', 'Region', 'Brazil', 'South America', '-29.013786, -58.159799', -23.532524, -46.788355, '-23.532524, -46.788355'
        UNION ALL SELECT 'southamerica-west1', 'Region', 'Chile', 'South America', '-29.013786, -58.159799', -33.440271, -70.671093, '-33.440271, -70.671093'
        UNION ALL SELECT 'us-central2', 'Region', 'United States', 'North America', '39.490678, -99.266138', 37.0902, -95.7129, '37.0902, -95.7129'
        UNION ALL SELECT 'northamerica-south1', 'Region', 'Mexico', 'North America', '39.490678, -99.266138', 19.4326, -99.1332, '19.4326, -99.1332'
        UNION ALL SELECT 'us-east7', 'Region', 'United States', 'North America', '39.490678, -99.266138', 33.83, -81.16, '33.83, -81.16'
        UNION ALL SELECT 'us-central1-a', 'Zone', 'United States', 'North America', '39.490678, -99.266138', 41.264954, -95.860417, '41.264954, -95.860417'
        UNION ALL SELECT 'us-central1-b', 'Zone', 'United States', 'North America', '39.490678, -99.266138', 41.264954, -95.860417, '41.264954, -95.860417'
        UNION ALL SELECT 'us-central1-c', 'Zone', 'United States', 'North America', '39.490678, -99.266138', 41.264954, -95.860417, '41.264954, -95.860417'
        UNION ALL SELECT 'us-central1-f', 'Zone', 'United States', 'North America', '39.490678, -99.266138', 41.264954, -95.860417, '41.264954, -95.860417'
        UNION ALL SELECT 'us-east4-a', 'Zone', 'United States', 'North America', '39.490678, -99.266138', 39.045953, -77.487424, '39.045953, -77.487424'
        UNION ALL SELECT 'us-east4-b', 'Zone', 'United States', 'North America', '39.490678, -99.266138', 39.045953, -77.487424, '39.045953, -77.487424'
        UNION ALL SELECT 'us-east4-c', 'Zone', 'United States', 'North America', '39.490678, -99.266138', 39.045953, -77.487424, '39.045953, -77.487424'
      )
      SELECT * FROM regions_data ;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: location {
    primary_key: yes
    type: string
    sql: ${TABLE}.location ;;
    description: "This field represents the region or multi-region name within Google Cloud Storage (GCS). It is designated as the primary key for the Regions Information View."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: coordinates {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    html: <span>{{ location._value }}</span> ;;
    description: "The set of coordinates for the region based on latitude and longitude."
  }

  dimension: countries_union {
    label: "Countries"
    type: string
    sql:
      CASE
        WHEN ${geographic_area} = 'Europe' AND NOT (${countries} LIKE ('%United Kingdom%') OR ${countries} LIKE ('%Switzerland%')) THEN 'European Union'
        WHEN ${countries} = 'United States' THEN 'United States'
        ELSE ${countries}
      END;;
    description: "This field categorizes regions based on country membership within the European Union or the United States. Regions outside these unions retain their standard 'Countries' designation."
  }

  dimension: countries {
    hidden: yes
    type: string
    sql: ${TABLE}.countries ;;
    map_layer_name: single_countries
    description: "The country or countries comprising the geographic scope of the region"
  }

  dimension: geographic_area_coordinates {
    type: string
    sql: ${TABLE}.geographic_area_coordinates ;;
    description: "This field represents the cartesian coordinate pair associated with the Geographic Area."
  }

  dimension: geographic_area {
    type: string
    sql: ${TABLE}.geographic_area ;;
    map_layer_name: gcs_regions
    description: "Geographic Area is derived from the bucket's location, adhering to Google Cloud Storage Single-Region location specifications. Available regions are categorized as: North America, South America, Europe, Asia, India, Indonesia, the Middle East, Australia, and Africa."
  }

  dimension: geographical_value {
    label_from_parameter: map_selection
    sql:
      {% if map_selection._parameter_value == "countries_map" %}
        ${countries}
      {% elsif map_selection._parameter_value == "region_map" %}
        ${region}
      {% endif %};;
    map_layer_name: geographical_value
    description: "This field allows users to toggle between displaying values as regions or countries, both of which are map layer-associated. Selection is controlled by a corresponding parameter (Map Selection)."
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    description: "The specific latitude of the region."
  }

  dimension: location_coordinates {
    type: string
    sql: ${TABLE}.location_coordinates ;;
    description: "This field provides a string containing the concatenated latitude and longitude coordinates for each region."
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
    description: "This field identifies the bucket's location type, classified as: Region (single), Dual-Region (two distinct regions), or Multi-Region (a pre-defined set of regions)."
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    description: "The specific longitude of the region."
  }

  dimension: outside_eu {
    label: "Outside EU"
    type: yesno
    sql: ${countries_union} != 'European Union' ;;
    description: "A boolean value specifying if the region's geographical location is external to the European Union."
  }

  dimension: outside_usa {
    label: "Is outside USA"
    type: yesno
    sql: ${countries_union} != 'United States' ;;
    description: "A boolean value specifying if the region's geographical location is external to the United States."
  }

  dimension: region {
    type: string
    sql: ${TABLE}.location ;;
    map_layer_name: region_coordinates
    description: "This field represents the region or multi-region name within Google Cloud Storage (GCS). This dimension is needed as it is associated with a map layer."
  }

  dimension: selected_country {
    type: string
    sql:
      CASE
        WHEN REGEXP_CONTAINS(${countries}, {{ country_options._parameter_value }}) THEN {{ country_options._parameter_value }}
        ELSE
          NULL
      END;;
    map_layer_name: single_countries
    description: "This field facilitates the selection of individual countries from the list presented in the 'Map Selection' parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: count {
    type: count
    drill_fields: [detail*]
    description: "A measure that counts the total number of regions within the Google Cloud Storage (GCS) catalog."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Parameters -------------------------------
  # --------------------------------------------------------------------------------------------------------

  parameter: country_options {
    type: string
    description: "Predefined values representing all single countries within the Google Cloud Storage (GCS) Regions catalog."
    default_value: "select"

    allowed_value: {
      label: "Select a Country"
      value: "select"
    }

    allowed_value: {
      label: "Australia"
      value: "Australia"
    }

    allowed_value: {
      label: "Belgium"
      value: "Belgium"
    }

    allowed_value: {
      label: "Brazil"
      value: "Brazil"
    }

    allowed_value: {
      label: "Canada"
      value: "Canada"
    }

    allowed_value: {
      label: "Chile"
      value: "Chile"
    }

    allowed_value: {
      label: "China"
      value: "China"
    }

    allowed_value: {
      label: "Finland"
      value: "Finland"
    }

    allowed_value: {
      label: "France"
      value: "France"
    }

    allowed_value: {
      label: "Germany"
      value: "Germany"
    }

    allowed_value: {
      label: "India"
      value: "India"
    }

    allowed_value: {
      label: "Indonesia"
      value: "Indonesia"
    }

    allowed_value: {
      label: "Israel"
      value: "Israel"
    }

    allowed_value: {
      label: "Italy"
      value: "Italy"
    }

    allowed_value: {
      label: "Japan"
      value: "Japan"
    }

    allowed_value: {
      label: "Mexico"
      value: "Mexico"
    }

    allowed_value: {
      label: "Netherlands"
      value: "Netherlands"
    }

    allowed_value: {
      label: "Poland"
      value: "Poland"
    }

    allowed_value: {
      label: "Qatar"
      value: "Qatar"
    }

    allowed_value: {
      label: "Saudi Arabia"
      value: "Saudi Arabia"
    }

    allowed_value: {
      label: "Singapore"
      value: "Singapore"
    }

    allowed_value: {
      label: "South Africa"
      value: "South Africa"
    }

    allowed_value: {
      label: "South Korea"
      value: "South Korea"
    }

    allowed_value: {
      label: "Spain"
      value: "Spain"
    }

    allowed_value: {
      label: "Sweden"
      value: "Sweden"
    }

    allowed_value: {
      label: "Switzerland"
      value: "Switzerland"
    }

    allowed_value: {
      label: "Taiwan"
      value: "Taiwan"
    }

    allowed_value: {
      label: "United Kingdom"
      value: "United Kingdom"
    }

    allowed_value: {
      label: "United States"
      value: "United States"
    }
  }

  parameter: map_selection {
    type: unquoted

    allowed_value: {
      label: "Countries"
      value: "countries_map"
    }

    allowed_value: {
      label: "Region"
      value: "region_map"
    }

    default_value: "region_map"
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Sets -------------------------------
  # --------------------------------------------------------------------------------------------------------

  set: detail {
    fields: [
      location,
      geographic_area,
      geographic_area_coordinates,
      location_type,
      countries,
      latitude,
      longitude,
      location_coordinates
    ]
  }
}
