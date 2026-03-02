# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Mar 2, 2026
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
    group_label: "Inventory Overview"
    label: "Total Buckets"
    type: count_distinct
    sql: ${bucket_name} ;;
    description: "The count of unique buckets that had active traffic (ingress or egress) during the selected time period."
    value_format_name: dynamic_thousands
  }

  measure: total_requested_locations {
    group_label: "Inventory Overview"
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
  # ---------------------------- Period over Period (PoP) Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_buckets_current {
    group_label: "Inventory Overview"
    label: "Total Buckets (Current Period)"
    type: count_distinct
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE
        WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
        THEN ${bucket_name}
      END
    {% else %}
      ${bucket_name}
    {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The count of unique buckets with active traffic specifically within the selected analysis period."
  }

  measure: total_buckets_pop_change {
    group_label: "Inventory Overview"
    label: "Total Buckets (PoP Change)"
    type: number
    sql:
    {% if analysis_date_filter._is_filtered %}
      SAFE_DIVIDE(
        (${total_buckets_current} - ${total_buckets_previous}),
        ${total_buckets_previous}
      )
    {% else %}
      0
    {% endif %};;
    value_format_name: percent_2
    html:
    {% if analysis_date_filter._is_filtered %}
      {{ rendered_value }}
    {% else %}
      <div style="display: none;"></div>
    {% endif %} ;;
    description: "The percentage change in the number of active buckets compared to the previous period."
  }

  measure: total_buckets_previous {
    group_label: "Inventory Overview"
    label: "Total Buckets (Previous Period)"
    type: count_distinct
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE
        WHEN ${snapshot_start_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
          ${snapshot_start_raw} < {% date_start analysis_date_filter %}
        THEN ${bucket_name}
      END
    {% else %}
      NULL
    {% endif %};;
    value_format_name: dynamic_thousands
    description: "The count of unique buckets with active traffic during the timeframe immediately preceding the selected analysis period."
  }

  measure: total_requested_locations_current {
    group_label: "Inventory Overview"
    label: "Total Requested Locations (Current Period)"
    type: count_distinct
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE
        WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
        THEN ${request_location}
      END
    {% else %}
      ${request_location}
    {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The number of unique regions or zones active specifically within the selected analysis period."
  }

  measure: total_requested_locations_pop_change {
    group_label: "Inventory Overview"
    label: "Total Requested Locations (PoP Change)"
    type: number
    sql:
    {% if analysis_date_filter._is_filtered %}
      SAFE_DIVIDE(
        (${total_requested_locations_current} - ${total_requested_locations_previous}),
        ${total_requested_locations_previous}
      )
    {% else %}
      0
    {% endif %};;
    value_format_name: percent_2
    html:
    {% if analysis_date_filter._is_filtered %}
      {{ rendered_value }}
    {% else %}
      <div style="display: none;"></div>
    {% endif %} ;;
    description: "The percentage change in the number of unique requested locations compared to the previous period."
  }


  measure: total_requested_locations_previous {
    group_label: "Inventory Overview"
    label: "Total Requested Locations (Previous Period)"
    type: count_distinct
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE
        WHEN ${snapshot_start_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
          ${snapshot_start_raw} < {% date_start analysis_date_filter %}
        THEN ${request_location}
      END
    {% else %}
      NULL
    {% endif %};;
    value_format_name: dynamic_thousands
    description: "The number of unique regions or zones active during the timeframe immediately preceding the selected analysis period."
  }

  measure: total_data_egress_current {
    group_label: "Data Transfer"
    label: "Total Data Egress (Current Period)"
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
        THEN
          {% if throughput_size_unit._parameter_value == "PiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 5))
          {% elsif throughput_size_unit._parameter_value == "TiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 4))
          {% elsif throughput_size_unit._parameter_value == "GiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 3))
          {% elsif throughput_size_unit._parameter_value == "MiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 2))
          {% elsif throughput_size_unit._parameter_value == "KiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (1024)
          {% else %}
            CAST(${TABLE}.responseBytes AS FLOAT64)
          {% endif %}
        ELSE 0
        END
      {% else %}
        {% if throughput_size_unit._parameter_value == "PiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif throughput_size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif throughput_size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif throughput_size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif throughput_size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.responseBytes AS FLOAT64)
        {% endif %}
      {% endif %} ;;
    html: <span>{{ total_data_egress_aid_current._value }}</span> ;;
    description: "The total volume of data transferred out of Google Cloud Storage (GCS) specifically within the selected analysis period. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_data_egress_pop_change {
    group_label: "Data Transfer"
    label: "Total Data Egress (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${total_data_egress_current} - ${total_data_egress_previous}),
          ${total_data_egress_previous}
        )
      {% else %}
        0
      {% endif %} ;;
    value_format_name: percent_2
    html:
      {% if analysis_date_filter._is_filtered %}
         {{ rendered_value }}
      {% else %}
         <div style="display: none;"></div>
      {% endif %} ;;
    description: "The percentage change in data egress volume compared to the previous period. A positive value indicates that more data is being transferred out of GCS than in the prior timeframe."
  }

  measure: total_data_egress_previous {
    group_label: "Data Transfer"
    label: "Total Data Egress (Previous Period)"
    type: sum
    value_format: "#,##0.00"
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE WHEN
        ${snapshot_start_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
        ${snapshot_start_raw} < {% date_start analysis_date_filter %}
      THEN
        {% if throughput_size_unit._parameter_value == "PiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif throughput_size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif throughput_size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif throughput_size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif throughput_size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.responseBytes AS FLOAT64)
        {% endif %}
      ELSE 0
      END
    {% else %}
      NULL
    {% endif %} ;;
    html: <span>{{ total_data_egress_aid_previous._value }}</span> ;;
    description: "The total volume of data transferred out of Google Cloud Storage (GCS) during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing current data egress trends. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_data_ingress_current {
    group_label: "Data Transfer"
    label: "Total Data Ingress (Current Period)"
    type: sum
    value_format: "#,##0.00"
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE WHEN
        {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
      THEN
        {% if throughput_size_unit._parameter_value == "PiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif throughput_size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif throughput_size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif throughput_size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif throughput_size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.requestBytes AS FLOAT64)
        {% endif %}
      ELSE 0
      END
    {% else %}
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.requestBytes AS FLOAT64)
      {% endif %}
    {% endif %} ;;

    html: <span>{{ total_data_ingress_aid_current._value }}</span> ;;
    description: "The total volume of data uploaded or transferred into Google Cloud Storage (GCS) specifically within the selected analysis period. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_data_ingress_pop_change {
    group_label: "Data Transfer"
    label: "Total Data Ingress (PoP Change)"
    type: number
    sql:
          {% if analysis_date_filter._is_filtered %}
            SAFE_DIVIDE(
              (${total_data_ingress_current} - ${total_data_ingress_previous}),
              ${total_data_ingress_previous}
            )
          {% else %}
            0
          {% endif %} ;;
    value_format_name: percent_2
    html:
          {% if analysis_date_filter._is_filtered %}
             {{ rendered_value }}
          {% else %}
             <div style="display: none;"></div>
          {% endif %} ;;
    description: "The percentage change in data ingress volume compared to the previous period. A positive value indicates that more data is being uploaded or transferred into GCS than in the prior timeframe."
  }

  measure: total_data_ingress_previous {
    group_label: "Data Transfer"
    label: "Total Data Ingress (Previous Period)"
    type: sum
    value_format: "#,##0.00"
    sql:
        {% if analysis_date_filter._is_filtered %}
          CASE WHEN
            ${snapshot_start_raw} >=
              TIMESTAMP_SUB({% date_start analysis_date_filter %},
              INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
            AND
            ${snapshot_start_raw} < {% date_start analysis_date_filter %}
          THEN
            {% if throughput_size_unit._parameter_value == "PiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 5))
            {% elsif throughput_size_unit._parameter_value == "TiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 4))
            {% elsif throughput_size_unit._parameter_value == "GiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 3))
            {% elsif throughput_size_unit._parameter_value == "MiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 2))
            {% elsif throughput_size_unit._parameter_value == "KiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (1024)
            {% else %}
              CAST(${TABLE}.requestBytes AS FLOAT64)
            {% endif %}
          ELSE 0
          END
        {% else %}
          NULL
        {% endif %} ;;

    html: <span>{{ total_data_ingress_aid_previous._value }}</span> ;;
    description: "The total volume of data uploaded or transferred into Google Cloud Storage (GCS) during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing current data ingress trends. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Period over Period (PoP) Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_data_egress_aid_current {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END), 0), " B")
        END
      {% else %}
        CASE
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)), 0), " B")
        END
      {% endif %} ;;
    description: "A hidden helper measure that formats the Total Data Egress value specifically for the selected analysis period into a human-readable string with the appropriate unit (e.g., '1.5 GiB'). Used for HTML display in period-over-period comparisons."
  }

  measure: total_data_egress_aid_previous {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END), 0), " B")
        END
      {% else %}
        NULL
      {% endif %} ;;
    description: "A hidden helper measure that formats the Total Data Egress value specifically for the timeframe immediately preceding the selected analysis period. It converts the value into a human-readable string with the appropriate unit (e.g., '1.2 GiB') for HTML display."
  }

  measure: total_data_ingress_aid_current {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END), 0), " B")
        END
      {% else %}
        CASE
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)), 0), " B")
        END
      {% endif %} ;;
    description: "A hidden helper measure that formats the Total Data Ingress value specifically for the selected analysis period into a human-readable string with the appropriate unit (e.g., '2.5 GiB'). Used for HTML display in period-over-period comparisons."
  }

  measure: total_data_ingress_aid_previous {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= 1024
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END), 0), " B")
      END
    {% else %}
      NULL
    {% endif %} ;;
    description: "A hidden helper measure that formats the Total Data Ingress value specifically for the timeframe immediately preceding the selected analysis period. It converts the value into a human-readable string with the appropriate unit (e.g., '1.2 GiB') for HTML display."
  }

  # --------------------------------------------------------------------------------------------------------
  # ------------------------------- Filters  -------------------------------------
  # --------------------------------------------------------------------------------------------------------

  filter: analysis_date_filter {
    type: date
    label: "Snapshot Start Range"
    description: "Select the date range for analysis. The 'Previous Period' measure will automatically calculate based on this duration."
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
    description: "This parameter allows users to specify the desired measure for the selected measure metric. The default value, 'Total Data Egress'."
  }


}
