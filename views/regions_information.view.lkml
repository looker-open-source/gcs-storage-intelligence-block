#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Purpose: Contains information about the Google Cloud Storage Regions catalog.
#####################################################################
view: regions_information {
  derived_table: {
    sql: WITH
        regions_information AS (
              WITH location_set AS (SELECT 'africa-south1' AS location, 'Africa' AS geographic_area, 'Region' AS location_type, 'South Africa' AS countries, 'Gauteng' AS state, 'Johannesburg' AS city, -26.206619 AS latitude, 28.031437 AS longitude
            UNION ALL
            SELECT 'asia', 'Asia', 'Multi-Region', 'Taiwan, Japan, South Korea, Singapore', 'Taiwan Province, Kanto, Kansai, Seoul Capital, West Region', 'Changhua County, Tokyo, Osaka, Seoul, Jurong West', 27.407598, 124.302272
            UNION ALL
            SELECT 'asia-east1', 'Asia', 'Region', 'Taiwan', 'Taiwan Province', 'Changhua County', 24.04955, 120.516007
            UNION ALL
            SELECT 'asia-east1, asia-southeast1', 'Asia', 'Dual-Region', 'Taiwan, Singapore', 'Taiwan Province, West Region', 'Changhua County, Jurong West', 12.827841, 111.729625
            UNION ALL
            SELECT 'asia-east2', 'Asia', 'Region', 'China', 'Hong Kong', 'Hong Kong', 22.324061, 114.171655
            UNION ALL
            SELECT 'asia-northeast1', 'Asia', 'Region', 'Japan', 'Kanto', 'Tokyo', 35.673817, 139.65123
            UNION ALL
            SELECT 'asia-northeast2', 'Asia', 'Region', 'Japan', 'Kansai', 'Osaka', 34.693925, 135.500077
            UNION ALL
            SELECT 'asia-northeast3', 'Asia', 'Region', 'South Korea', 'Seoul Capital', 'Seoul', 37.552242, 126.994724
            UNION ALL
            SELECT 'asia-south1', 'India', 'Region', 'India', 'Maharashtra', 'Mumbai', 19.07439, 72.878422
            UNION ALL
            SELECT 'asia-south1, asia-south2', 'India', 'Dual-Region', 'India', 'Maharashtra, Delhi', 'New Delhi', 23.90885, 74.909678
            UNION ALL
            SELECT 'asia-south2', 'India', 'Region', 'India', 'Delhi', 'New Delhi', 28.714557, 77.098665
            UNION ALL
            SELECT 'asia-southeast1', 'Asia', 'Region', 'Singapore', 'West Region', 'Jurong West', 1.340198, 103.709014
            UNION ALL
            SELECT 'asia-southeast2', 'Indonesia', 'Region', 'Indonesia', 'Java', 'Jakarta', -6.187399, 106.822633
            UNION ALL
            SELECT 'asia1', 'Asia', 'Dual-Region', 'Japan', 'Kanto, Kansai', 'Tokyo, Osaka', 35.201581, 137.563135
            UNION ALL
            SELECT 'australia-southeast1', 'Australia', 'Region', 'Australia', 'New South Wales', 'Sidney', -33.864912, 151.207943
            UNION ALL
            SELECT 'australia-southeast1, australia-southeast2', 'Australia', 'Dual-Region', 'Australia', 'New South Wales, Victoria', 'Sidney, Melbourne', -35.871433, 148.163385
            UNION ALL
            SELECT 'australia-southeast2', 'Australia', 'Region', 'Australia', 'Victoria', 'Melbourne', -37.797206, 144.963901
            UNION ALL
            SELECT 'eu', 'Europe', 'Multi-Region', 'Poland, Finland, Spain, Belgium, Germany, Netherlands, Italy, France', 'Masovian Voivodeship, Kymenlaakso, Community of Madrid, Wallonia, Hesse, Groningen, Lombardy, Ile-de-France', 'Warsaw, Hamina, Madrid, Saint-Ghislain, Frankfurt am Main, Eemshaven, Milan, Paris', 50.552525, 8.497373
            UNION ALL
            SELECT 'eur4', 'Europe', 'Dual-Region', 'Finland, Netherlands', 'Kymenlaakso, Groningen', 'Hamina, Eemshaven', 57.415689, 16.025184
            UNION ALL
            SELECT 'eur5', 'Europe', 'Dual-Region', 'Belgium, UK', 'Wallonia, Greater London', 'Saint-Ghislain, London', 51.007176, 1.867803
            UNION ALL
            SELECT 'eur7', 'Europe', 'Dual-Region', 'UK, Germany', 'Greater London, Hesse', 'London, Frankfurt am Main', 50.894615, 4.344756
            UNION ALL
            SELECT 'eur8', 'Europe', 'Dual-Region', 'Germany, Switzerland', 'Hesse, Canton of Zurich', 'Frankfurt am Main, Zurich', 48.7453, 8.610991
            UNION ALL
            SELECT 'europe-central2', 'Europe', 'Region', 'Poland', 'Masovian Voivodeship', 'Warsaw', 52.238354, 21.009223
            UNION ALL
            SELECT 'europe-central2, europe-north1', 'Europe', 'Dual-Region', 'Poland, Finland', 'Masovian Voivodeship, Kymenlaakso', 'Warsaw, Hamina', 56.443665, 23.760607
            UNION ALL
            SELECT 'europe-central2, europe-southwest1', 'Europe', 'Dual-Region', 'Poland, Spain', 'Masovian Voivodeship, Community of Madrid', 'Warsaw, Madrid', 46.993183, 7.290628
            UNION ALL
            SELECT 'europe-central2, europe-west1', 'Europe',  'Dual-Region', 'Poland, Belgium', 'Masovian Voivodeship, Wallonia', 'Warsaw, Saint-Ghislain', 51.670086, 12.246141
            UNION ALL
            SELECT 'europe-central2, europe-west3', 'Europe', 'Dual-Region', 'Poland, Germany', 'Masovian Voivodeship, Hesse', 'Warsaw, Frankfurt am Main', 51.338001, 14.703662
            UNION ALL
            SELECT 'europe-central2, europe-west4', 'Europe', 'Dual-Region', 'Poland, Netherlands', 'Masovian Voivodeship, Groningen', 'Warsaw, Eemshaven', 53.049773, 14.02046
            UNION ALL
            SELECT 'europe-central2, europe-west8', 'Europe', 'Dual-Region', 'Poland, Italy', 'Masovian Voivodeship, Lombardy', 'Warsaw, Milan', 49.004511, 14.693853
            UNION ALL
            SELECT 'europe-central2, europe-west9', 'Europe', 'Dual-Region', 'Poland, France', 'Masovian Voivodeship, Ile-de-France', 'Warsaw, Paris', 50.922267, 11.342654
            UNION ALL
            SELECT 'europe-north1', 'Europe', 'Region', 'Finland', 'Kymenlaakso', 'Hamina', 60.573043, 27.190688
            UNION ALL
            SELECT 'europe-north1, europe-southwest1', 'Europe', 'Dual-Region', 'Finland, Spain', 'Kymenlaakso, Community of Madrid', 'Hamina, Madrid', 51.479744, 8.333168
            UNION ALL
            SELECT 'europe-north1, europe-west1', 'Europe', 'Dual-Region', 'Finland, Belgium', 'Kymenlaakso, Wallonia', 'Hamina, Saint-Ghislain', 56.070808, 13.978923
            UNION ALL
            SELECT 'europe-north1, europe-west3', 'Europe', 'Dual-Region', 'Finland, Germany', 'Kymenlaakso, Hesse', 'Hamina, Frankfurt am Main', 55.687379, 16.701199
            UNION ALL
            SELECT 'europe-north1, europe-west8', 'Europe', 'Dual-Region', 'Finland, Italy', 'Kymenlaakso, Lombardy', 'Hamina, Milan', 53.351265, 16.588117
            UNION ALL
            SELECT 'europe-north1, europe-west9', 'Europe', 'Dual-Region', 'Finland, France', 'Kymenlaakso, Ile-de-France', 'Hamina, Paris', 55.339813, 12.942202
            UNION ALL
            SELECT 'europe-southwest1', 'Europe', 'Region', 'Spain', 'Community of Madrid', 'Madrid', 40.423203, -3.707017
            UNION ALL
            SELECT 'europe-southwest1, europe-west1', 'Europe', 'Dual-Region', 'Spain, Belgium', 'Community of Madrid, Wallonia', 'Madrid, Saint-Ghislain', 45.508623, -0.281364
            UNION ALL
            SELECT 'europe-southwest1, europe-west3', 'Europe', 'Dual-Region', 'Spain, Germany', 'Community of Madrid, Hesse', 'Madrid, Frankfurt am Main', 45.434948, 1.955968
            UNION ALL
            SELECT 'europe-southwest1, europe-west4', 'Europe', 'Dual-Region', 'Spain, Netherlands', 'Community of Madrid, Groningen', 'Madrid, Eemshaven', 47.050201, 0.918886
            UNION ALL
            SELECT 'europe-southwest1, europe-west8', 'Europe', 'Dual-Region', 'Spain, Italy', 'Community of Madrid, Lombardy', 'Madrid, Milan', 43.127066, 2.471997
            UNION ALL
            SELECT 'europe-southwest1, europe-west9', 'Europe', 'Dual-Region', 'Spain, France', 'Community of Madrid, Ile-de-France', 'Madrid, Paris', 44.681187, -0.898924
            UNION ALL
            SELECT 'europe-west1', 'Europe', 'Region', 'Belgium', 'Wallonia', 'Saint-Ghislain', 50.471449, 3.817129
            UNION ALL
            SELECT 'europe-west1, europe-west3', 'Europe', 'Dual-Region', 'Belgium, Germany', 'Wallonia, Hesse', 'Saint-Ghislain, Frankfurt am Main', 50.317925, 6.259341
            UNION ALL
            SELECT 'europe-west1, europe-west4', 'Europe', 'Dual-Region', 'Belgium, Netherlands', 'Wallonia, Groningen', 'Saint-Ghislain, Eemshaven', 51.964664, 5.276023
            UNION ALL
            SELECT 'europe-west1, europe-west8', 'Europe', 'Dual-Region', 'Belgium, Italy', 'Wallonia, Lombardy', 'Saint-Ghislain, Milan', 48.001489, 6.629576
            UNION ALL
            SELECT 'europe-west1, europe-west9', 'Europe', 'Dual-Region', 'Belgium, France', 'Wallonia, Ile-de-France', 'Saint-Ghislain, Paris', 49.66779, 3.071821
            UNION ALL
            SELECT 'europe-west10', 'Europe', 'Region', 'Germany', 'Berlin', 'Berlin', 52.523101, 13.401341
            UNION ALL
            SELECT 'europe-west12', 'Europe', 'Region', 'Italy', 'Piedmont', 'Turin', 45.211965, 7.379327
            UNION ALL
            SELECT 'europe-west2', 'Europe', 'Region', 'UK', 'Greater London', 'London', 51.509726, -0.125643
            UNION ALL
            SELECT 'europe-west3', 'Europe', 'Region', 'Germany', 'Hesse', 'Frankfurt am Main', 50.11361, 8.683244
            UNION ALL
            SELECT 'europe-west3, europe-west4', 'Europe', 'Dual-Region', 'Germany, Netherlands', 'Hesse, Groningen', 'Frankfurt am Main, Eemshaven', 51.779731, 7.793091
            UNION ALL
            SELECT 'europe-west3, europe-west8', 'Europe', 'Dual-Region', 'Germany, Italy', 'Hesse, Lombardy', 'Frankfurt am Main, Milan', 47.791677, 8.943693
            UNION ALL
            SELECT 'europe-west3, europe-west9', 'Europe', 'Dual-Region', 'Germany, France', 'Hesse, Ile-de-France', 'Frankfurt am Main, Paris', 49.529773, 5.476431
            UNION ALL
            SELECT 'europe-west4', 'Europe', 'Region', 'Netherlands', 'Groningen', 'Eemshaven', 53.438615, 6.834814
            UNION ALL
            SELECT 'europe-west4, europe-west8', 'Europe', 'Dual-Region', 'Netherlands, Italy', 'Groningen, Lombardy', 'Eemshaven, Milan', 49.459807, 8.103901
            UNION ALL
            SELECT 'europe-west4, europe-west9', 'Europe', 'Dual-Region', 'Netherlands, France', 'Groningen, Ile-de-France', 'Eemshaven, Paris', 51.170439, 4.481469
            UNION ALL
            SELECT 'europe-west6', 'Europe', 'Region', 'Switzerland', 'Canton of Zurich', 'Zurich', 47.376947, 8.542569
            UNION ALL
            SELECT 'europe-west8', 'Europe', 'Region', 'Italy', 'Lombardy', 'Milan', 45.469205, 9.181849
            UNION ALL
            SELECT 'europe-west8, europe-west9', 'Europe', 'Dual-Region', 'Italy, France', 'Lombardy, Ile-de-France', 'Milan, Paris', 47.215085, 5.875479
            UNION ALL
            SELECT 'europe-west9', 'Europe', 'Region', 'France', 'Ile-de-France', 'Milan', 48.859503, 2.350808
            UNION ALL
            SELECT 'me-central1', 'Middle East', 'Region', 'Qatar', 'Doha', 'Doha', 25.295093, 51.531892
            UNION ALL
            SELECT 'me-central2', 'Middle East', 'Region', 'Saudi Arabia', 'Eastern Province', 'Dammam', 26.421517, 50.087281
            UNION ALL
            SELECT 'me-west1', 'Middle East', 'Region', 'Israel', 'Tel Aviv', 'Tel Aviv', 32.088196, 34.780762
            UNION ALL
            SELECT 'nam4', 'North America', 'Dual-Region', 'United States', 'Iowa, South Carolina', 'Council Bluffs, Moncks Corner', 37.495021, -87.509075
            UNION ALL
            SELECT 'northamerica-northeast1', 'North America', 'Region', 'Canada', 'Quebec', 'Montreal', 45.498936, -73.564944
            UNION ALL
            SELECT 'northamerica-northeast1, northamerica-northeast2', 'North America', 'Dual-Region', 'Canada', 'Quebec,Ontario', 'Montreal, Toronto', 44.613403, -76.519054
            UNION ALL
            SELECT 'northamerica-northeast2', 'North America', 'Region', 'Canada', 'Ontario', 'Toronto', 43.65407, -79.380818
            UNION ALL
            SELECT 'southamerica-east1', 'South America', 'Region', 'Brazil', 'Sao Paulo', 'Osasco', -23.532524, -46.788355
            UNION ALL
            SELECT 'southamerica-west1', 'South America', 'Region', 'Chile', 'Santiago Province', 'Santiago', -33.440271, -70.671093
            UNION ALL
            SELECT 'us', 'North America', 'Multi-Region', 'United States', 'Iowa, South Carolina, Virginia, Ohio, Texas, Oregon, California, Utah, Nevada', 'Council Bluffs, Moncks Corner, Ashburn, Columbus, Dallas, The Dalles, Los Angeles, Salt Lake City, Las Vegas', 39.226851, -99.750223
            UNION ALL
            SELECT 'us-central1', 'North America', 'Region', 'United States', 'Iowa', 'Council Bluffs', 41.264954, -95.860417
            UNION ALL
            SELECT 'us-central1, us-east4', 'North America', 'Dual-Region', 'United States', 'Iowa, Virginia', 'Council Bluffs, Ashburn', 40.520283, -86.522509
            UNION ALL
            SELECT 'us-central1, us-east5', 'North America', 'Dual-Region', 'United States', 'Iowa, Ohio', 'Council Bluffs, Columbus', 40.793702, -89.367268
            UNION ALL
            SELECT 'us-central1, us-south1', 'North America', 'Dual-Region', 'United States', 'Iowa, Dallas', 'Council Bluffs, Dallas', 37.031975, -96.356595
            UNION ALL
            SELECT 'us-central1, us-west1', 'North America', 'Dual-Region', 'United States', 'Iowa, Oregon', 'Council Bluffs, The Dalles', 44.137471, -108.060859
            UNION ALL
            SELECT 'us-central1, us-west2', 'North America', 'Dual-Region', 'United States', 'Iowa, California', 'Council Bluffs, Los Angeles', 38.201122, -107.605979
            UNION ALL
            SELECT 'us-central1, us-west3', 'North America', 'Dual-Region', 'United States', 'Iowa, Utah', 'Council Bluffs, Salt Lake City', 41.295649, -103.90781
            UNION ALL
            SELECT 'us-central1, us-west4', 'North America', 'Dual-Region', 'United States', 'Iowa, Nevada', 'Council Bluffs, Las Vegas', 39.121295, -105.844031
            UNION ALL
            SELECT 'us-east1', 'North America', 'Region', 'United States', 'South Carolina', 'Moncks Corner', 33.196352, -80.012519
            UNION ALL
            SELECT 'us-east1, us-east4', 'North America', 'Dual-Region', 'United States', 'South Carolina, Virginia', 'Moncks Corner, Ashburn', 36.127768, -78.797054
            UNION ALL
            SELECT 'us-east1, us-east5', 'North America', 'Dual-Region', 'United States', 'South Carolina, Ohio', 'Moncks Corner, Columbus', 36.589948, -81.440579
            UNION ALL
            SELECT 'us-east1, us-south1', 'North America', 'Dual-Region', 'United States', 'South Carolina, Texas', 'Moncks Corner, Dallas', 33.279208, -88.425525
            UNION ALL
            SELECT 'us-east1, us-west1', 'North America', 'Dual-Region', 'United States', 'South Carolina, Oregon', 'Moncks Corner, The Dalles', 41.248379, -98.677918
            UNION ALL
            SELECT 'us-east1, us-west2', 'North America', 'Dual-Region', 'United States', 'South Carolina, California', 'Moncks Corner, Los Angeles', 35.149434, -99.030803
            UNION ALL
            SELECT 'us-east1, us-west3', 'North America', 'Dual-Region', 'United States', 'South Carolina, Utah', 'Moncks Corner, Salt Lake City', 38.064993, -95.137921
            UNION ALL
            SELECT 'us-east1, us-west4', 'North America', 'Dual-Region', 'United States', 'South Carolina, Nevada', 'Moncks Corner, Las Vegas', 35.979049, -97.246718
            UNION ALL
            SELECT 'us-east4', 'North America', 'Region', 'United States', 'Virginia', 'Ashburn', 39.045953, -77.487424
            UNION ALL
            SELECT 'us-east4, us-south1', 'North America', 'Dual-Region', 'United States', 'Virginia, Texas', 'Ashburn, Dallas', 36.310235, -87.529362
            UNION ALL
            SELECT 'us-east4, us-west1', 'North America', 'Dual-Region', 'United States', 'Virginia, Oregon', 'Ashburn, The Dalles', 44.449481, -98.137685
            UNION ALL
            SELECT 'us-east4, us-west2', 'North America', 'Dual-Region', 'United States', 'Virginia, California', 'Ashburn, Los Angeles', 38.345123, -98.55482
            UNION ALL
            SELECT 'us-east4, us-west3', 'North America', 'Dual-Region', 'United States', 'Virginia, Utah', 'Ashburn, Salt Lake City', 41.202492, -94.46785
            UNION ALL
            SELECT 'us-east4, us-west4', 'North America', 'Dual-Region', 'United States', 'Virginia, Nevada', 'Ashburn, Las Vegas', 39.146327, -96.687428
            UNION ALL
            SELECT 'us-east5', 'North America', 'Region', 'United States', 'Ohio', 'Columbus', 39.964944, -82.99977
            UNION ALL
            SELECT 'us-east7', 'North America', 'Region', 'United States', 'Alabama', NULL, NULL, NULL
            UNION ALL
            SELECT 'us-south1', 'North America', 'Region', 'United States', 'Texas', 'Dallas', 32.797148, -96.800281
            UNION ALL
            SELECT 'us-south1, us-west1', 'North America', 'Dual-Region', 'United States', 'Texas, Oregon', 'Dallas, The Dalles', 39.83593, -107.859488
            UNION ALL
            SELECT 'us-south1, us-west2', 'North America', 'Dual-Region', 'United States', 'Texas, California', 'Dallas, Los Angeles', 33.900635, -107.445958
            UNION ALL
            SELECT 'us-south1, us-west3', 'North America', 'Dual-Region', 'United States', 'Texas, Utah', 'Dallas, Salt Lake City', 37.021621, -103.951912
            UNION ALL
            SELECT 'us-south1, us-west4', 'North America', 'Dual-Region', 'United States', 'Texas, Nevada', 'Dallas, Las Vegas', 34.83426, -105.780008
            UNION ALL
            SELECT 'us-west1', 'North America', 'Region', 'United States', 'Oregon', 'The Dalles', 45.602508, -121.184333
            UNION ALL
            SELECT 'us-west1, us-west2', 'North America', 'Dual-Region', 'United States', 'Oregon, California', 'The Dalles, Los Angeles', 39.846614, -119.594169
            UNION ALL
            SELECT 'us-west1, us-west3', 'North America', 'Dual-Region', 'United States', 'Oregon, Utah', 'The Dalles, Salt Lake City', 43.279517, -116.354951
            UNION ALL
            SELECT 'us-west1, us-west4', 'North America', 'Dual-Region', 'United States', 'Oregon, Nevada', 'The Dalles, Las Vegas', 40.931855, -117.943759
            UNION ALL
            SELECT 'us-west2', 'North America', 'Region', 'United States', 'California', 'Los Angeles', 34.072382, -118.25112
            UNION ALL
            SELECT 'us-west2, us-west3', 'North America', 'Dual-Region', 'United States', 'California, Utah', 'Los Angeles, Salt Lake City', 37.463026, -115.215179
            UNION ALL
            SELECT 'us-west2, us-west4', 'North America', 'Dual-Region', 'United States', 'California, Nevada', 'Los Angeles, Las Vegas', 35.137433, -116.713346
            UNION ALL
            SELECT 'us-west3', 'North America', 'Region', 'United States', 'Utah', 'Salt Lake City', 40.768691, -111.894407
            UNION ALL
            SELECT 'us-west3, us-west4', 'North America', 'Dual-Region', 'United States', 'Utah, Nevada', 'Salt Lake City, Las Vegas', 38.48677, -113.566379
            UNION ALL
            SELECT 'us-west4', 'North America', 'Region', 'United States', 'Nevada', 'Las Vegas', 36.182547, -115.13519
            UNION ALL
            SELECT 'us-west8', 'North America', 'Region', 'United States', 'Arizona', 'Phoenix', 33.450430, -112.075676), geographic_area_location AS (
            SELECT 'Africa' as geographic_area, '-26.206619, 28.031437' as geographic_area_coordinates
            UNION ALL
            SELECT 'Asia', '26.22887736583804, 122.92055542594133'
            UNION ALL
            SELECT 'Australia', '-35.87143312617882, 148.16338509205735'
            UNION ALL
            SELECT 'Europe', '50.419437352900566, 8.148756653935328'
            UNION ALL
            SELECT 'India', '23.908849931246557, 74.90967780978364'
            UNION ALL
            SELECT 'Indonesia', '-6.187399000000001, 106.822633'
            UNION ALL
            SELECT 'Middle East', '28.1383073720678, 45.697549748255476'
            UNION ALL
            SELECT 'North America', '39.49067855459679, -99.26613885745078'
            UNION ALL
            SELECT 'South America', '-29.01378617077172, -58.159799449834644')
          SELECT
            ls.location,
            ls.geographic_area,
            gal.geographic_area_coordinates,
            ls.location_type,
            ls.countries,
            ls.latitude,
            ls.longitude,
            CONCAT(CAST(ls.latitude AS STRING), ', ', CAST(ls.longitude AS STRING)) AS location_coordinates
          FROM
            location_set AS ls
         JOIN
            geographic_area_location as gal
          ON ls.geographic_area = gal.geographic_area)

      SELECT
        *
      FROM
        regions_information ;;
  }

################################### Primary Key #################################

  dimension: location {
    primary_key: yes
    type: string
    sql: ${TABLE}.location ;;
    description: "This field represents the region or multi-region name within Google Cloud Storage (GCS). It is designated as the primary key for the Regions Information View."
  }

################################## Dimensions ##################################

  dimension: coordinates {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    html: <span>{{ location._value }}</span> ;;
    description: "The set of coordinates for the region based on latitude and longitude."
  }

  dimension: countries_union {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${geographic_area} = 'Europe' AND NOT (${countries} LIKE ('%UK%') OR ${countries} LIKE ('%Switzerland%')) THEN 'European Union'
        WHEN ${countries} = 'United States' THEN 'United States'
        ELSE ${countries}
      END;;
    description: "This field categorizes regions based on country membership within the European Union or the United States. Regions outside these unions retain their standard 'Countries' designation."
  }

  dimension: countries {
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

  ################################## Dimension Group ##################################


  ##################################### Measures ######################################

  measure: count {
    type: count
    drill_fields: [detail*]
    description: "A measure that counts the total number of regions within the Google Cloud Storage (GCS) catalog."
  }

###################################### Parameters ###################################

  parameter: country_options {
    type: string

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
      label: "Taiwan"
      value: "Taiwan"
    }

    allowed_value: {
      label: "UK"
      value: "UK"
    }

    allowed_value: {
      label: "United States"
      value: "United States"
    }

    allowed_value: {
      label: "Select a Country"
      value: "select"
    }

    default_value: "select"
    description: "Predefined values representing all single countries within the Google Cloud Storage (GCS) Regions catalog."
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
