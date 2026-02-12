# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Bucket Activity View Table inside the Storage Intelligence linked Dataset.
# --------------------------------------------------------------------------

view: bucket_activity {

  sql_table_name: `@{BIGQUERY_DATASET}.bucket_activity_view` ;;

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
        ${TABLE}.location, '_',
        CAST(${TABLE}.project AS STRING), '_',
        IFNULL(CAST(${TABLE}.totalRequests AS STRING), '0')
      );;
    description: "A hidden, system-generated, universally unique identifier (UUID) stored as a string. This field serves as the primary key for each bucket log, ensuring unique identification across the system. UUIDs are generated using the GENERATE UUID function."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the Google Cloud Storage (GCS) bucket from which data is being sourced."
  }

  dimension: count2xx_preaggregated {
    label: "Count (2xx) responses - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.count2xx ;;
    description: "Aggregated hourly count of successful (2xx) responses per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: count400_preaggregated {
    label: "Count (400) responses - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.count400 ;;
    description: "Aggregated hourly count of 400 error responses per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: count401_preaggregated {
    label: "Count (401) responses - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.count401 ;;
    description: "Aggregated hourly count of 401 error responses per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: count403_preaggregated {
    label: "Count (403) responses - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.count403 ;;
    description: "The count of 'Permission Denied' (403) errors. Indicates attempts to access data without proper authorization. Use this to analyze security blocks or access control issues."
  }

  dimension: count429_preaggregated {
    label: "Count (429) responses - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.count429 ;;
    description: "Aggregated hourly count of 429 error responses per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: count4xx_preaggregated {
    label: "Count (4xx) responses - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.count4xx ;;
    description: "Aggregated hourly count of (4xx) error responses per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: count5xx_preaggregated {
    label: "Count (5xx) responses - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.count5xx ;;
    description: "Aggregated hourly count of (5xx) error responses per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: generation {
    type: string
    sql: CAST(${TABLE}.generation AS STRING) ;;
    description: "The specific version ID (metageneration) of the bucket. Use this to distinguish between different lifecycle versions of the same bucket name."
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
    description: "The region or multi-region location of the source Google Cloud Storage (GCS) bucket."
  }

  dimension: project {
    label: "Project Number"
    type: string
    sql: CAST(${TABLE}.project AS STRING) ;;
    description: "The Google Cloud project number associated with the project that contains the bucket."
  }

  dimension: top_prefixes_429_errors {
    group_label: "Top Prefixes (Hotspots)"
    hidden: yes
    label: "Top Prefixes 429 Errors"
    sql: ${TABLE}.topPrefixes429Errors ;;
    description: "A ranked list of the top object prefixes that experienced the highest volume of 429 (Too Many Requests) errors during the hourly capture period."
  }

  dimension: top_prefixes_highest_operations {
    group_label: "Top Prefixes (Hotspots)"
    hidden: yes
    label: "Top Prefixes Highest Operations"
    sql: ${TABLE}.topPrefixesHighestOperations ;;
    description: "A ranked list of the top object prefixes that experienced the highest volume of operations during the hourly capture period."
  }

  dimension: top_prefixes_request_bytes {
    group_label: "Top Prefixes (Hotspots)"
    hidden: yes
    label: "Top Prefixes Request Bytes"
    sql: ${TABLE}.topPrefixesRequestBytes ;;
    description: "A ranked list of the top object prefixes that experienced the highest volume of requests during the hourly capture period."
  }

  dimension: top_prefixes_response_bytes {
    group_label: "Top Prefixes (Hotspots)"
    hidden: yes
    label: "Top Prefixes Response Bytes"
    sql: ${TABLE}.topPrefixesResponseBytes ;;
    description: "A ranked list of the top object prefixes that experienced the highest volume of responses during the hourly capture period."
  }

  dimension: total_deletes_preaggregated {
    label: "Total Delete Requests - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.totalDeletes ;;
    description: "Aggregated hourly sum of DELETE requests per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: total_lists_preaggregated {
    label: "Total List Requests - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.totalLists ;;
    description: "Aggregated hourly sum of LIST requests per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: total_reads_preaggregated {
    label: "Total Read Requests - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.totalReads ;;
    description: "Aggregated hourly sum of READ requests per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: total_request_bytes_preaggregated {
    label: "Total Request Bytes - Pre-aggregated"
    hidden: yes
    type: number
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        ${TABLE}.totalRequestBytes / ((POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        ${TABLE}.totalRequestBytes / ((POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        ${TABLE}.totalRequestBytes / ((POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalRequestBytes / ((POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalRequestBytes / (1024)
      {% else %}
        ${TABLE}.totalRequestBytes
      {% endif %};;
    description: "The volume of data requested (throughput/bandwidth). Note: The unit (e.g., GiB, TiB) changes based on the 'throughput_size_unit' parameter selection."
  }

  dimension: total_requests_preaggregated {
    label: "Total Requests - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.totalRequests ;;
    description: "Aggregated hourly sum of requests per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: total_response_bytes_preaggregated {
    label: "Total Response Bytes - Pre-aggregated"
    hidden: yes
    type: number
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        ${TABLE}.totalResponseBytes / ((POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        ${TABLE}.totalResponseBytes / ((POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        ${TABLE}.totalResponseBytes / ((POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalResponseBytes / ((POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalResponseBytes / (1024)
      {% else %}
        ${TABLE}.totalResponseBytes
      {% endif %};;
    description: "Aggregated hourly sum of response bytes (pre-calculated from the bucket_activity table)."
  }

  dimension: total_updates_preaggregated {
    label: "Total Update Requests - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.totalUpdates ;;
    description: "Aggregated hourly sum of UPDATE requests per bucket (pre-calculated from the bucket_activity table)."
  }

  dimension: total_writes_preaggregated {
    label: "Total Write Requests - Pre-aggregated"
    hidden: yes
    type: number
    sql: ${TABLE}.totalWrites ;;
    description: "Aggregated hourly sum of WRITE requests per bucket (pre-calculated from the bucket_activity table)."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Date Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group:  snapshot_end {
    group_label: "Snapshot End Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.snapshotEndTime ;;
    description: "The snapshotEndTime field in the GCS Storage Intelligence - Bucket Activity table is a timestamp string in RFC 3339 format. It represents the point-in-time when the bucket activity logs finished capturing the requests during an hourly based time."
  }

  dimension_group:  snapshot_start {

    type: time
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    sql: ${TABLE}.snapshotStartTime ;;
    description: "The snapshotStartTime field in the GCS Storage Intelligence - Bucket Activity table is a timestamp string in RFC 3339 format. It represents the point-in-time when the bucket activity logs started capturing the requests during an hourly based time."
  }

  dimension: snapshot_start_date_hour {
    group_label: "Snapshot Start Time"
    label: "Date and Hour"
    type: date_time
    sql: TIMESTAMP_TRUNC(${TABLE}.snapshotStartTime, HOUR) ;;
    description: "The snapshotStartTime field in the GCS Storage Intelligence - Bucket Activity table is a timestamp string in RFC 3339 format. It represents the point-in-time when the bucket activity logs started capturing the requests during an hourly based time."
    html: {{ value | date: "%Y-%m-%d %H:00" }} ;;
  }

  dimension: snapshot_start_dynamic {
    label_from_parameter: date_granularity
    group_label: "Snapshot Start Time"
    description: "Dynamic date field that changes based on the Parameter selection: Date Granularity."

    type: date_time

    sql:
      {% if date_granularity._parameter_value == 'date_hour' %}
        TIMESTAMP_TRUNC(${TABLE}.snapshotStartTime, HOUR)
      {% elsif date_granularity._parameter_value == 'date' %}
        TIMESTAMP_TRUNC(${TABLE}.snapshotStartTime, DAY)
      {% elsif date_granularity._parameter_value == 'year_month' %}
        TIMESTAMP_TRUNC(${TABLE}.snapshotStartTime, MONTH)
      {% elsif date_granularity._parameter_value == 'month_name' %}
        TIMESTAMP_TRUNC(${TABLE}.snapshotStartTime, MONTH)
      {% else %}
        TIMESTAMP_TRUNC(${TABLE}.snapshotStartTime, HOUR)
      {% endif %} ;;

    html:
      {% if date_granularity._parameter_value == 'date_hour' %}
        {{ rendered_value | date: "%Y-%m-%d %H:00" }}
      {% elsif date_granularity._parameter_value == 'date' %}
        {{ rendered_value | date: "%Y-%m-%d" }}
      {% elsif date_granularity._parameter_value == 'year_month' %}
        {{ rendered_value | date: "%Y %B" }}
      {% elsif date_granularity._parameter_value == 'month_name' %}
        {{ rendered_value | date: "%B" }}
      {% else %}
        {{ rendered_value }}
      {% endif %} ;;
  }

  dimension: snapshot_start_time_year_month {
    group_label: "Snapshot Start Time"
    label: "Year Month"
    type: date
    sql: TIMESTAMP_TRUNC(${TABLE}.snapshotStartTime, MONTH) ;;
    html:
      {{ value | date: "%B %Y" }} ;;
    description: "The snapshotStartTime field in the GCS Storage Intelligence - Bucket Activity table is a timestamp string in RFC 3339 format. It represents the point-in-time when the bucket activity logs started capturing the requests during an hourly based time."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: error_rate {
    group_label: "Request Status"
    label: "Error Rate"
    type: number
    value_format_name: percent_2
    sql: (${total_client_error_responses} + ${total_server_error_responses}) / NULLIF(${total_requests}, 0) ;;
    description: "The percentage of total HTTP requests that resulted in a failure. It defines failure as the sum of all Client (4xx) and Server (5xx) errors divided by the total number of requests."
  }

  measure: maximum_data_egress {
    group_label: "Data Transfer"
    label: "Maximum Data Egress"
    type: max
    value_format: "#,##0.00"
    hidden: yes
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalResponseBytes / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalResponseBytes / (1024)
      {% else %}
        ${TABLE}.totalResponseBytes
      {% endif %};;
    html: <span>{{ maximum_data_egress_aid._value }}</span>;;
    description: "The highest volume of data transferred out of Google Cloud Storage (GCS) observed during the selected period. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: maximum_data_ingress {
    group_label: "Data Transfer"
    label: "Maximum Data Ingress"
    type: max
    hidden: yes
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalRequestBytes / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalRequestBytes / (1024)
      {% else %}
        ${TABLE}.totalRequestBytes
      {% endif %};;
    html: <span>{{ maximum_data_ingress_aid._value }}</span>;;
    description: "The highest volume of data transferred into Google Cloud Storage (GCS) observed during the selected period. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: median_data_egress {
    group_label: "Data Transfer"
    label: "Median Data Egress"
    type: number
    value_format: "#,##0.00"
    hidden: yes
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100) [OFFSET(50)] / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100)[OFFSET(50)] / (1024)
      {% else %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100)[OFFSET(50)]
      {% endif %};;
    html: <span>{{ median_data_egress_aid._value }}</span>;;
    description: "The median (50th percentile) volume of data transferred out of Google Cloud Storage (GCS). The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: median_data_ingress {
    group_label: "Data Transfer"
    label: "Median Data Ingress"
    type: number
    value_format: "#,##0.00"
    hidden: yes
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100) [OFFSET(50)] / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100)[OFFSET(50)] / (1024)
      {% else %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100)[OFFSET(50)]
      {% endif %};;
    html: <span>{{ median_data_ingress_aid._value }}</span>;;
    description: "The median (50th percentile) volume of data transferred into Google Cloud Storage (GCS). The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: minimum_data_egress {
    group_label: "Data Transfer"
    label: "Minimum Data Egress"
    type: min
    value_format: "#,##0.00"
    hidden: yes
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalResponseBytes / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64)
      {% endif %};;
    html: <span>{{ minimum_data_egress_aid._value }}</span>;;
    description: "The lowest volume of data transferred out of Google Cloud Storage (GCS) observed during the selected period. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: minimum_data_ingress {
    group_label: "Data Transfer"
    label: "Minimum Data Ingress"
    type: min
    hidden: yes
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalRequestBytes / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalRequestBytes / (1024)
      {% else %}
        ${TABLE}.totalRequestBytes
      {% endif %};;
    html: <span>{{ minimum_data_ingress_aid._value }}</span>;;
    description: "The lowest volume of data transferred into Google Cloud Storage (GCS) observed during the selected period. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: quarter_percentile_data_egress {
    group_label: "Data Transfer"
    label: "25th Percentile Data Egress"
    type: number
    value_format: "#,##0.00"
    hidden: yes
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100) [OFFSET(25)] / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100)[OFFSET(25)] / (1024)
      {% else %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100)[OFFSET(25)]
      {% endif %};;
    html: <span>{{ quarter_percentile_data_egress_aid._value }}</span>;;
    description: "The 25th percentile volume of data transferred out of Google Cloud Storage (GCS). The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: quarter_percentile_data_ingress {
    group_label: "Data Transfer"
    label: "25th Percentile Data Ingress"
    type: number
    value_format: "#,##0.00"
    hidden: yes
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100) [OFFSET(25)] / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100)[OFFSET(25)] / (1024)
      {% else %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100)[OFFSET(25)]
      {% endif %};;
    html: <span>{{ quarter_percentile_data_ingress_aid._value }}</span>;;
    description: "The 25th percentile volume of data transferred into Google Cloud Storage (GCS). The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: selected_maximum {
    group_label: "Dynamic Metrics"
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_400_error_responses" %}
        MAX(${count400_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_401_error_responses" %}
        MAX(${count401_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_403_error_responses" %}
        MAX(${count403_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_429_error_responses" %}
        MAX(${count429_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_client_error_responses" %}
        MAX(${count4xx_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_data_egress" %}
        ${maximum_data_egress}
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        ${maximum_data_ingress}
      {% elsif aggregate_function._parameter_value == "total_delete_requests" %}
        MAX(${total_deletes_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_list_requests" %}
        MAX(${total_lists_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_read_requests" %}
        MAX(${total_reads_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_requests" %}
        MAX(${total_requests_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_server_error_responses" %}
        MAX(${count5xx_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_success_responses" %}
        MAX(${count2xx_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_update_requests" %}
        MAX(${total_updates_preaggregated})
      {% else %}
        MAX(${total_requests_preaggregated})
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_data_egress" %}
        <span><number>{{ maximum_data_egress_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        <span>{{ maximum_data_ingress_aid._value }}</span>
      {% endif %};;
    description: "This measure allows users to select the minimum displayed aggregation. The selected function is determined by the 'Selected Metric' parameter."
  }

  measure: selected_measure {
    group_label: "Dynamic Metrics"
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_400_error_responses" %}
        ${total_400_error_responses}
      {% elsif aggregate_function._parameter_value == "total_401_error_responses" %}
        ${total_401_error_responses}
      {% elsif aggregate_function._parameter_value == "total_403_error_responses" %}
        ${total_403_error_responses}
      {% elsif aggregate_function._parameter_value == "total_429_error_responses" %}
        ${total_429_error_responses}
      {% elsif aggregate_function._parameter_value == "total_client_error_responses" %}
        ${total_client_error_responses}
      {% elsif aggregate_function._parameter_value == "total_data_egress" %}
        ${total_data_egress}
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        ${total_data_ingress}
      {% elsif aggregate_function._parameter_value == "total_delete_requests" %}
        ${total_delete_requests}
      {% elsif aggregate_function._parameter_value == "total_list_requests" %}
        ${total_list_requests}
      {% elsif aggregate_function._parameter_value == "total_read_requests" %}
        ${total_read_requests}
      {% elsif aggregate_function._parameter_value == "total_requests" %}
        ${total_requests}
      {% elsif aggregate_function._parameter_value == "total_server_error_responses" %}
        ${total_server_error_responses}
      {% elsif aggregate_function._parameter_value == "total_success_responses" %}
        ${total_success_responses}
      {% elsif aggregate_function._parameter_value == "total_update_requests" %}
        ${total_update_requests}
      {% else %}
        ${total_requests}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_data_egress" %}
        <span><number>{{ total_data_egress_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        <span>{{ total_data_ingress_aid._value }}</span>
      {% endif %};;
    description: "A dynamic measure that varies its calculation based on the 'Aggregate Function' parameter. It allows users to toggle the analysis between distinct metric types, ranging from simple request counts (e.g., Total Requests) to data transfer volumes (e.g., Data Egress)."
  }

  measure: selected_median {
    group_label: "Dynamic Metrics"
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_400_error_responses" %}
        APPROX_QUANTILES(${count400_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_401_error_responses" %}
        APPROX_QUANTILES(${count401_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_403_error_responses" %}
        APPROX_QUANTILES(${count403_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_429_error_responses" %}
        APPROX_QUANTILES(${count429_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_client_error_responses" %}
        APPROX_QUANTILES(${count4xx_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_data_egress" %}
        ${median_data_egress}
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        ${median_data_ingress}
      {% elsif aggregate_function._parameter_value == "total_delete_requests" %}
        APPROX_QUANTILES(${total_deletes_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_list_requests" %}
        APPROX_QUANTILES(${total_lists_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_read_requests" %}
        APPROX_QUANTILES(${total_reads_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_requests" %}
        APPROX_QUANTILES(${total_requests_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_server_error_responses" %}
        APPROX_QUANTILES(${count5xx_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_success_responses" %}
        APPROX_QUANTILES(${count2xx_preaggregated}, 100)[OFFSET(50)]
      {% elsif aggregate_function._parameter_value == "total_update_requests" %}
        APPROX_QUANTILES(${total_updates_preaggregated}, 100)[OFFSET(50)]
      {% else %}
        APPROX_QUANTILES(${total_requests_preaggregated}, 100)[OFFSET(50)]
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_data_egress" %}
        <span><number>{{ median_data_egress_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        <span>{{ median_data_ingress_aid._value }}</span>
      {% endif %};;
    description: "The median (50th percentile) value of the specific metric currently selected in the 'Aggregate Function' parameter. Use this to identify typical performance or usage levels, effectively filtering out extreme outliers."
  }

  measure: selected_minimum {
    group_label: "Dynamic Metrics"
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_400_error_responses" %}
        MIN(${count400_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_401_error_responses" %}
        MIN(${count401_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_403_error_responses" %}
        MIN(${count403_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_429_error_responses" %}
        MIN(${count429_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_client_error_responses" %}
        MIN(${count4xx_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_data_egress" %}
        ${minimum_data_egress}
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        ${minimum_data_ingress}
      {% elsif aggregate_function._parameter_value == "total_delete_requests" %}
        MIN(${total_deletes_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_list_requests" %}
        MIN(${total_lists_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_read_requests" %}
        MIN(${total_reads_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_requests" %}
        MIN(${total_requests_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_server_error_responses" %}
        MIN(${count5xx_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_success_responses" %}
        MIN(${count2xx_preaggregated})
      {% elsif aggregate_function._parameter_value == "total_update_requests" %}
        MIN(${total_updates_preaggregated})
      {% else %}
        MIN(${total_requests_preaggregated})
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_data_egress" %}
        <span><number>{{ minimum_data_egress_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        <span>{{ minimum_data_ingress_aid._value }}</span>
      {% endif %};;
    description: "The minimum value of the specific metric currently selected in the 'Aggregate Function' parameter. Use this to identify the lowest observed activity levels or baseline performance."
  }

  measure: selected_quarter_percentile {
    group_label: "Dynamic Metrics"
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_400_error_responses" %}
        APPROX_QUANTILES(${count400_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_401_error_responses" %}
        APPROX_QUANTILES(${count401_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_403_error_responses" %}
        APPROX_QUANTILES(${count403_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_429_error_responses" %}
        APPROX_QUANTILES(${count429_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_client_error_responses" %}
        APPROX_QUANTILES(${count4xx_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_data_egress" %}
        ${quarter_percentile_data_egress}
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        ${quarter_percentile_data_ingress}
      {% elsif aggregate_function._parameter_value == "total_delete_requests" %}
        APPROX_QUANTILES(${total_deletes_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_list_requests" %}
        APPROX_QUANTILES(${total_lists_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_read_requests" %}
        APPROX_QUANTILES(${total_reads_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_requests" %}
        APPROX_QUANTILES(${total_requests_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_server_error_responses" %}
        APPROX_QUANTILES(${count5xx_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_success_responses" %}
        APPROX_QUANTILES(${count2xx_preaggregated}, 100)[OFFSET(25)]
      {% elsif aggregate_function._parameter_value == "total_update_requests" %}
        APPROX_QUANTILES(${total_updates_preaggregated}, 100)[OFFSET(25)]
      {% else %}
        APPROX_QUANTILES(${total_requests_preaggregated}, 100)[OFFSET(25)]
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_data_egress" %}
        <span><number>{{ quarter_percentile_data_egress_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        <span>{{ quarter_percentile_data_ingress_aid._value }}</span>
      {% endif %};;
    description: "The 25th percentile value of the specific metric currently selected in the 'Aggregate Function' parameter. This threshold indicates that 25% of the observed values fall below this number."
  }

  measure: selected_three_quarter_percentile{
    group_label: "Dynamic Metrics"
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_400_error_responses" %}
        APPROX_QUANTILES(${count400_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_401_error_responses" %}
        APPROX_QUANTILES(${count401_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_403_error_responses" %}
        APPROX_QUANTILES(${count403_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_429_error_responses" %}
        APPROX_QUANTILES(${count429_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_client_error_responses" %}
        APPROX_QUANTILES(${count4xx_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_data_egress" %}
        ${three_quarter_percentile_data_egress}
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        ${three_quarter_percentile_data_ingress}
      {% elsif aggregate_function._parameter_value == "total_delete_requests" %}
        APPROX_QUANTILES(${total_deletes_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_list_requests" %}
        APPROX_QUANTILES(${total_lists_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_read_requests" %}
        APPROX_QUANTILES(${total_reads_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_requests" %}
        APPROX_QUANTILES(${total_requests_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_server_error_responses" %}
        APPROX_QUANTILES(${count5xx_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_success_responses" %}
        APPROX_QUANTILES(${count2xx_preaggregated}, 100)[OFFSET(75)]
      {% elsif aggregate_function._parameter_value == "total_update_requests" %}
        APPROX_QUANTILES(${total_updates_preaggregated}, 100)[OFFSET(75)]
      {% else %}
        APPROX_QUANTILES(${total_requests_preaggregated}, 100)[OFFSET(75)]
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_data_egress" %}
        <span><number>{{ three_quarter_percentile_data_egress_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_data_ingress" %}
        <span>{{ three_quarter_percentile_data_ingress_aid._value }}</span>
      {% endif %};;
    description: "The 75th percentile (upper quartile) value of the specific metric currently selected in the 'Aggregate Function' parameter. This threshold indicates that 75% of the observed values fall below this number."
  }

  measure: three_quarter_percentile_data_egress {
    group_label: "Data Transfer"
    label: "75th Percentile Data Egress"
    type: number
    value_format: "#,##0.00"
    hidden: yes
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100) [OFFSET(75)] / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100)[OFFSET(75)] / (1024)
      {% else %}
        APPROX_QUANTILES(${TABLE}.totalResponseBytes, 100)[OFFSET(75)]
      {% endif %};;
    html: <span>{{ three_quarter_percentile_data_egress_aid._value }}</span>;;
    description: "The 75th percentile (upper quartile) volume of data transferred out of Google Cloud Storage (GCS). The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: three_quarter_percentile_data_ingress {
    group_label: "Data Transfer"
    label: "75th Percentile Data Ingress"
    type: number
    value_format: "#,##0.00"
    hidden: yes
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100) [OFFSET(75)] / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100)[OFFSET(75)] / (1024)
      {% else %}
        APPROX_QUANTILES(${TABLE}.totalRequestBytes, 100)[OFFSET(75)]
      {% endif %};;
    html: <span>{{ three_quarter_percentile_data_ingress_aid._value }}</span>;;
    description: "The 75th percentile (upper quartile) volume of data transferred into Google Cloud Storage (GCS). The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_400_error_responses {
    group_label: "Request Status"
    label: "Total 400 Error Responses"
    type: sum
    value_format: "#,##0.00"
    sql: ${count400_preaggregated} ;;
    description: "The total count of HTTP responses with a 400 (Bad Request) status code. This indicates that the server could not understand the request due to invalid syntax."
  }

  measure: total_401_error_responses {
    group_label: "Request Status"
    label: "Total 401 Error Responses"
    type: sum
    sql: ${count401_preaggregated} ;;
    description: "The total count of HTTP responses with a 401 (Unauthorized) status code. This indicates that the request lacked valid authentication credentials for the target resource."
  }

  measure: total_403_error_responses {
    group_label: "Request Status"
    label: "Total 403 Error Responses"
    type: sum
    sql: ${count403_preaggregated} ;;
    description: "The total count of HTTP responses with a 403 (Forbidden) status code. This indicates that the server understood the request but refuses to authorize it, typically due to insufficient permissions."
  }

  measure: total_429_error_responses {
    group_label: "Request Status"
    label: "Total 429 Error Responses"
    type: sum
    sql: ${count429_preaggregated} ;;
    description: "The total count of HTTP responses with a 429 (Too Many Requests) status code. This indicates that the client has sent too many requests in a given amount of time (rate limiting)."
    value_format_name: dynamic_thousands
  }

  measure: total_client_error_responses {
    group_label: "Request Status"
    label: "Total Client Error Responses"
    type: sum
    sql: ${count4xx_preaggregated} ;;
    description: "The total count of HTTP responses with a 4xx (Client Error) status code. This category aggregates all client-side issues (e.g., 400, 401, 403, 429), indicating that the request contains bad syntax or cannot be fulfilled."
    value_format_name: dynamic_thousands
  }

  measure: total_client_error_status_requests {
    group_label: "Request Status"
    type: sum
    label: "Total Client Error Requests by Status"
    sql:
      CASE
        WHEN ${client_error_status.client_error_label} = '400' THEN ${count400_preaggregated}
        WHEN ${client_error_status.client_error_label} = '401' THEN ${count401_preaggregated}
        WHEN ${client_error_status.client_error_label} = '403' THEN ${count403_preaggregated}
        WHEN ${client_error_status.client_error_label} = '429' THEN ${count429_preaggregated}
        ELSE 0
      END;;
    value_format_name: dynamic_thousands
    description: "Dynamically calculates the total count for a specific 4xx error code based on the 'Client Error Label' dimension. Use this measure when breaking down client errors to see the distinct volume for each status type (e.g., 400, 401, 403, 429)."
  }

  measure: total_data_egress {
    group_label: "Data Transfer"
    label: "Total Data Egress"
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.totalResponseBytes AS FLOAT64)
      {% endif %};;
    html: <span>{{ total_data_egress_aid._value }}</span>;;
    description: "The total volume of data transferred out of Google Cloud Storage (GCS) to clients or other destinations. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_data_ingress {
    group_label: "Data Transfer"
    label: "Total Data Ingress"
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalRequestBytes / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalRequestBytes / (1024)
      {% else %}
        ${TABLE}.totalRequestBytes
      {% endif %};;
    html: <span>{{ total_data_ingress_aid._value }}</span>;;
    description: "The total volume of data uploaded or transferred into Google Cloud Storage (GCS). The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_delete_requests {
    group_label: "Operations"
    label: "Total Delete Requests"
    type: sum
    sql: ${total_deletes_preaggregated} ;;
    description: "The total count of HTTP requests made using the DELETE method. This metric specifically tracks object-level deletion requests only."
  }

  measure: total_errors {
    group_label: "Request Status"
    label: "Total Errors"
    type: number
    sql: ${total_client_error_responses} + ${total_server_error_responses};;
    description: "The aggregate count of all failed HTTP requests, combining both Client Errors (4xx) and Server Errors (5xx). This metric provides a comprehensive total of all object-level request failures."
    value_format_name: dynamic_thousands
  }

  measure: total_list_requests {
    group_label: "Operations"
    label: "Total List Requests"
    type: sum
    sql: ${total_lists_preaggregated} ;;
    description: "The total count of requests made to list the objects and prefixes within a bucket. This metric corresponds specifically to the 'storage.objects.list' operation."
  }

  measure: total_read_requests {
    group_label: "Operations"
    label: "Total Read Requests"
    type: sum
    sql: ${total_reads_preaggregated} ;;
    description: "The total count of requests made to read or download the actual data contents of an object. This metric corresponds specifically to the 'storage.objects.get' operation."
    value_format_name: dynamic_thousands
  }

  measure: total_requests {
    group_label: "Traffic Overview"
    label: "Total Requests"
    type: sum
    sql: ${total_requests_preaggregated} ;;
    description: "Grand total of all HTTP requests received by Google Cloud Storage (GCS) for the monitored resources, regardless the operation type (e.g., GET, PUT; POST, DELETE, or LIST)"
    value_format_name: dynamic_thousands
  }

  measure: total_requests_per_status {
    group_label: "Request Status"
    label: "Total Requests per Status"
    type: sum
    sql:
      CASE
        WHEN ${status_values.status_label} = '2xx' THEN ${count2xx_preaggregated}
        WHEN ${status_values.status_label} = '4xx' THEN ${count4xx_preaggregated}
        WHEN ${status_values.status_label} = '5xx' THEN ${count5xx_preaggregated}
        ELSE 0
      END;;
    value_format_name: dynamic_thousands
    description: "A measure that calculates the total request count corresponding to the specific HTTP status category (2xx Success, 4xx Client Error, or 5xx Server Error) currently being viewed in the 'Status' dimension."
  }

  measure: total_server_error_responses {
    group_label: "Request Status"
    label: "Total Server Error Responses"
    type: sum
    sql: ${count5xx_preaggregated} ;;
    value_format_name: dynamic_thousands
    description: "The total count of HTTP responses with a 5xx status code (Server Error). This indicates that Google Cloud Storage failed to fulfill an apparently valid request due to an internal error."
  }

  measure: total_success_responses {
    group_label: "Request Status"
    label: "Total Success Responses"
    type: sum
    sql: ${count2xx_preaggregated} ;;
    value_format_name: dynamic_thousands
    description: "The total count of HTTP responses with a 2xx status code (Success). This indicates that the request was successfully received, understood, and accepted by Google Cloud Storage."
  }

  measure: total_update_requests {
    group_label: "Operations"
    label: "Total Update Requests"
    type: sum
    sql: ${total_updates_preaggregated} ;;
    description: "The total count of requests made to modify or overwrite an existing object's data or metadata. This metric primarily corresponds to the 'storage.objects.update' and 'storage.objects.patch' operations."
  }

  measure: total_write_requests {
    group_label: "Operations"
    label: "Total Write Requests"
    type: sum
    sql: ${total_writes_preaggregated} ;;
    description: "The total count of requests made to upload or create a new object. This metric primarily corresponds to the 'storage.objects.insert' operation."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Period over Period (PoP) Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: error_rate_current {
    group_label: "Request Status"
    label: "Error Rate (Current Period)"
    type: number
    value_format_name: percent_2
    sql:
      (${total_client_error_responses_current} + ${total_server_error_responses_current})
      / NULLIF(${total_requests_current}, 0) ;;
    description: "The percentage of requests that failed during the selected analysis date range. This metric represents the 'Current' value in Period-over-Period comparisons."
  }

  measure: error_rate_pop_change {
    group_label: "Request Status"
    label: "Error Rate (PoP Change)"
    type: number
    value_format_name: percent_2

    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${error_rate_current} - ${error_rate_previous}),
          ${error_rate_previous}
        )
      {% else %}
        0
      {% endif %} ;;
    html:
      {% if analysis_date_filter._is_filtered %}
         {{ rendered_value }}
      {% else %}
         <div style="display: none;"></div>
      {% endif %} ;;
    description: "The relative percentage change in the Error Rate compared to the previous period. A positive value indicates the error rate has increased (worsened), while a negative value indicates it has decreased (improved)."
  }

  measure: error_rate_previous {
    group_label: "Request Status"
    label: "Error Rate (Previous Period)"
    type: number
    value_format_name: percent_2
    sql:
      (${total_client_error_responses_previous} + ${total_server_error_responses_previous})
      / NULLIF(${total_requests_previous}, 0) ;;
    description: "The percentage of requests that failed during the comparison period immediately preceding the selected date range. This serves as the baseline for the Period-over-Period (PoP) analysis."
  }

  measure: total_429_error_responses_current {
    group_label: "Request Status"
    label: "Total 429 Error Responses (Current Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
        THEN ${count429_preaggregated}
        ELSE 0
        END
      {% else %}
        ${count429_preaggregated}
      {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total number of 429 (Too Many Requests) errors aggregated strictly within the selected analysis period. Used primarily for comparing current performance against a prior timeframe."
  }

  measure: total_429_error_responses_pop_change {
    group_label: "Request Status"
    label: "Total 429 Error Responses (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${total_429_error_responses_current} - ${total_429_error_responses_previous}),
          ${total_429_error_responses_previous}
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
    description: "The percentage change in 429 (Too Many Requests) errors compared to the previous period. A positive value indicates an increase in rate-limiting incidents."
  }

  measure: total_429_error_responses_previous {
    group_label: "Request Status"
    label: "Total 429 Error Responses (Previous Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          ${snapshot_start_raw} >=
            TIMESTAMP_SUB({% date_start analysis_date_filter %},
            INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
          AND
          ${snapshot_start_raw} < {% date_start analysis_date_filter %}
        THEN ${count429_preaggregated}
        ELSE 0
        END
      {% else %}
        NULL
      {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total number of 429 (Too Many Requests) errors aggregated during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing current rate-limiting trends."
  }

  measure: total_client_error_responses_current {
    group_label: "Request Status"
    label: "Total Client Error Responses (Current Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
        THEN ${count4xx_preaggregated}
        ELSE 0
        END
      {% else %}
        ${count4xx_preaggregated}
      {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total number of 4xx (Client Error) responses aggregated strictly within the selected analysis period. Used primarily for comparing current performance against a prior timeframe."
  }

  measure: total_client_error_responses_pop_change {
    group_label: "Request Status"
    label: "Total Client Error Responses (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${total_client_error_responses_current} - ${total_client_error_responses_previous}),
          ${total_client_error_responses_previous}
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
    description: "The percentage change in 4xx (Client Error) responses compared to the previous period. A positive value indicates an increasing trend in client-side issues (e.g., bad requests, authorization failures)."
  }

  measure: total_client_error_responses_previous {
    group_label: "Request Status"
    label: "Total Client Error Responses (Previous Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          ${snapshot_start_raw} >=
            TIMESTAMP_SUB({% date_start analysis_date_filter %},
            INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
          AND
          ${snapshot_start_raw} < {% date_start analysis_date_filter %}
        THEN ${count4xx_preaggregated}
        ELSE 0
        END
      {% else %}
        NULL
      {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total number of 4xx (Client Error) responses aggregated during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing current client-side error trends."
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
            CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 5))
          {% elsif throughput_size_unit._parameter_value == "TiB" %}
            CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 4))
          {% elsif throughput_size_unit._parameter_value == "GiB" %}
            CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 3))
          {% elsif throughput_size_unit._parameter_value == "MiB" %}
            CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 2))
          {% elsif throughput_size_unit._parameter_value == "KiB" %}
            CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (1024)
          {% else %}
            CAST(${TABLE}.totalResponseBytes AS FLOAT64)
          {% endif %}
        ELSE 0
        END
      {% else %}
        {% if throughput_size_unit._parameter_value == "PiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif throughput_size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif throughput_size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif throughput_size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif throughput_size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64)
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
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif throughput_size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif throughput_size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif throughput_size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif throughput_size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.totalResponseBytes AS FLOAT64)
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
          CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif throughput_size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif throughput_size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif throughput_size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif throughput_size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.totalRequestBytes AS FLOAT64)
        {% endif %}
      ELSE 0
      END
    {% else %}
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.totalRequestBytes AS FLOAT64)
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
              CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 5))
            {% elsif throughput_size_unit._parameter_value == "TiB" %}
              CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 4))
            {% elsif throughput_size_unit._parameter_value == "GiB" %}
              CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 3))
            {% elsif throughput_size_unit._parameter_value == "MiB" %}
              CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (POW(1024, 2))
            {% elsif throughput_size_unit._parameter_value == "KiB" %}
              CAST(${TABLE}.totalRequestBytes AS FLOAT64) / (1024)
            {% else %}
              CAST(${TABLE}.totalRequestBytes AS FLOAT64)
            {% endif %}
          ELSE 0
          END
        {% else %}
          NULL
        {% endif %} ;;

    html: <span>{{ total_data_ingress_aid_previous._value }}</span> ;;
    description: "The total volume of data uploaded or transferred into Google Cloud Storage (GCS) during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing current data ingress trends. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_read_requests_current {
    group_label: "Operations"
    label: "Total Read Requests (Current Period)"
    type: sum
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE WHEN
        {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
      THEN ${total_reads_preaggregated}
      ELSE 0
      END
    {% else %}
      ${total_reads_preaggregated}
    {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total count of object read requests (storage.objects.get) that occurred specifically within the selected analysis period."
  }

  measure: total_read_requests_pop_change {
    group_label: "Operations"
    label: "Total Read Requests (PoP Change)"
    type: number
    sql:
    {% if analysis_date_filter._is_filtered %}
      SAFE_DIVIDE(
        (${total_read_requests_current} - ${total_read_requests_previous}),
        ${total_read_requests_previous}
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
    description: "The percentage change in the volume of object read requests compared to the previous period. A positive value indicates an increase in read operations (storage.objects.get) relative to the prior timeframe."
  }

  measure: total_read_requests_previous {
    group_label: "Operations"
    label: "Total Read Requests (Previous Period)"
    type: sum
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE WHEN
        ${snapshot_start_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
        ${snapshot_start_raw} < {% date_start analysis_date_filter %}
      THEN ${total_reads_preaggregated}
      ELSE 0
      END
    {% else %}
      NULL
    {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total count of object read requests (storage.objects.get) that occurred during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing current read access trends."
  }

  measure: total_requests_current {
    group_label: "Traffic Overview"
    label: "Total Requests (Current Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
        THEN ${total_requests_preaggregated}
        ELSE 0
        END
      {% else %}
        ${total_requests_preaggregated}
      {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total count of all HTTP requests received by Google Cloud Storage (GCS) specifically within the selected analysis period. This includes all operation types (e.g., GET, PUT, POST, DELETE, LIST)."
  }

  measure: total_requests_pop_change {
    group_label: "Traffic Overview"
    label: "Total Requests (PoP Change)"
    type: number
    sql:
    {% if analysis_date_filter._is_filtered %}
      SAFE_DIVIDE(
        (${total_requests_current} - ${total_requests_previous}),
        ${total_requests_previous}
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
    description: "The percentage change in the total volume of HTTP requests compared to the previous period. A positive value indicates an overall increase in traffic to the monitored resources relative to the prior timeframe."
  }

  measure: total_requests_previous {
    group_label: "Traffic Overview"
    label: "Total Requests (Previous Period)"
    type: sum
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE WHEN
        ${snapshot_start_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
        ${snapshot_start_raw} < {% date_start analysis_date_filter %}
      THEN ${total_requests_preaggregated}
      ELSE 0
      END
    {% else %}
      NULL
    {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total count of all HTTP requests received during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing overall traffic volume trends."
  }

  measure: total_server_error_responses_current {
    group_label: "Request Status"
    label: "Total Server Error Responses (Current Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
        THEN ${count5xx_preaggregated}
        ELSE 0
        END
      {% else %}
        ${count5xx_preaggregated}
      {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total count of server errors (5xx status codes) recorded specifically within the selected analysis period. These indicate internal failures within Google Cloud Storage rather than client-side issues."
  }

  measure: total_server_error_responses_pop_change {
    group_label: "Request Status"
    label: "Total Server Error Responses (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${total_server_error_responses_current} - ${total_server_error_responses_previous}),
          ${total_server_error_responses_previous}
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
    description: "The percentage change in the volume of server error responses (5xx) compared to the previous period. A positive value indicates an increase in internal service failures relative to the prior timeframe."
  }

  measure: total_server_error_responses_previous {
    group_label: "Request Status"
    label: "Total Server Error Responses (Previous Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          ${snapshot_start_raw} >=
            TIMESTAMP_SUB({% date_start analysis_date_filter %},
            INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
          AND
          ${snapshot_start_raw} < {% date_start analysis_date_filter %}
        THEN ${count5xx_preaggregated}
        ELSE 0
        END
      {% else %}
        NULL
      {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total count of server error responses (5xx status codes) recorded during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing service stability trends."
  }

  measure: total_success_responses_current {
    group_label: "Request Status"
    label: "Total Success Responses (Current Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %}
        THEN ${count2xx_preaggregated}
        ELSE 0
        END
      {% else %}
        ${count2xx_preaggregated}
      {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total count of successful HTTP responses (2xx status codes) recorded specifically within the selected analysis period. This confirms that requests were successfully received and processed by Google Cloud Storage."
  }

  measure: total_success_responses_pop_change {
    group_label: "Request Status"
    label: "Total Success Responses (PoP Change)"
    type: number
    sql:
    {% if analysis_date_filter._is_filtered %}
      SAFE_DIVIDE(
        (${total_success_responses_current} - ${total_success_responses_previous}),
        ${total_success_responses_previous}
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
    description: "The percentage change in the volume of successful HTTP responses (2xx) compared to the previous period. A positive value indicates an increase in successfully processed requests relative to the prior timeframe."
  }

  measure: total_success_responses_previous {
    group_label: "Request Status"
    label: "Total Success Responses (Previous Period)"
    type: sum
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE WHEN
        ${snapshot_start_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
        ${snapshot_start_raw} < {% date_start analysis_date_filter %}
      THEN ${count2xx_preaggregated}
      ELSE 0
      END
    {% else %}
      NULL
    {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The total count of successful HTTP responses (2xx status codes) recorded during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing successful traffic volume trends."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: maximum_data_egress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
        WHEN MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(MAX(CAST(${TABLE}.totalResponseBytes AS FLOAT64)), 0), " B")
      END;;
    description: "A hidden helper measure that formats the Maximum Data Egress value into a human-readable string with the appropriate unit (e.g., '10.5 GiB'). Used for HTML display purposes."
  }

  measure: maximum_data_ingress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 3),1), " GiB")
        WHEN MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(MAX(CAST(${TABLE}.totalRequestBytes AS FLOAT64)), 0), " B")
      END;;
    description: "A hidden helper measure that formats the Maximum Data Ingress value into a human-readable string with the appropriate unit (e.g., '10.5 GiB'). Used for HTML display purposes."
  }

  measure: median_data_egress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 6) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 6), 2), " EiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 5) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 5), 2), " PiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 4) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 4), 2), " TiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 3) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 3), 1), " GiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 2) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 2), 0), " MiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] >= 1024 THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)] / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(50)], 0), " B")
      END;;
    description: "A hidden helper measure that formats the Median Data Egress value into a human-readable string with the appropriate unit (e.g., '500 MiB'). Used for HTML display purposes."
  }

  measure: median_data_ingress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 6) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 6), 2), " EiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 5) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 5), 2), " PiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 4) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 4), 2), " TiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 3) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 3), 1), " GiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] >= POW(1024, 2) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / POW(1024, 2), 0), " MiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] >= 1024 THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)] / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(50)], 0), " B")
      END;;
    description: "A hidden helper measure that formats the Median Data Ingress value into a human-readable string with the appropriate unit (e.g., '10.5 GiB'). Used for HTML display purposes."
  }

  measure: minimum_data_egress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
        WHEN MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(MIN(CAST(${TABLE}.totalResponseBytes AS FLOAT64)), 0), " B")
      END;;
    description: "A hidden helper measure that formats the Minimum Data Egress value into a human-readable string with the appropriate unit (e.g., '120 KiB'). Used for HTML display purposes."
  }

  measure: minimum_data_ingress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 3),1), " GiB")
        WHEN MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(MIN(CAST(${TABLE}.totalRequestBytes AS FLOAT64)), 0), " B")
      END;;
    description: "A hidden helper measure that formats the Minimum Data Ingress value into a human-readable string with the appropriate unit (e.g., '120 KiB'). Used for HTML display purposes."
  }

  measure: quarter_percentile_data_egress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 6) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 6), 2), " EiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 5) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 5), 2), " PiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 4) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 4), 2), " TiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 3) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 3), 1), " GiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 2) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 2), 0), " MiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] >= 1024 THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)] / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(25)], 0), " B")
      END;;
    description: "A hidden helper measure that formats the 25th Percentile Data Egress value into a human-readable string with the appropriate unit (e.g., '250 MiB'). Used for HTML display purposes."
  }

  measure: quarter_percentile_data_ingress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 6) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 6), 2), " EiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 5) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 5), 2), " PiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 4) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 4), 2), " TiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 3) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 3), 1), " GiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] >= POW(1024, 2) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / POW(1024, 2), 0), " MiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] >= 1024 THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)] / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(25)], 0), " B")
      END;;
    description: "A hidden helper measure that formats the 25th Percentile Data Ingress value into a human-readable string with the appropriate unit (e.g., '250 MiB'). Used for HTML display purposes."
  }

  measure: three_quarter_percentile_data_egress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 6) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 6), 2), " EiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 5) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 5), 2), " PiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 4) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 4), 2), " TiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 3) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 3), 1), " GiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 2) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 2), 0), " MiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] >= 1024 THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)] / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalResponseBytes AS FLOAT64), 100)[OFFSET(75)], 0), " B")
      END;;
    description: "A hidden helper measure that formats the 75th Percentile Data Egress value into a human-readable string with the appropriate unit (e.g., '750 MiB'). Used for HTML display purposes."
  }

  measure: three_quarter_percentile_data_ingress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 6) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 6), 2), " EiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 5) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 5), 2), " PiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 4) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 4), 2), " TiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 3) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 3), 1), " GiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] >= POW(1024, 2) THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / POW(1024, 2), 0), " MiB")
        WHEN APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] >= 1024 THEN CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)] / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(APPROX_QUANTILES(CAST(${TABLE}.totalRequestBytes AS FLOAT64), 100)[OFFSET(75)], 0), " B")
      END;;
    description: "A hidden helper measure that formats the 75th Percentile Data Ingress value into a human-readable string with the appropriate unit (e.g., '750 MiB'). Used for HTML display purposes."
  }

  measure: total_data_egress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
        WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)), 0), " B")
      END;;
    description: "A hidden helper measure that formats the Total Data Egress value into a human-readable string with the appropriate unit (e.g., '500 GiB'). Used for HTML display purposes."
  }

  measure: total_data_ingress_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 3),1), " GiB")
        WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)), 0), " B")
      END;;
    description: "A hidden helper measure that formats the Total Data Ingress value into a human-readable string with the appropriate unit (e.g., '500 GiB'). Used for HTML display purposes."
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
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END), 0), " B")
        END
      {% else %}
        CASE
          WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.totalResponseBytes AS FLOAT64)), 0), " B")
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
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalResponseBytes AS FLOAT64) ELSE 0 END), 0), " B")
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
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${snapshot_start_raw} {% endcondition %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END), 0), " B")
        END
      {% else %}
        CASE
          WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.totalRequestBytes AS FLOAT64)), 0), " B")
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
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
        WHEN SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) >= 1024
          THEN CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(SUM(CASE WHEN ${snapshot_start_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${snapshot_start_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.totalRequestBytes AS FLOAT64) ELSE 0 END), 0), " B")
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

  parameter: date_granularity {
    type: unquoted
    label: "Date Granularity"
    description: "This parameter allows users to specify the desired snapshot start time granularity. The default measure for this parameter is Date and Hour."

    allowed_value: {
      label: "Date and Hour"
      value: "date_hour"
    }

    allowed_value: {
      label: "Date"
      value: "date"
    }

    allowed_value: {
      label: "Year Month"
      value: "year_month"
    }

    allowed_value: {
      label: "Month Name"
      value: "month_name"
    }

    default_value: "date_hour"
  }

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

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measure Parameters -------------------------------
  # --------------------------------------------------------------------------------------------------------

  parameter: aggregate_function {
    label: "Selected Metric"
    type: unquoted
    allowed_value: {
      label: "Total 400 Error Responses"
      value: "total_400_error_responses"
    }

    allowed_value: {
      label: "Total 401 Error Responses"
      value: "total_401_error_responses"
    }

    allowed_value: {
      label: "Total 403 Error Responses"
      value: "total_403_error_responses"
    }

    allowed_value: {
      label: "Total 429 Error Responses"
      value: "total_429_error_responses"
    }

    allowed_value: {
      label: "Total Client Error Responses"
      value: "total_client_error_responses"
    }

    allowed_value: {
      label: "Total Data Egress"
      value: "total_data_egress"
    }

    allowed_value: {
      label: "Total Data Ingress"
      value: "total_data_ingress"
    }

    allowed_value: {
      label: "Total Delete Requests"
      value: "total_delete_requests"
    }

    allowed_value: {
      label: "Total List Requests"
      value: "total_list_requests"
    }

    allowed_value: {
      label: "Total Read Requests"
      value: "total_read_requests"
    }

    allowed_value: {
      label: "Total Requests"
      value: "total_requests"
    }

    allowed_value: {
      label: "Total Server Error Responses"
      value: "total_server_error_responses"
    }

    allowed_value: {
      label: "Total Success Responses"
      value: "total_success_responses"
    }

    allowed_value: {
      label: "Total Update Requests"
      value: "total_update_requests"
    }


    default_value: "total_requests"
    description: "This parameter allows users to specify the aggregated function for the 'Selected Measure' field. The default measure for this parameter is Total Objects."
  }

}
