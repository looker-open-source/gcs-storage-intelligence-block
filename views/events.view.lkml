# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Feb 12, 2026
# Purpose: Contains information about the Events View inside the Storage Intelligence linked Dataset.
# --------------------------------------------------------------------------

view: events {

  sql_table_name: `@{PROJECT_ID}.@{BIGQUERY_DATASET}.events_view` ;;

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: GENERATE_UUID();;
    description: "A hidden, system-generated, universally unique identifier (UUID) stored as a string. This field serves as the primary key for each event, ensuring unique identification across the system. UUIDs are generated using the GENERATE UUID function."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: activity_location {
    type: string
    sql: ${TABLE}.activityJournal.location ;;
    group_label: "Activity Journal"
    group_item_label: "Location"
    description: "The region or multi-region location of the source Google Cloud Storage (GCS). This field only applies for Activity tables."
  }

  dimension: event_code {
    type: number
    sql: ${TABLE}.eventCode ;;
    description: "A unique code identifying each distinct event type. 1: Regional bucket/object attributes; 2: All-region attribute tables; 3: Regional activity tables."
  }

  dimension: location {
    type: string
    sql: ${TABLE}.manifest.location ;;
    group_label: "Manifest"
    group_item_label: "Location"
    description: "The region or multi-region location of the source Google Cloud Storage (GCS) bucket or object. This field only applies for Metadata tables."
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.manifest.viewName ;;
    group_label: "Manifest"
    group_item_label: "View Name"
    description: "The type of table from which this data was derived. This field only applies for Metadata tables."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: activity_journal_window_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.activityJournal.windowEndTime ;;
    description: "The windowEndTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the point-in-time when the regional activity data finalized capturing requests on a project, bucket or object level. This is an hourly-based log."
  }

  dimension_group: activity_journal_window_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.activityJournal.windowStartTime ;;
    description: "The windowStartTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the point-in-time when the regional activity data started capturing requests on a project, bucket or object level. This is an hourly-based log."
  }

  dimension_group: event {
    group_label: "Event Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day]
    sql: ${TABLE}.eventTime ;;
    description: "The eventTime field in the GCS Storage Intelligence table is a timestamp in RFC 3339 format. It represents the point-in-time when the event was completed. This field applies for both: metadata and Activity tables."
  }

  dimension_group: global_manifest_snapshot {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.globalManifest.snapshotTime ;;
    description: "The global manifest snapshotTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the specific date used to group the daily snapshots of the Bucket or Object metadata tables. This field is only available when the eventCode is 2, which indicates that all metadata tables were injected for each available region."
  }

  dimension_group: manifest_snapshot {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.manifest.snapshotTime ;;
    description: "The global manifest snapshotTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the specific date used to group the daily snapshots of the Bucket or Object metadata tables."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: code_label {
    type: string
    group_label: "General"
    group_item_label: "Code Label"
    sql:
      CASE
        WHEN ${TABLE}.eventCode = 1 THEN 'Metadata Single Region - Event'
        WHEN ${TABLE}.eventCode = 2 THEN 'Metadata Full Regions - Injection Completion'
        WHEN ${TABLE}.eventCode = 3 THEN 'Activity Single Region - Event'
      END;;
    description: "A descriptive label for the GCS Storage Intelligence eventCode. Use this auxiliary field to understand the meaning of the numeric event codes."
  }

  dimension: general_location {
    type: string
    group_label: "General"
    group_item_label: "Location"
    sql:
      CASE
        WHEN ${TABLE}.manifest.location IS NOT NULL THEN ${TABLE}.manifest.location
        WHEN ${TABLE}.activityJournal.location IS NOT NULL THEN ${TABLE}.activityJournal.location
      END;;
    description: "Combines manifest.location and activityJournal.location into a single auxiliary field for grouping. This applies only to events with codes 1 and 2."
  }

  dimension: general_view_name {
    type: string
    group_label: "General"
    group_item_label: "View Name"
    sql:
      CASE
        WHEN ${TABLE}.manifest.location IS NOT NULL THEN ${TABLE}.manifest.viewName
        WHEN ${TABLE}.activityJournal.location IS NOT NULL THEN 'Activity Views'
      END;;
    description: "Categorizes the data source. Displays the specific Metadata view name for inventory records, or 'Activity View' for operational logs (Bucket, Project, or Object Activity). Use this to distinguish between configuration snapshots and usage traffic."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------


  dimension_group: general_display {
    group_label: "General Display Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql:
      CASE
        WHEN ${TABLE}.manifest.snapshotTime IS NOT NULL THEN ${TABLE}.manifest.snapshotTime
        WHEN ${TABLE}.activityJournal.windowStartTime IS NOT NULL THEN ${TABLE}.activityJournal.windowStartTime
      END;;
    description: "An auxiliary field to group two timestamp fields: manifest.SnapshotTime and activityJournal.windowStartTime. This field applies only to events with codes 1 and 2."
  }

  dimension: general_display_time_date_hour {
    group_label: "General Display Time"
    label: "Date and Hour"
    type: date_time
    sql: TIMESTAMP_TRUNC(${general_display_raw}, HOUR) ;;
    html: {{ value | date: "%Y-%m-%d %H:00" }} ;;
    description: "An auxiliary field to group two timestamp fields: manifest.SnapshotTime and activityJournal.windowStartTime. This field applies only to events with codes 1 and 2."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_events {
    type: count
    description: "A measure that counts the total number of events."
  }

  measure: total_single_region_activity_events {
    type: number
    sql: COUNTIF(${event_code} = 3) ;;
    description: "The total count of activity events specific to a single region."
  }

  measure: total_single_region_events {
    type: number
    sql: COUNTIF(${event_code} IN (1, 3));;
    description: "The total count of events specific to a single region. This measure excludes global full-region injection events."
  }

  measure: total_single_region_metadata_events {
    type: number
    sql: COUNTIF(${event_code} = 1) ;;
    description: "The total count of metadata events specific to a single region."
  }

  measure: total_snaphsots {
    type: count_distinct
    sql: ${manifest_snapshot_time} ;;
    description: "A measure that counts all the distinct snapshots."
  }

}