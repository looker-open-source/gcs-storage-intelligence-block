# -------------------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Bucket Activity View Table inside the Storage Intelligence linked Dataset. This view specifically is related to the top object prefixes that experienced the highest volume of requests in bytes.
# -------------------------------------------------------------------------------------
view: bucket_activity__top_prefixes_request_bytes {

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: count {
    label: "Hourly-based data ingress"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (1125899906842624)
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (1099511627776)
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (1073741824)
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (1048576)
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.count AS FLOAT64)
      {% endif %};;
    html:
      <span>{{ count_aid._value }}</span>;;
    hidden: yes
    description: "The total volume of data uploaded (request bytes) to this specific prefix during the hour, displayed in the selected unit."
  }

  dimension: prefix {
    label: "Top object prefix"
    type: string
    sql: ${TABLE}.prefix ;;
    description: "The object key prefix (folder path) associated with the request volume. Represents the directory structure where requests occured."
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
    description: "This hidden dimension supports the Hourly-based data ingress dimension by providing the throughput's size in the most appropriate unit. The value is displayed through an html parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_ingress_data {
    group_label: "Data Transfer"
    label: "Total ingress data"
    value_format: "#,##0.00"
    type: sum
    sql:
      {% if throughput_size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (POW(1024, 5))
      {% elsif throughput_size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (POW(1024, 4))
      {% elsif throughput_size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (POW(1024, 3))
      {% elsif throughput_size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (POW(1024, 2))
      {% elsif throughput_size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.count AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.count AS FLOAT64)
      {% endif %};;
    html:
      <span>{{ total_data_ingress_aid._value }}</span> ;;
    description: "The total volume of data uploaded (Ingress) to the identified object prefixes. The value is dynamically scaled to the unit selected in the 'Throughput Size Unit' parameter."
  }


  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_data_ingress_aid {
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
        ELSE CONCAT(SUM(CAST(${TABLE}.count AS FLOAT64)), " B")
      END;;
    description: "A helper measure that automatically scales and formats the total ingress data volume into the most appropriate human-readable unit (e.g., GiB, TiB) for display purposes."
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
