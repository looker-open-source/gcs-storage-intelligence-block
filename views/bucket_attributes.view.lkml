#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Apr 30, 2025
# Purpose: Contains information about the Bucket Attributes View Table inside the Storage Intelligence linked Dataset.
#####################################################################
view: bucket_attributes {
  derived_table: {
    datagroup_trigger: gcs_storage_intelligence_datagroup
    sql: WITH
        distinct_snapshots AS (
        SELECT
          DISTINCT snapshotTime
        FROM
          `@{project_id}.@{bigquery_dataset}.object_attributes_view`
        WHERE
          snapshotTime IS NOT NULL
        INTERSECT DISTINCT
        SELECT
          DISTINCT snapshotTime
        FROM
          `@{project_id}.@{bigquery_dataset}.bucket_attributes_view`
        WHERE
          snapshotTime IS NOT NULL), bucket_attributes_latest AS (
        SELECT
          *
        FROM
          `@{project_id}.@{bigquery_dataset}.bucket_attributes_view`
        WHERE
          snapshotTime = (
            SELECT
              MAX(snapshotTime)
            FROM
              distinct_snapshots
          )
      )
      SELECT
        ba.snapshotTime,
        ba.name,
        ba.location,
        ba.project,
        ba.storageClass,
        ba.public.bucketPolicyOnly,
        ba.public.publicAccessPrevention,
        ba.autoclass.enabled,
        ba.autoclass.toggleTime,
        ba.versioning,
        ba.lifecycle,
        ba.metageneration,
        ba.timeCreated,
        ba.softDeletePolicy.effectiveTime,
        ba.softDeletePolicy.retentionDurationSeconds
      FROM
        bucket_attributes_latest AS ba ;;
  }

  ################################### Primary Key #################################

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: GENERATE_UUID();;
    description: "A hidden, system-generated, universally unique identifier (UUID) stored as a string. This field serves as the primary key for each bucket, ensuring unique identification across the system. UUIDs are generated using the GENERATE UUID function."
  }

  ################################## Dimensions ##################################

  dimension: bucket_name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the Google Cloud Storage (GCS) bucket from which data is being sourced."
  }

  dimension: bucket_policy_only {
    group_label: "Public"
    label: "Has Bucket Policy Only Restrictions"
    type: yesno
    sql: ${TABLE}.bucketPolicyOnly ;;
    description: "A boolean value indicating whether the bucket enforces IAM bucket policy only restrictions."
  }

  dimension: enabled {
    group_label: "Autoclass"
    label: "Is Enabled"
    type: yesno
    sql: ${TABLE}.enabled ;;
    description: "The bucket's Autoclass configuration. When enabled, Autoclass automatically manages the storage class of objects based on access patterns."
  }

  dimension: lifecycle {
    label: "Has lifecycle policies"
    type: yesno
    sql: ${TABLE}.lifecycle ;;
    description: "The bucket's lifecycle management status. True signifies that lifecycle rules are active for the bucket, while false signifies they are not."
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
    description: "The region or multi-region location of the source Google Cloud Storage (GCS) bucket."
  }

  dimension: metageneration {
    type: number
    sql: ${TABLE}.metageneration ;;
    description: "The metadata generation of this bucket."
  }

  dimension: project {
    type: string
    sql: CAST(${TABLE}.project AS STRING) ;;
    description: "The Google Cloud project number associated with the project that contains the bucket."
  }

  dimension: public_access_prevention {
    group_label: "Public"
    type: string
    sql: ${TABLE}.publicAccessPrevention ;;
    description: "The bucket's public access prevention status: 'inherited' or 'enforced'."
  }

  dimension: retention_duration_seconds {
    hidden: yes
    group_label: "Soft-Delete"
    label: "Seconds"
    type: number
    sql: ${TABLE}.retentionDurationSeconds ;;
    description: "The period of time in seconds that soft-deleted objects in the bucket will be retained and cannot be permanently deleted. The value must be greater than or equal to 604,800 seconds (7 days) and less than 7,776,000 seconds (90 days)."
  }

  dimension: storage_class {
    type: string
    sql: ${TABLE}.storageClass ;;
    description: "The storage class of this Google Cloud Storage (GCS) bucket, such as Standard, Nearline, Coldline, or Archive."
  }

  dimension: versioning {
    label: "Is Versioned"
    type: yesno
    sql: ${TABLE}.versioning ;;
    description: "The bucket's versioning status. True enables the retention of multiple object versions, while false disables it."
  }

  ############################### Extra Dimensions #############################

  dimension: retention_duration_minutes {
    hidden: yes
    group_label: "Soft-Delete"
    label: "Minutes"
    type: number
    sql: ${TABLE}.retentionDurationSeconds / 60 ;;
    value_format: "#,##0"
    description: "The period of time in minutes that soft-deleted objects in the bucket will be retained and cannot be permanently deleted."
  }

  dimension: retention_duration_hours {
    hidden: yes
    group_label: "Soft-Delete"
    label: "Hours"
    type: number
    sql: ${TABLE}.retentionDurationSeconds / 3600;;
    value_format: "#,##0"
    description: "The period of time in hours that soft-deleted objects in the bucket will be retained and cannot be permanently deleted."
  }

  dimension: retention_duration_days {
    hidden: yes
    group_label: "Soft-Delete"
    label: "Days"
    type: number
    sql: ${TABLE}.retentionDurationSeconds / 86400;;
    value_format: "#,##0"
    description: "The period of time in days that soft-deleted objects in the bucket will be retained and cannot be permanently deleted."
  }

  dimension: retention_duration_weeks {
    hidden: yes
    group_label: "Soft-Delete"
    label: "Weeks"
    type: number
    sql: ${TABLE}.retentionDurationSeconds / 604800;;
    value_format: "#,##0"
    description: "The period of time in weeks that soft-deleted objects in the bucket will be retained and cannot be permanently deleted."
  }

  dimension: retention_duration_months {
    hidden: yes
    group_label: "Soft-Delete"
    label: "Months"
    type: number
    sql: ${TABLE}.retentionDurationSeconds / 2592000;;
    value_format: "#,##0"
    description: "The period of time in months that soft-deleted objects in the bucket will be retained and cannot be permanently deleted."
  }

  dimension: retention_duration_timeframe_selection {
    group_label: "Soft-Delete"
    label: "Retention Duration"
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
        ${retention_duration_months}
      {% elsif retention_duration_timeframe._parameter_value == "'Weeks'" %}
        ${retention_duration_months}
      {% else %}
        NULL
      {% endif %};;
    value_format: "#,##0"
    description: "A dimension used to specify the desired soft-delete retention timeframe. This dimension works alongside the Retention Duration Timeframe Parameter."
  }

  ################################## Dimension Group ##################################

  dimension_group: autoclass_toggle {
    group_label: "Autoclass Toggle Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.toggleTime ;;
    description: "The timestamp of the last Autoclass enablement or disablement for this bucket."
  }

  dimension_group: created {
    group_label: "Time Created"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeCreated ;;
    description: "A timestamp representing the bucket's creation time"
  }

  dimension_group: effective {
    group_label: "Soft-Delete Effective Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.effectiveTime ;;
    description: "The earliest time at which the current retention policy, or a policy with a longer retention period, became active."
  }

  dimension_group: snapshot {
    group_label: "Snapshot Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.snapshotTime ;;
    description: "The snapshotTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the point-in-time when the bucket snapshot was captured, effectively grouping bucket snapshots. For the precise time rows were inserted into the table, refer to the Events Explore."
  }

  ################################## Measures ##################################

  measure: bucket_count {
    label: "Total Buckets"
    type: count
    drill_fields: [detail*]
    description: "A measure that counts the total number of buckets within a snapshot."
  }

  ################################### Parameters ################################

  parameter: retention_duration_timeframe {
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
