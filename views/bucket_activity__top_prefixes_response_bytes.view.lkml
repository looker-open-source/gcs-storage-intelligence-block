# -------------------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Bucket Activity View Table inside the Storage Intelligence linked Dataset. This view specifically is related to the top object prefixes that experienced the highest volume of responses in bytes.
# -------------------------------------------------------------------------------------
view: bucket_activity__top_prefixes_response_bytes {

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: count {
    label: "Hourly-based egress data"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.count AS FLOAT64) / POW(1024, 5)
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.count AS FLOAT64) / POW(1024, 4)
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.count AS FLOAT64) / POW(1024, 3)
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.count AS FLOAT64) / POW(1024, 2)
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.count AS FLOAT64) / 1024.0
      {% else %}
        CAST(${TABLE}.count AS FLOAT64)
      {% endif %};;
    html:
      <span>{{ count_aid._value }}</span>;;
    hidden: yes
    description: "The total volume of data downloaded (response bytes) from this specific prefix during the hour, displayed in the selected unit."
  }

  dimension: prefix {
    label: "Top object prefix"
    type: string
    sql: ${TABLE}.prefix ;;
    description: "The object key prefix (folder path) associated with the response volume. Represents the directory structure where responses occured."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: count_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN CAST(${TABLE}.count AS FLOAT64) >= POW(1024,5) THEN CONCAT(ROUND(CAST(${TABLE}.count AS FLOAT64) / POW(1024, 5), 2), " PiB")
        WHEN CAST(${TABLE}.count AS FLOAT64) >= POW(1024,4) THEN CONCAT(ROUND(CAST(${TABLE}.count AS FLOAT64) / POW(1024, 4), 2), " TiB")
        WHEN CAST(${TABLE}.count AS FLOAT64) >= POW(1024,3) THEN CONCAT(ROUND(CAST(${TABLE}.count AS FLOAT64) / POW(1024, 3), 2), " GiB")
        WHEN CAST(${TABLE}.count AS FLOAT64) >= POW(1024,2) THEN CONCAT(ROUND(CAST(${TABLE}.count AS FLOAT64) / POW(1024, 2), 0), " MiB")
        WHEN CAST(${TABLE}.count AS FLOAT64) >= 1024 THEN CONCAT(ROUND(CAST(${TABLE}.count AS FLOAT64) / 1024, 0), " KiB")
        ELSE CONCAT(CAST(${TABLE}.count AS FLOAT64), " B")
      END;;
    description: "A helper dimension that formats the raw data volume (bytes) into a human-readable string with the appropriate unit suffix (e.g., 'GiB', 'TiB')."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_egress_data {
    group_label: "Data Transfer"
    label: "Total egress data"
    value_format: "#,##0.00"
    type: sum
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.count AS FLOAT64) / POW(1024, 5)
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.count AS FLOAT64) / POW(1024, 4)
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.count AS FLOAT64) / POW(1024, 3)
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.count AS FLOAT64) / POW(1024, 2)
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.count AS FLOAT64) / 1024.0
      {% else %}
        CAST(${TABLE}.count AS FLOAT64)
      {% endif %};;
    html:
      <span>{{ total_data_egress_aid._value }}</span> ;;
    description: "The total volume of data downloaded (Egress) from the identified object prefixes. The value is dynamically scaled to the unit selected in the 'Throughput Size Unit' parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_data_egress_aid {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CAST(${TABLE}.count AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.count AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN SUM(CAST(${TABLE}.count AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.count AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN SUM(CAST(${TABLE}.count AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.count AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN SUM(CAST(${TABLE}.count AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.count AS FLOAT64)) / POW(1024, 3), 2), " GiB")
        WHEN SUM(CAST(${TABLE}.count AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.count AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN SUM(CAST(${TABLE}.count AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.count AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(CAST(SUM(CAST(${TABLE}.count AS FLOAT64)) AS STRING), " B")
      END;;
    description: "A helper measure that automatically scales and formats the total egress data volume into the most appropriate human-readable unit (e.g., GiB, TiB) for display purposes."
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
}
