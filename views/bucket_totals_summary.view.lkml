# -------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: A Dynamic Derived Table that calculates the total ingress/egress per bucket
#          based on the user's selected timeframe. Used as a source for "Percent of Total"
#          calculations in the Bucket Region Activity Explore.
# --------------------------------------------------------------------------
view: bucket_totals_summary {

  derived_table: {
    sql:
      SELECT
        name as bucket_name,
        SUM(CAST(responseBytes AS FLOAT64)) AS total_egress_bytes,
        SUM(CAST(requestBytes AS FLOAT64)) AS total_ingress_bytes
      FROM
        `@{PROJECT_ID}.@{BIGQUERY_DATASET}.bucket_region_activity_view`
      WHERE
        {% condition bucket_region_activity.snapshot_start_date %} snapshotStartTime {% endcondition %}
        AND {% condition bucket_region_activity.snapshot_end_date %} snapshotEndTime {% endcondition %}
      GROUP BY
        1
      ;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_name {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.bucket_name ;;
    description: "The unique identifier for the bucket in this derived summary table. Used as the join key to connect these totals back to the main bucket region activity view."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: total_egress_bytes {
    hidden: yes
    type: number
    sql:
      {% if bucket_region_activity.throughput_size_unit._parameter_value == "PiB" %}
        ${TABLE}.total_egress_bytes / POW(1024, 5)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "TiB" %}
        ${TABLE}.total_egress_bytes / POW(1024, 4)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "GiB" %}
        ${TABLE}.total_egress_bytes / POW(1024, 3)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.total_egress_bytes / POW(1024, 2)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.total_egress_bytes / 1024
      {% else %}
        ${TABLE}.total_egress_bytes / POW(1024, 3)
      {% endif %}
    ;;
    html: <span>{{ total_egress_bytes_aid._value }}</span>;;
    description: "The total volume of data egress (outbound traffic) for the entire bucket within the selected timeframe. This aggregated value serves as the denominator for calculating percentage shares of traffic by location."
  }

  dimension: total_ingress_bytes {
    hidden: yes
    type: number
    sql:
      {% if bucket_region_activity.throughput_size_unit._parameter_value == "PiB" %}
        ${TABLE}.total_ingress_bytes / POW(1024, 5)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "TiB" %}
        ${TABLE}.total_ingress_bytes / POW(1024, 4)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "GiB" %}
        ${TABLE}.total_ingress_bytes / POW(1024, 3)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.total_ingress_bytes / POW(1024, 2)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.total_ingress_bytes / 1024
      {% else %}
        ${TABLE}.total_ingress_bytes / POW(1024, 3)
      {% endif %}
    ;;
    html: <span>{{ total_ingress_bytes_aid._value }}</span>;;
    description: "The total volume of data ingress (inbound traffic) for the entire bucket within the selected timeframe. This aggregated value serves as the denominator for calculating percentage shares of traffic by location."
  }

  dimension: selected_total {
    hidden: yes
    label_from_parameter: bucket_region_activity.aggregate_function
    type: number
    sql:
      {% if bucket_region_activity.aggregate_function._parameter_value == 'total_data_egress' %}
        ${total_egress_bytes}
      {% elsif bucket_region_activity.aggregate_function._parameter_value == 'total_data_ingress' %}
        ${total_ingress_bytes}
      {% else %}
        ${total_egress_bytes}
      {% endif %} ;;
    html:
      {% if bucket_region_activity.aggregate_function._parameter_value == 'total_data_egress' %}
        <span><number>{{ total_egress_bytes_aid._value }}</number></span>
      {% elsif bucket_region_activity.aggregate_function._parameter_value == 'total_data_ingress' %}
        <span><number>{{ total_ingress_bytes_aid._value }}</number></span>
      {% endif %}
      ;;
    description: "Dynamically selects the total bucket volume (Ingress or Egress) based on the user's parameter selection. This value serves as the denominator for the 'Traffic Percent' calculation."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: total_egress_bytes_aid {
    hidden: yes
    type: string
    sql:
    CASE
      WHEN ${TABLE}.total_egress_bytes >= POW(1024, 6) THEN CONCAT(CAST(ROUND(${TABLE}.total_egress_bytes / POW(1024, 6), 2) AS STRING), " EiB")
      WHEN ${TABLE}.total_egress_bytes >= POW(1024, 5) THEN CONCAT(CAST(ROUND(${TABLE}.total_egress_bytes / POW(1024, 5), 2) AS STRING), " PiB")
      WHEN ${TABLE}.total_egress_bytes >= POW(1024, 4) THEN CONCAT(CAST(ROUND(${TABLE}.total_egress_bytes / POW(1024, 4), 2) AS STRING), " TiB")
      WHEN ${TABLE}.total_egress_bytes >= POW(1024, 3) THEN CONCAT(CAST(ROUND(${TABLE}.total_egress_bytes / POW(1024, 3), 2) AS STRING), " GiB")
      WHEN ${TABLE}.total_egress_bytes >= POW(1024, 2) THEN CONCAT(CAST(ROUND(${TABLE}.total_egress_bytes / POW(1024, 2), 2) AS STRING), " MiB")
      WHEN ${TABLE}.total_egress_bytes >= 1024 THEN CONCAT(CAST(ROUND(${TABLE}.total_egress_bytes / 1024, 2) AS STRING), " KiB")
      ELSE CONCAT(CAST(${TABLE}.total_egress_bytes AS STRING), " B")
    END ;;
    description: "Helper dimension that formats the pre-aggregated bucket egress total into human-readable IEC units (e.g., '10.55 GiB'). Used to populate the HTML for the 'Total Egress Bytes' dimension."
  }

  dimension: total_ingress_bytes_aid {
    hidden: yes
    type: string
    sql:
    CASE
      WHEN ${TABLE}.total_ingress_bytes >= POW(1024, 6) THEN CONCAT(CAST(ROUND(${TABLE}.total_ingress_bytes / POW(1024, 6), 2) AS STRING), " EiB")
      WHEN ${TABLE}.total_ingress_bytes >= POW(1024, 5) THEN CONCAT(CAST(ROUND(${TABLE}.total_ingress_bytes / POW(1024, 5), 2) AS STRING), " PiB")
      WHEN ${TABLE}.total_ingress_bytes >= POW(1024, 4) THEN CONCAT(CAST(ROUND(${TABLE}.total_ingress_bytes / POW(1024, 4), 2) AS STRING), " TiB")
      WHEN ${TABLE}.total_ingress_bytes >= POW(1024, 3) THEN CONCAT(CAST(ROUND(${TABLE}.total_ingress_bytes / POW(1024, 3), 2) AS STRING), " GiB")
      WHEN ${TABLE}.total_ingress_bytes >= POW(1024, 2) THEN CONCAT(CAST(ROUND(${TABLE}.total_ingress_bytes / POW(1024, 2), 2) AS STRING), " MiB")
      WHEN ${TABLE}.total_ingress_bytes >= 1024 THEN CONCAT(CAST(ROUND(${TABLE}.total_ingress_bytes / 1024, 2) AS STRING), " KiB")
      ELSE CONCAT(CAST(${TABLE}.total_ingress_bytes AS STRING), " B")
    END ;;
    description: "Helper dimension that formats the pre-aggregated bucket ingress total into human-readable IEC units (e.g., '5.12 GiB'). Used to populate the HTML for the 'Total Ingress Bytes' dimension."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: selected_measure {
    label_from_parameter: bucket_region_activity.aggregate_function
    type: number
    sql:
      {% if bucket_region_activity.aggregate_function._parameter_value == 'total_data_egress' %}
        ${total_data_egress}
      {% elsif bucket_region_activity.aggregate_function._parameter_value == 'total_data_ingress' %}
        ${total_data_ingress}
      {% else %}
        ${total_data_egress}
      {% endif %} ;;
    html:
      {% if bucket_region_activity.aggregate_function._parameter_value == 'total_data_egress' %}
        <span><number>{{ total_data_egress_aid._value }}</number></span>
      {% elsif bucket_region_activity.aggregate_function._parameter_value == 'total_data_ingress' %}
        <span><number>{{ total_data_ingress_aid._value }}</number></span>
      {% endif %}
      ;;
    description: "Dynamically switches between Total Egress and Total Ingress based on the user's parameter selection. This measure represents the total for the bucket and serves as the denominator for percentage calculations."
  }

  measure: total_data_egress {
    label: "Total Data Egress"
    type: sum
    sql:
      {% if bucket_region_activity.throughput_size_unit._parameter_value == "PiB" %}
        ${TABLE}.total_egress_bytes / POW(1024, 5)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "TiB" %}
        ${TABLE}.total_egress_bytes / POW(1024, 4)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "GiB" %}
        ${TABLE}.total_egress_bytes / POW(1024, 3)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.total_egress_bytes / POW(1024, 2)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.total_egress_bytes / 1024
      {% else %}
        ${TABLE}.total_egress_bytes / POW(1024, 3)
      {% endif %}
    ;;
    html: <span>{{ total_data_egress_aid._value }}</span>;;
    description: "The total volume of outbound data (Egress) for the bucket during the selected timeframe. This measure represents the '100% Total' for the bucket and is used as the denominator to calculate the percentage of traffic per location."
  }

  measure: total_data_ingress{
    label: "Total Data Ingress"
    type: sum
    sql:
      {% if bucket_region_activity.throughput_size_unit._parameter_value == "PiB" %}
        ${TABLE}.total_ingress_bytes / POW(1024, 5)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "TiB" %}
        ${TABLE}.total_ingress_bytes / POW(1024, 4)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "GiB" %}
        ${TABLE}.total_ingress_bytes / POW(1024, 3)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "MiB" %}
        ${TABLE}.total_ingress_bytes / POW(1024, 2)
      {% elsif bucket_region_activity.throughput_size_unit._parameter_value == "KiB" %}
        ${TABLE}.total_ingress_bytes / 1024
      {% else %}
        ${TABLE}.total_ingress_bytes / POW(1024, 3)
      {% endif %}
    ;;
    html: <span>{{ total_data_ingress_aid._value }}</span>;;
    description: "The total volume of inbound data (Ingress) for the bucket during the selected timeframe. This measure represents the '100% Total' for the bucket and is used as the denominator to calculate the percentage of traffic per location."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_data_egress_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN MAX(${TABLE}.total_egress_bytes) >= POW(1024, 6)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_egress_bytes AS FLOAT64)) / POW(1024, 6), 2) AS STRING), " EiB")
        WHEN MAX(${TABLE}.total_egress_bytes) >= POW(1024, 5)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_egress_bytes AS FLOAT64)) / POW(1024, 5), 2) AS STRING), " PiB")
        WHEN MAX(${TABLE}.total_egress_bytes) >= POW(1024, 4)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_egress_bytes AS FLOAT64)) / POW(1024, 4), 2) AS STRING), " TiB")
        WHEN MAX(${TABLE}.total_egress_bytes) >= POW(1024, 3)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_egress_bytes AS FLOAT64)) / POW(1024, 3), 2) AS STRING), " GiB")
        WHEN MAX(${TABLE}.total_egress_bytes) >= POW(1024, 2)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_egress_bytes AS FLOAT64)) / POW(1024, 2), 2) AS STRING), " MiB")
        WHEN MAX(${TABLE}.total_egress_bytes) >= 1024
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_egress_bytes AS FLOAT64)) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(MAX(${TABLE}.total_egress_bytes) AS STRING), " B")
      END ;;
    description: "Helper measure that formats the bucket's total egress. Uses MAX to safely retrieve the bucket total without duplication from the join."

  }

  measure: total_data_ingress_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN MAX(${TABLE}.total_ingress_bytes) >= POW(1024, 6)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_ingress_bytes AS FLOAT64)) / POW(1024, 6), 2) AS STRING), " EiB")
        WHEN MAX(${TABLE}.total_ingress_bytes) >= POW(1024, 5)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_ingress_bytes AS FLOAT64)) / POW(1024, 5), 2) AS STRING), " PiB")
        WHEN MAX(${TABLE}.total_ingress_bytes) >= POW(1024, 4)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_ingress_bytes AS FLOAT64)) / POW(1024, 4), 2) AS STRING), " TiB")
        WHEN MAX(${TABLE}.total_ingress_bytes) >= POW(1024, 3)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_ingress_bytes AS FLOAT64)) / POW(1024, 3), 2) AS STRING), " GiB")
        WHEN MAX(${TABLE}.total_ingress_bytes) >= POW(1024, 2)
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_ingress_bytes AS FLOAT64)) / POW(1024, 2), 2) AS STRING), " MiB")
        WHEN MAX(${TABLE}.total_ingress_bytes) >= 1024
          THEN CONCAT(CAST(ROUND(MAX(CAST(${TABLE}.total_ingress_bytes AS FLOAT64)) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(MAX(${TABLE}.total_ingress_bytes) AS STRING), " B")
      END ;;
    description: "Helper measure that formats the bucket's total ingress. Uses MAX to safely retrieve the bucket total without duplication from the join."
  }

}