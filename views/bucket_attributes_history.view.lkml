# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Bucket Attributes View Table inside the Storage Intelligence linked Dataset.
# --------------------------------------------------------------------------

view: bucket_attributes_history {
  derived_table: {
    sql:
      SELECT
        snapshotTime,
        name,
        location,
        project,
        storageClass,
        objectCount,
        totalSize,
        metageneration
      FROM
        `@{PROJECT_ID}.@{BIGQUERY_DATASET}.bucket_attributes_view`
      GROUP BY
        1,2,3,4,5,6,7,8;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql:
      CONCAT(
        CAST(${TABLE}.snapshotTime AS STRING), '_',
        CAST(${TABLE}.timeCreated AS STRING), '_',
        ${TABLE}.name, '_',
        ${TABLE}.location, '_',
        CAST(${TABLE}.metageneration AS STRING), '_',
        CAST(${TABLE}.project AS STRING)
      );;
    description: "Unique composite identifier for a specific bucket state at a point in time. Formed by concatenating snapshot time, creation time, bucket name, location, metageneration, and project."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the Google Cloud Storage (GCS) bucket from which data is being sourced."
  }

  dimension: bucket_total_size {
    label: "Bucket Total Size"
    type: number
    hidden: no
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.totalSize / (1125899906842624)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.totalSize / (1099511627776)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.totalSize / (1073741824)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalSize / (1048576)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalSize / (1024)
      {% else %}
        ${TABLE}.totalSize
      {% endif %};;
    html:
      <span>{{ bucket_size_aid._value }}</span> ;;
    description: "The calculated total storage size of the bucket. The value is dynamically converted to the unit selected in the 'Size Unit' parameter (KiB, MiB, GiB, TiB, PiB)."
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
    description: "The geographic location where the bucket's data resides. Values can represent a single region (e.g., 'us-central1'), dual-region, or multi-region (e.g., 'US'). Determines data residency, availability, and pricing."
  }

  dimension: metageneration {
    hidden: yes
    type: number
    sql: ${TABLE}.metageneration ;;
    description: "The version counter for the bucket's metadata. This number increments whenever bucket configuration properties are updated."
  }

  dimension: object_count {
    type: number
    hidden: yes
    sql: ${TABLE}.objectCount ;;
    description: "The total number of objects (files) stored in the bucket at the time of the snapshot."
  }

  dimension: project {
    label: "Project Number"
    type: string
    sql: CAST(${TABLE}.project AS STRING) ;;
    description: "The unique, immutable numeric identifier for the Google Cloud project containing this bucket."
  }

  dimension: storage_class {
    type: string
    sql: ${TABLE}.storageClass ;;
    description: "The default storage tier assigned to new objects in the bucket. Determines the balance between storage costs and retrieval pricing. Common values include 'Standard', 'Nearline', 'Coldline', 'Archive', and 'Rapid' ."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_size_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${TABLE}.totalSize >= POW(1024,5) THEN CONCAT(CAST(ROUND(${TABLE}.totalSize / POW(1024,5), 2) AS STRING), " PiB")
        WHEN ${TABLE}.totalSize >= POW(1024,4) THEN CONCAT(CAST(ROUND(${TABLE}.totalSize / POW(1024,4), 2) AS STRING), " TiB")
        WHEN ${TABLE}.totalSize >= POW(1024,3) THEN CONCAT(CAST(ROUND(${TABLE}.totalSize / POW(1024,3), 2) AS STRING), " GiB")
        WHEN ${TABLE}.totalSize >= POW(1024,2) THEN CONCAT(CAST(ROUND(${TABLE}.totalSize / POW(1024,2), 2) AS STRING), " MiB")
        WHEN ${TABLE}.totalSize >= 1024 THEN CONCAT(CAST(ROUND(${TABLE}.totalSize / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(${TABLE}.totalSize AS STRING), " B")
      END ;;
    description: "A helper dimension that formats the raw bucket size (bytes) into human-readable IEC units (KiB, MiB, GiB, etc.). Used to populate the HTML 'size' parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: snapshot {
    group_label: "Snapshot Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.snapshotTime ;;
    description: "The snapshotTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the point-in-time when the bucket snapshot was captured, effectively grouping bucket snapshots. For the precise time rows were inserted into the table, refer to the Events Explore."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: object_sum {
    label: "Total Objects"
    type: sum
    value_format: "#,##0"
    sql: ${object_count} ;;
    description: "A measure that sums the total number of objects inside a Bucket within the latest snapshot."
  }

  measure: total_storage_size {
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.totalSize / POW(1024,5)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.totalSize / POW(1024,4)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.totalSize / POW(1024,3)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalSize / POW(1024,2)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalSize / (1024)
      {% else %}
        ${TABLE}.totalSize
      {% endif %};;
    html: <span>{{ sum_storage_aid._value }}</span> ;;
    description: "Calculates the total storage size. Visualizations display a formatted string (e.g., '5.2 GiB') via HTML. For exports (CSV/Excel), this returns the raw numeric value scaled to the unit selected in the 'Size Unit' parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: sum_storage_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(${TABLE}.totalSize) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.totalSize) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(${TABLE}.totalSize) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.totalSize) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(${TABLE}.totalSize) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.totalSize) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(${TABLE}.totalSize) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.totalSize) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(${TABLE}.totalSize) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.totalSize) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(${TABLE}.totalSize) >= 1024 THEN CONCAT(CAST(ROUND(SUM(${TABLE}.totalSize) / 1024, 0) AS STRING), " KiB")
        ELSE CONCAT(CAST(SUM(${TABLE}.totalSize) AS STRING), " B")
      END ;;
    description: "Helper measure that calculates the total storage size and converts it to the largest appropriate IEC unit (e.g., GiB, TiB) as a string. Used for HTML formatting in the 'Total Storage Size' measure."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Parameters -------------------------------
  # --------------------------------------------------------------------------------------------------------

  parameter: size_unit {
    type: unquoted
    label: "Storage Size Unit"

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
    description: "This parameter allows users to select the desired byte unit for storage size visualizations and file downloads (CSV, Sheets). The default value is GiB."
  }







}
