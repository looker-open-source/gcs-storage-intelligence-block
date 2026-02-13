# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Bucket Region Activity View Table inside the Storage Intelligence linked Dataset.
# --------------------------------------------------------------------------
view: bucket_region_activity {

  sql_table_name: `@{PROJECT_ID}.@{BIGQUERY_DATASET}.bucket_region_activity_view` ;;

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql:
      CONCAT(
        CAST(${TABLE}.snapshotStartTime AS STRING), '_',
        CAST(${TABLE}.snapshotEndTime AS STRING), '_',
        ${TABLE}.name, '_',
        ${TABLE}.bucketLocation, '_',
        ${TABLE}.requestLocation, '-',
        CAST(${TABLE}.project AS STRING)
      );;
    description: "A composite primary key that uniquely identifies each row by concatenating the snapshot window, bucket name, locations, and project ID. This ensures unique identification for every bucket-region-activity combination."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_location {
    label: "Bucket Location"
    type: string
    sql: ${TABLE}.bucketLocation ;;
    description: "The region where the API calls were executed and processed. Use this dimension to analyze traffic patterns, specifically to track data volume sent (egress) from and injected (ingress) into this location."
  }

  dimension: bucket_name {
    label: "Bucket Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The unique name of the Google Cloud Storage bucket."
  }

  dimension: generation {
    label: "Generation"
    type: number
    sql: ${TABLE}.generation ;;
    value_format: "0"
    description: "The unique identifier for this specific instance of the bucket. If a bucket is deleted and recreated with the same name, it receives a new generation number, allowing you to distinguish between the old and new instances."
  }

  dimension: project {
    label: "Project Number"
    type: string
    sql: CAST(${TABLE}.project AS STRING) ;;
    description: "The unique numeric identifier for the Google Cloud Project (e.g., 123456789012)."
  }

  dimension: request_bytes {
    label: "Ingress Data - Operation"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        ${TABLE}.requestBytes / POW(1024, 5)
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        ${TABLE}.requestBytes / POW(1024, 4)
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        ${TABLE}.requestBytes / POW(1024, 3)
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.requestBytes / POW(1024, 2)
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.requestBytes / 1024
      {% else %}
        ${TABLE}.requestBytes
      {% endif %};;
    description: "The volume of data injected (Ingress) into the bucket location during API operations. Visualizations display formatted units (e.g., 'GiB'), while exports use the raw value scaled to the 'Throughput Size Unit' parameter."
    html: <span>{{ request_bytes_aid._value }}</span> ;;
  }

  dimension: request_location {
    label: "Request Location"
    type: string
    sql: UPPER(${TABLE}.requestLocation) ;;
    description: "The remote location where the data was sent or transferred. Represents the destination of egress traffic or the origin of the request, distinct from the bucket's physical storage location."
  }

  dimension: response_bytes {
    label: "Data Egress - Operation"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        ${TABLE}.responseBytes / POW(1024, 5)
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        ${TABLE}.responseBytes / POW(1024, 4)
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        ${TABLE}.responseBytes / POW(1024, 3)
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.responseBytes / POW(1024, 2)
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.responseBytes / 1024
      {% else %}
        ${TABLE}.responseBytes
      {% endif %};;
    description: "The volume of data sent (Egress) from the bucket to the request location. This represents the payload delivered to the client or service. Visualizations show formatted units (e.g., 'GiB'), while exports use the raw value scaled to the 'Throughput Size Unit' parameter."
    html: <span>{{ response_bytes_aid._value }}</span> ;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: request_bytes_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${TABLE}.requestBytes >= POW(1024, 5) THEN CONCAT(CAST(ROUND(${TABLE}.requestBytes / POW(1024, 5), 2) AS STRING), " PiB")
        WHEN ${TABLE}.requestBytes >= POW(1024, 4) THEN CONCAT(CAST(ROUND(${TABLE}.requestBytes / POW(1024, 4), 2) AS STRING), " TiB")
        WHEN ${TABLE}.requestBytes >= POW(1024, 3) THEN CONCAT(CAST(ROUND(${TABLE}.requestBytes / POW(1024, 3), 2) AS STRING), " GiB")
        WHEN ${TABLE}.requestBytes >= POW(1024, 2) THEN CONCAT(CAST(ROUND(${TABLE}.requestBytes / POW(1024, 2), 2) AS STRING), " MiB")
        WHEN ${TABLE}.requestBytes >= 1024 THEN CONCAT(CAST(ROUND(${TABLE}.requestBytes / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(${TABLE}.requestBytes AS STRING), " B")
      END;;
    description: "Helper dimension that formats the raw ingress byte count into human-readable IEC units (e.g., '1.5 GiB'). Used to populate the HTML for the 'Ingress Data - Operation' dimension."
  }

  dimension: response_bytes_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${TABLE}.responseBytes >= POW(1024, 5) THEN CONCAT(CAST(ROUND(${TABLE}.responseBytes / POW(1024, 5), 2) AS STRING), " PiB")
        WHEN ${TABLE}.responseBytes >= POW(1024, 4) THEN CONCAT(CAST(ROUND(${TABLE}.responseBytes / POW(1024, 4), 2) AS STRING), " TiB")
        WHEN ${TABLE}.responseBytes >= POW(1024, 3) THEN CONCAT(CAST(ROUND(${TABLE}.responseBytes / POW(1024, 3), 2) AS STRING), " GiB")
        WHEN ${TABLE}.responseBytes >= POW(1024, 2) THEN CONCAT(CAST(ROUND(${TABLE}.responseBytes / POW(1024, 2), 2) AS STRING), " MiB")
        WHEN ${TABLE}.responseBytes >= 1024 THEN CONCAT(CAST(ROUND(${TABLE}.responseBytes / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(${TABLE}.responseBytes AS STRING), " B")
      END ;;
    description: "Helper dimension that formats the raw egress byte count into human-readable IEC units (e.g., '2.5 GiB'). Used to populate the HTML for the 'Data Egress - Operation' dimension."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: snapshot_start {
    group_label: "Snapshot Start Timeframe"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.snapshotStartTime ;;
    description: "The start time of the aggregation interval. Traffic volume (ingress/egress) recorded in this row occurred after this timestamp."
  }


  dimension_group: snapshot_end {
    group_label: "Snapshot End Timeframe"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.snapshotEndTime ;;
    description: "The end time of the aggregation interval (exclusive). Traffic volume recorded in this row occurred strictly before this timestamp."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_buckets {
    label: "Total Buckets"
    type: count_distinct
    sql: ${bucket_name} ;;
    description: "The count of unique buckets that had active traffic (ingress or egress) during the selected time period."
    value_format_name: dynamic_thousands
  }

  measure: total_requested_locations {
    label: "Total Requested Locations"
    type: count_distinct
    sql: ${request_location} ;;
    description: "The number of unique regions or zones that interacted with the buckets. Use this to measure the geographic spread of your data consumers and identify where traffic is originating or terminating."
  }

  measure: total_data_egress {
    label: "Total Data Egress"
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.responseBytes / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.responseBytes / (1024)
      {% else %}
        ${TABLE}.responseBytes
      {% endif %};;
    html: <span>{{ total_data_egress_aid._value }}</span>;;
    description: "The total volume of data sent (Egress) from Google Cloud Storage buckets to the request locations. Visualizations display formatted units (e.g., 'GiB'), while exports use the raw value scaled to the 'Throughput Size Unit' parameter."
  }

  measure: total_data_ingress {
    label: "Total Data Ingress"
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.requestBytes / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.requestBytes / (1024)
      {% else %}
        ${TABLE}.requestBytes
      {% endif %};;
    html: <span>{{ total_data_ingress_aid._value }}</span>;;
    description: "The total volume of data injected (Ingress) into Google Cloud Storage buckets from external locations. Visualizations display formatted units (e.g., 'GiB'), while exports use the raw value scaled to the 'Throughput Size Unit' parameter."
  }

  measure: selected_measure {
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0"
    sql:
      {% if aggregate_function._parameter_value == "total_data_egress" %}
        ${total_data_egress}
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        ${total_data_ingress}
      {% else %}
        ${total_data_egress}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_data_egress" %}
        <span><number>{{ total_data_egress_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        <span>{{ total_data_ingress_aid._value }}</span>
      {% endif %};;
    description: "Dynamic measure that switches between Ingress and Egress metrics based on the user's selection in the 'Aggregate Function' parameter."
  }

  measure: traffic_percentage {
    label: "Traffic Percent"
    type: number
    sql: 1.0 * ${selected_measure} / NULLIF(${bucket_totals_summary.selected_measure}, 0) ;;
    value_format_name: percent_2
    description: "The percentage of the bucket's total traffic that is attributed to this specific request location."
  }


  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_data_egress_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 6), 2) AS STRING), " EiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 5), 2) AS STRING), " PiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 4), 2) AS STRING), " TiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 3), 1) AS STRING), " GiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 2), 0) AS STRING), " MiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / 1024, 0) AS STRING), " KiB")
        ELSE CONCAT(CAST(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) AS STRING), " B")
      END ;;
    description: "Helper measure that calculates total egress volume and formats it into the most appropriate human-readable unit (e.g., '10.5 GiB'). Used to populate the HTML for the 'Total Data Egress' measure."
  }

  measure: total_data_ingress_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 6), 2) AS STRING), " EiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 5), 2) AS STRING), " PiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 4), 2) AS STRING), " TiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 3), 1) AS STRING), " GiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 2), 0) AS STRING), " MiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / 1024, 0) AS STRING), " KiB")
        ELSE CONCAT(CAST(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) AS STRING), " B")
      END ;;
    description: "Helper measure that calculates total ingress volume and formats it into the most appropriate human-readable unit (e.g., '5.2 GiB'). Used to populate the HTML for the 'Total Data Ingress' measure."
  }


  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Parameters -------------------------------
  # --------------------------------------------------------------------------------------------------------

  parameter: throughput_size_unit {
    type: unquoted
    label: "Throughput Size Unit"

    allowed_value: {
      label: "PiB"
      value: "PiB"
    }

    allowed_value: {
      label: "TiB"
      value: "TiB"
    }

    allowed_value: {
      label: "GiB"
      value: "GiB"
    }

    allowed_value: {
      label: "MiB"
      value: "MiB"
    }

    allowed_value: {
      label: "KiB"
      value: "KiB"
    }

    allowed_value: {
      label: "B"
      value: "B"
    }

    default_value: "GiB"
    description: "This parameter allows users to select the desired byte unit for the throughput storage size visualizations and file downloads (CSV, Sheets). The default value is GiB."
  }

  parameter: aggregate_function {

    label: "Selected Metric"
    type: unquoted

    allowed_value: {
      label: "Total Data Egress"
      value: "total_data_egress"
    }

    allowed_value: {
      label: "Total Data Ingress"
      value: "total_data_ingress"
    }

    default_value: "total_data_egress"
    description: "This paramater allows users to specify the desired measure for the selected measure metric. The default value, 'Total Data Egress'."
  }


}