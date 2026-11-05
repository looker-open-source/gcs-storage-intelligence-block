# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Nov 4, 2026
# Purpose: Contains information about the Bucket Attributes Latest Snapshot View Table inside the Storage Intelligence linked Dataset.
# --------------------------------------------------------------------------

view: bucket_attributes {

  sql_table_name: `@{PROJECT_ID}.@{BIGQUERY_DATASET}.bucket_attributes_latest_snapshot_view` ;;

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    label: "Primary key"
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

  dimension: bucket_allowed_encryptions {
    label: "Bucket allowed encryptions"
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.enforcedEncryptionAllowedTypes, ' ') ;;
    description: "A comma-separated list representing the encryption types allowed on the Cloud Storage bucket (e.g., GMEK, CMEK, CSEK) as part of its encryption enforcement configuration."
  }

  dimension: bucket_name {
    label: "Bucket name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the Google Cloud Storage (GCS) bucket from which data is being sourced."
  }

  dimension: bucket_policy_only {
    hidden: yes
    group_label: "Public"
    label: "Has bucket policy only restrictions?"
    type: yesno
    sql: ${TABLE}.public.bucketPolicyOnly ;;
    description: "A boolean value indicating whether the bucket enforces IAM bucket policy only restrictions."
  }

  dimension: bucket_total_size {
    label: "Bucket total size"
    type: number
    hidden: no
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.totalSize / POW(1024, 5)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.totalSize / POW(1024, 4)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.totalSize / POW(1024, 3)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.totalSize / POW(1024, 2)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.totalSize / 1024
      {% else %}
        ${TABLE}.totalSize
      {% endif %};;
    html:
      <span>{{ bucket_size_aid._value }}</span> ;;
    description: "The calculated total storage size of the bucket. The value is dynamically converted to the unit selected in the 'Size Unit' parameter (KiB, MiB, GiB, TiB, PiB)."
  }

  dimension: default_encryption_type {
    label: "Default encryption type (default)"
    hidden: yes
    type: string
    sql: ${TABLE}.defaultEncryptionType ;;
    description: "The default type of encryption applied to the bucket."
  }

  dimension: enabled {
    group_label: "Autoclass"
    label: "Is autoclass enabled?"
    type: yesno
    sql: ${TABLE}.autoclass.enabled ;;
    description: "Indicates whether Autoclass is active on the bucket. When true, Google Cloud automatically transitions objects to appropriate storage classes (e.g., Standard to Nearline/Coldline) based on their last access time to optimize costs."
  }

  dimension: lifecycle {
    label: "Has lifecycle policies?"
    type: yesno
    sql: ${TABLE}.lifecycle ;;
    description: "Indicates whether the bucket has user-defined lifecycle rules attached. Returns true if the customer has configured policies to automatically delete or transition objects based on age or versioning."
  }

  dimension: location {
    label: "Location"
    type: string
    sql: ${TABLE}.location ;;
    description: "The geographic location where the bucket's data resides. Values can represent a single region (e.g., 'us-central1'), dual-region, or multi-region (e.g., 'US'). Determines data residency, availability, and pricing."
  }

  dimension: metageneration {
    label: "Metageneration"
    type: number
    sql: ${TABLE}.metageneration ;;
    description: "The version counter for the bucket's metadata. This number increments whenever bucket configuration properties are updated."
  }

  dimension: object_count {
    label: "Object count"
    type: number
    hidden: yes
    sql: ${TABLE}.objectCount ;;
    description: "The total number of objects (files) stored in the bucket at the time of the snapshot."
  }

  dimension: object_retention_enabled {
    label: "Is object retention enabled?"
    type: yesno
    sql: ${TABLE}.objectRetentionEnabled ;;
    description: "Indicates whether object retention is enabled for the bucket."
  }

  dimension: project {
    label: "Project number"
    type: string
    sql: CAST(${TABLE}.project AS STRING) ;;
    description: "The unique, immutable numeric identifier for the Google Cloud project containing this bucket."
  }

  dimension: public_access_prevention {
    group_label: "IAM configuration"
    label: "Public access prevention"
    type: string
    sql: ${TABLE}.iamConfiguration.publicAccessPrevention ;;
    description: "The status of Public Access Prevention (PAP). 'ENFORCED' blocks all public access to the bucket and its objects, overriding any existing IAM policies or ACLs that grant public access. 'INHERITED' means the bucket inherits the PAP setting from its project or organization policy."
  }

  dimension: retention_duration_seconds {
    hidden: yes
    group_label: "Soft-delete"
    label: "Seconds"
    type: number
    sql: ${TABLE}.softDeletePolicy.retentionDurationSeconds ;;
    description: "The period of time in seconds that soft-deleted objects in the bucket will be retained and cannot be permanently deleted. The value must be greater than or equal to 604,800 seconds (7 days) and less than 7,776,000 seconds (90 days)."
  }

  dimension: retention_mode {
    label: "Retention mode"
    type: string
    sql: ${TABLE}.retentionMode ;;
    description: "The retention mode of the bucket's data retention policy. Possible values are 'LOCKED' (policy cannot be reduced/removed) or 'UNLOCKED' (policy can be modified/removed)."
  }

  dimension: retention_period {
    label: "Retention period"
    type: number
    sql: ${TABLE}.retentionPeriod ;;
    description: "The retention period applied to the bucket, in seconds."
  }

  dimension: storage_class {
    label: "Storage class"
    type: string
    sql: ${TABLE}.storageClass ;;
    description: "The default storage tier assigned to new objects in the bucket. Determines the balance between storage costs and retrieval pricing. Common values include 'Standard', 'Nearline', 'Coldline', 'Archive', and 'Rapid' ."
  }

  dimension: uniform_bucket_level_access {
    group_label: "IAM configuration"
    label: "Is uniform bucket level access enabled?"
    type: yesno
    sql: ${TABLE}.iamConfiguration.uniformBucketLevelAccess.enabled ;;
    description: "Indicates whether Uniform Bucket-Level Access is active. When true, the bucket ignores object-level Access Control Lists (ACLs) and relies exclusively on bucket-level IAM policies. This unifies access control and prevents accidental public exposure via ACLs."
  }

  dimension: versioning {
    label: "Is versioned?"
    type: yesno
    sql: ${TABLE}.versioning ;;
    description: "Indicates whether Object Versioning is enabled. When true, the bucket retains a history of object modifications (including overwrites and deletions), allowing for recovery of previous versions."
  }

  dimension: versioning_status {
    label: "Versioning status"
    type: string
    sql:
      CASE
        WHEN ${versioning} THEN 'Enabled'
        ELSE 'Disabled'
      END ;;
    description: "The Object Versioning status of the bucket (Enabled/Disabled). When enabled, a noncurrent history of objects is
    safely retained upon modification or deletion."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_default_encryption {
    label: "Bucket default encryption"
    type: string
    sql:
      CASE
        WHEN ${default_encryption_type} = 'GMEK' THEN 'Google-managed (GMEK)'
        WHEN ${default_encryption_type} = 'CMEK' THEN 'Customer-managed (CMEK)'
        ELSE ${default_encryption_type}
      END ;;
    description: "The default encryption configuration of the bucket. Displays 'Customer-managed (CMEK)' if a default KMS key is configured, or 'Google-managed (GMEK)' if standard Google-owned keys are used. This dictates how new objects are encrypted by default."
  }

  dimension: bucket_level_access_disabled {
    label: "Is bucket level access disabled"
    group_label: "IAM configuration"
    type: yesno
    sql: NOT ${TABLE}.iamConfiguration.uniformBucketLevelAccess.enabled AND NOT ${TABLE}.iamConfiguration.publicAccessPrevention = 'ENFORCED' ;;
    description: "Indicates if the bucket uses legacy access controls. Returns true only if both Uniform Bucket Level Access is disabled (allowing fine-grained ACLs) and Public Access Prevention is not enforced."
  }

  dimension: bucket_retention_configuration {
    label: "Bucket retention configuration"
    type: string
    sql:
      CASE
        WHEN UPPER(${retention_mode}) IN ('LOCKED', 'UNLOCKED') AND ${object_retention_enabled}
          THEN 'Bucket (uniform) & object allowed retentions'
        WHEN UPPER(${retention_mode}) IN ('LOCKED', 'UNLOCKED')
          THEN 'Bucket retention (uniform)'
        WHEN (${retention_mode} IS NULL OR ${retention_mode} = '') AND ${object_retention_enabled}
          THEN 'Object retention allowed (granular)'
        ELSE 'No retention'
      END ;;
    description: "Categorizes the bucket's data retention state by evaluating both bucket-level (uniform) and object-level (granular) retention policies. Outputs identify if retention is applied uniformly at the bucket level, granularly at the object level, both, or neither."
  }

  dimension: retention_duration_days {
    hidden: yes
    group_label: "Soft-delete"
    label: "Days"
    type: number
    sql: ${TABLE}.softDeletePolicy.retentionDurationSeconds / 86400;;
    value_format: "#,##0"
    description: "The Soft-Delete retention period converted to days. Calculated by dividing the retention duration in seconds by 86,400."
  }

  dimension: retention_duration_hours {
    hidden: yes
    group_label: "Soft-delete"
    label: "Hours"
    type: number
    sql: ${TABLE}.softDeletePolicy.retentionDurationSeconds / 3600;;
    value_format: "#,##0"
    description: "The Soft-Delete retention period converted to hours. Calculated by dividing the retention duration in seconds by 3,600."
  }

  dimension: retention_duration_minutes {
    hidden: yes
    group_label: "Soft-delete"
    label: "Minutes"
    type: number
    sql: ${TABLE}.softDeletePolicy.retentionDurationSeconds / 60 ;;
    value_format: "#,##0"
    description: "The Soft-Delete retention period converted to minutes. Calculated by dividing the retention duration in seconds by 60."
  }

  dimension: retention_duration_months {
    hidden: yes
    group_label: "Soft-delete"
    label: "Months"
    type: number
    sql: ${TABLE}.softDeletePolicy.retentionDurationSeconds / 2592000;;
    value_format: "#,##0"
    description: "The Soft-Delete retention period converted to months. Calculated by dividing the retention duration in seconds by 2,592,000 (assuming a standardized 30-day month)."
  }

  dimension: retention_duration_string {
    label: "Retention period (duration)"
    type: string
    order_by_field: retention_period
    sql:
      CASE
        WHEN ${retention_period} IS NULL THEN '-'
        WHEN ${retention_period} = 0 THEN '0 seconds'
        WHEN ${retention_period} = 1 THEN '1 second'
        WHEN ${retention_period} < 60 THEN CONCAT(CAST(${retention_period} AS STRING), ' seconds')
        WHEN ROUND(${retention_period} / 60, 0) = 1 AND ${retention_period} < 3600 THEN '1 minute'
        WHEN ${retention_period} < 3600 THEN CONCAT(CAST(ROUND(${retention_period} / 60, 0) AS STRING), ' minutes')
        WHEN ROUND(${retention_period} / 3600, 0) = 1 AND ${retention_period} < 86400 THEN '1 hour'
        WHEN ${retention_period} < 86400 THEN CONCAT(CAST(ROUND(${retention_period} / 3600, 0) AS STRING), ' hours')
        WHEN ROUND(${retention_period} / 86400, 0) = 1 THEN '1 day'
        ELSE CONCAT(CAST(ROUND(${retention_period} / 86400, 0) AS STRING), ' days')
      END ;;
    description: "The bucket's retention period formatted as a human-readable string (e.g., '1 day', '5 hours')."
  }

  dimension: retention_duration_timeframe_selection {
    group_label: "Soft-delete"
    label: "Retention duration"
    label_from_parameter: retention_duration_timeframe
    type: number
    sql:
      {% if retention_duration_timeframe._parameter_value == "'Seconds'" %}
        ${retention_duration_seconds}
      {% elsif retention_duration_timeframe._parameter_value == "'Minutes'" %}
        ${retention_duration_minutes}
      {% elsif retention_duration_timeframe._parameter_value == "'Hours'" %}
        ${retention_duration_hours}
      {% elsif retention_duration_timeframe._parameter_value == "'Days'" %}
        ${retention_duration_days}
      {% elsif retention_duration_timeframe._parameter_value == "'Weeks'" %}
        ${retention_duration_weeks}
      {% else %}
        NULL
      {% endif %};;
    value_format: "#,##0"
    description: "Dynamically switches the retention duration value based on the unit selected in the 'Retention Duration Timeframe' parameter. Allows users to view the same duration in seconds, minutes, hours, days, weeks, or months."
  }

  dimension: retention_duration_weeks {
    hidden: yes
    group_label: "Soft-delete"
    label: "Weeks"
    type: number
    sql: ${TABLE}.softDeletePolicy.retentionDurationSeconds / 604800;;
    value_format: "#,##0"
    description: "The Soft-Delete retention period converted to weeks. Calculated by dividing the retention duration in seconds by 604,800."
  }

  dimension: soft_delete_enabled {
    group_label: "Soft-delete"
    label: "Is soft-delete policy enabled?"
    type: yesno
    sql: ${TABLE}.softDeletePolicy.retentionDurationSeconds > 0 ;;
    description: "Indicates whether the Soft-Delete policy is active and has a retention period greater than zero. When true, deleted objects are retained for the specified duration, allowing them to be restored before permanent deletion."
  }

  dimension: soft_delete_retention_duration_string {
    group_label: "Soft-delete"
    label: "Retention duration (formatted)"
    type: string
    order_by_field: retention_duration_seconds
    sql:
          CASE
            WHEN ${TABLE}.softDeletePolicy.retentionDurationSeconds IS NULL OR ${TABLE}.softDeletePolicy.retentionDurationSeconds = 0 THEN '0 Seconds'
            WHEN ${TABLE}.softDeletePolicy.retentionDurationSeconds = 1 THEN '1 Second'
            WHEN ${TABLE}.softDeletePolicy.retentionDurationSeconds < 60 THEN CONCAT(CAST(${TABLE}.softDeletePolicy.retentionDurationSeconds AS STRING), ' Seconds')
            WHEN ROUND(${TABLE}.softDeletePolicy.retentionDurationSeconds / 60, 0) = 1 AND ${TABLE}.softDeletePolicy.retentionDurationSeconds < 3600 THEN '1 Minute'
            WHEN ${TABLE}.softDeletePolicy.retentionDurationSeconds < 3600 THEN CONCAT(CAST(ROUND(${TABLE}.softDeletePolicy.retentionDurationSeconds / 60, 0) AS STRING), ' Minutes')
            WHEN ROUND(${TABLE}.softDeletePolicy.retentionDurationSeconds / 3600, 0) = 1 AND ${TABLE}.softDeletePolicy.retentionDurationSeconds < 86400 THEN '1 Hour'
            WHEN ${TABLE}.softDeletePolicy.retentionDurationSeconds < 86400 THEN CONCAT(CAST(ROUND(${TABLE}.softDeletePolicy.retentionDurationSeconds / 3600, 0) AS STRING), ' Hours')
            WHEN ROUND(${TABLE}.softDeletePolicy.retentionDurationSeconds / 86400, 0) = 1 THEN '1 Day'
            ELSE CONCAT(CAST(ROUND(${TABLE}.softDeletePolicy.retentionDurationSeconds / 86400, 0) AS STRING), ' Days')
          END ;;
    description: "The bucket's soft-delete retention duration formatted as a human-readable string. This field is automatically
    sorted chronologically."
  }

  dimension: soft_delete_status {
    group_label: "Soft-delete"
    label: "Soft-delete policy status"
    type: string
    sql:
      CASE
        WHEN ${TABLE}.softDeletePolicy.retentionDurationSeconds IS NOT NULL THEN 'Enabled'
        ELSE 'Disabled'
      END ;;
    description: "The string status of the soft-delete policy (Enabled/Disabled)."
  }

  dimension: uniform_bucket_level_access_status {
    group_label: "IAM configuration"
    label: "Uniform bucket level access status"
    type: string
    sql:
      CASE
        WHEN ${TABLE}.iamConfiguration.uniformBucketLevelAccess.enabled THEN 'Enabled'
        ELSE 'Disabled'
      END ;;
    description: "Identifies whether IAM policies are strictly enforced at the bucket level, overriding individual object-level Access Control Lists (ACLs)."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_size_aid {
    label: "Bucket size (aid)"
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

  dimension: total_row_label {
    label: "Total row label (aid)"
    hidden: yes
    type: string
    sql: 'Total' ;;
    description: "A static label used to force bucket counts into a single row, enabling single-bar stacked horizontal charts."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: autoclass_toggle {
    group_label: "Autoclass toggle time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.autoclass.toggleTime ;;
    description: "The timestamp when the Autoclass configuration was last changed (enabled or disabled). Useful for auditing configuration history and correlating cost changes with feature activation."
  }

  dimension_group: created {
    group_label: "Time created"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeCreated ;;
    description: "The UTC timestamp when the bucket was originally created. This value is immutable and does not change when the bucket configuration is updated."
  }

  dimension_group: effective {
    group_label: "Soft-delete effective time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.softDeletePolicy.effectiveTime ;;
    description: "The earliest time at which the current retention policy, or a policy with a longer retention period, became active."
  }

  dimension_group: snapshot {
    group_label: "Snapshot time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.snapshotTime ;;
    description: "The snapshotTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the point-in-time when the bucket snapshot was captured, effectively grouping bucket snapshots. For the precise time rows were inserted into the table, refer to the Events Explore."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: bucket_count {
    label: "Total buckets"
    type: count_distinct
    value_format: "#,##0"
    drill_fields: [detail*]
    sql: ${bucket_name} ;;
    description: "A measure that counts the total number of buckets within a snapshot."
  }

  measure: context_coverage {
    label: "Context Coverage %"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${object_contexts_catalog__filtered_contexts.total_filtered_objects} / NULLIF(${object_sum}, 0) ;;
    description: "Calculates the percentage of total objects in the bucket that have matching object contexts attached."
  }

  measure: object_sum {
    label: "Total objects"
    type: sum
    value_format: "#,##0"
    sql: ${object_count} ;;
    description: "A measure that sums the total number of objects inside a Bucket within the latest snapshot."
  }

  measure: selected_measure {
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${object_sum}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ object_sum_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ sum_storage_aid._value }}</span>
      {% endif %};;
    description: "Dynamically switches the metric displayed based on the 'Aggregate Function' parameter. Use this to toggle between Total Objects and Total Storage Size within a single visualization."
  }

  measure: total_storage_size {
    label: "Total storage size"
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

  measure: object_sum_aid {
    label: "Total objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${object_sum}) ;;
    description: "Helper measure that formats the total object count as a string with thousands separators (e.g., '1,234,567'). Designed for use in HTML Liquid templates where native Looker value formatting might be bypassed."
  }

  measure: sum_storage_aid {
    label: "Total storage size (aid)"
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

  parameter: retention_duration_timeframe {
    label: "Retention duration timeframe"
    type: string

    allowed_value: {
      label: "Seconds"
      value: "Seconds"
    }

    allowed_value: {
      label: "Minutes"
      value: "Minutes"
    }

    allowed_value: {
      label: "Hours"
      value: "Hours"
    }

    allowed_value: {
      label: "Days"
      value: "Days"
    }

    allowed_value: {
      label: "Weeks"
      value: "Weeks"
    }

    allowed_value: {
      label: "Months"
      value: "Months"
    }

    default_value: "Hours"
    description: "A parameter used to specify the unit of time for the Retention Duration. Valid options are: Seconds, Hours, Days, Weeks, Months. This parameter is only applicable when the 'Retention Duration' dimension is selected."
  }

  parameter: size_unit {
    type: unquoted
    label: "Storage size unit"

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

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measure Parameters -------------------------------
  # --------------------------------------------------------------------------------------------------------

  parameter: aggregate_function {
    label: "Aggregate function"
    type: unquoted
    allowed_value: {
      label: "Total objects"
      value: "total_objects"
    }

    allowed_value: {
      label: "Total storage size"
      value: "total_storage_size"
    }

    default_value: "total_objects"
    description: "This parameter allows users to specify the aggregated function for the 'Selected Measure' field. The default measure for this parameter is Total Objects."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Filters -------------------------------
  # --------------------------------------------------------------------------------------------------------

  filter: filter_context_key {
    label: "Filter: Context Key"
    type: string
    description: "Use this to filter Context Coverage without deleting empty buckets."
  }

  filter: filter_context_value {
    label: "Filter: Context Value"
    type: string
    description: "Use this to filter Context Coverage without deleting empty buckets."
  }





  set: detail {
    fields: [
      snapshot_time,
      bucket_name,
      location,
      project,
      storage_class,
      bucket_policy_only,
      public_access_prevention,
      enabled,
      autoclass_toggle_time,
      versioning,
      lifecycle,
      metageneration,
      created_time,
      effective_time,
      retention_duration_seconds
    ]
  }
}
