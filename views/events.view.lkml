#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Purpose: Contains information about the Events View inside the Storage Intelligence linked Dataset.
#####################################################################
view: events {
  sql_table_name: `@{bigquery_dataset}.events_view` ;;

  ################################### Primary Key #################################

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: GENERATE_UUID();;
    description: "A hidden, system-generated, universally unique identifier (UUID) stored as a string. This field serves as the primary key for each event, ensuring unique identification across the system. UUIDs are generated using the GENERATE UUID function."
  }

  ################################## Dimensions ##################################

  dimension: event_code {
    type: string
    sql: ${TABLE}.eventCode ;;
    description: "A unique code identifying each distinct event type."
  }

  dimension: location {
    type: string
    sql: ${TABLE}.manifest.location ;;
    group_label: "Manifest"
    group_item_label: "Location"
    description: "The region or multi-region location of the source Google Cloud Storage (GCS) bucket or object."
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.manifest.viewName ;;
    group_label: "Manifest"
    group_item_label: "View Name"
    description: "The type of table from which this data was derived."
  }

  ################################## Dimension Group ##################################

  dimension_group: event {
    group_label: "Event Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day]
    sql: ${TABLE}.eventTime ;;
    description: "The timestamp indicating when the event was completed."
  }

  dimension_group: manifest_snapshot {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.manifest.snapshotTime ;;
    description: "The snapshotTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the point-in-time when the bucket/object snapshot was captured, effectively grouping bucket/object snapshots. For the precise time rows were inserted into the table, refer to the Event Time dimension."
  }

  ################################## Measures ##################################

  measure: count {
    type: count
    description: "A measure that counts the total number of events."
  }

  measure: total_snaphsots {
    type: count_distinct
    sql: ${manifest_snapshot_time} ;;
    description: "A measure that counts all the distinct snapshots."
  }

  measure: total_events {
    type: count_distinct
    sql: ${event_time} ;;
    description: "A measure that counts the total number of events based on the even time's completion."
  }
}
