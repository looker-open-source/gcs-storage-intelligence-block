#####################################################################
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Apr 30, 2025
# Purpose: Contains information about the Object Attributes View Table inside the Storage Intelligence linked Dataset.
#####################################################################
view: object_attributes {
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
          snapshotTime IS NOT NULL), object_attributes_latest AS (
        SELECT
          *
        FROM
          `@{project_id}.@{bigquery_dataset}.object_attributes_view`
        WHERE
          snapshotTime = (
            SELECT
              MAX(snapshotTime)
            FROM
              distinct_snapshots
          )
      )
      SELECT
        oa.snapshotTime,
        oa.bucket,
        oa.location,
        oa.componentCount,
        oa.contentDisposition,
        oa.contentEncoding,
        oa.contentLanguage,
        oa.contentType,
        oa.crc32c,
        oa.customTime,
        oa.etag,
        oa.eventBasedHold,
        oa.generation,
        oa.md5Hash,
        oa.mediaLink,
        oa.metageneration,
        oa.name,
        oa.selfLink,
        oa.size,
        oa.storageClass,
        oa.temporaryHold,
        oa.timeCreated,
        oa.timeDeleted,
        oa.updated,
        oa.timeStorageClassUpdated,
        oa.retentionExpirationTime,
        oa.softDeleteTime,
        oa.hardDeleteTime
      FROM
        object_attributes_latest AS oa ;;
  }

  ################################### Primary Key #################################

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: GENERATE_UUID();;
    description: "A hidden, system-generated, universally unique identifier (UUID) stored as a string. This field serves as the primary key for each object, ensuring unique identification across the system. UUIDs are generated using the GENERATE UUID function."
  }

  ################################## Dimensions ##################################

  dimension: bucket_name {
    type: string
    sql: ${TABLE}.bucket ;;
    description: "The name of the Google Cloud Storage (GCS) bucket from which data is being sourced."
  }

  dimension: component_count {
    type: number
    sql: ${TABLE}.componentCount ;;
    description: "The total count of non-composite objects that contributed to the current composite object."
  }

  dimension: content_disposition {
    type: string
    sql: ${TABLE}.contentDisposition ;;
    description: "The Content-Disposition header of the object."
  }

  dimension: content_encoding {
    type: string
    sql: ${TABLE}.contentEncoding ;;
    description: "The Content-Encoding header of the object."
  }

  dimension: content_language {
    type: string
    sql: ${TABLE}.contentLanguage ;;
    description: "The Content-Language header of the object."
  }

  dimension: content_type {
    group_label: "Content Type"
    type: string
    sql: ${TABLE}.contentType ;;
    description: "The Content-Type header of the object. Objects without a specified Content-Type are served as application/octet-stream."
  }

  dimension: crc32c {
    type: number
    sql: ${TABLE}.crc32c ;;
    description: "CRC32c checksum (RFC 4960, Appendix B), base64-encoded in big-endian byte order."
  }

  dimension: etag {
    label: "Entity Tag"
    type: string
    sql: ${TABLE}.etag ;;
    description: "The HTTP 1.1 Entity tag (ETag) for the object, a unique identifier used for cache validation and conditional requests."
  }

  dimension: event_based_hold {
    label: "Has Event Based Hold policies"
    type: yesno
    sql: ${TABLE}.eventBasedHold ;;
    description: "A boolean value indicating if the object is currently under an event-based hold."
  }

  dimension: generation {
    type: string
    sql: CAST(${TABLE}.generation AS STRING) ;;
    description: "A unique identifier for each object's version, present regardless of the bucket's versioning configuration."
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
    description: "The region or multi-region location of the source Google Cloud Storage (GCS) object."
  }

  dimension: md5_hash {
    type: string
    sql: ${TABLE}.md5Hash ;;
    description: "The base64-encoded MD5 hash of the object's data. This field is omitted for composite objects."
  }

  dimension: media_link {
    type: string
    sql: ${TABLE}.mediaLink ;;
    description: "A URL that provides direct download access to the object's data."
  }

  dimension: metageneration {
    type: number
    sql: CAST(${TABLE}.metageneration AS STRING) ;;
    description: "The metadata version (metageneration) for this object's current generation. It is used for preconditions and metadata change detection, and is specific to the object's generation."
  }

  dimension: object_name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the Google Cloud Storage (GCS) object from which data is being sourced."
  }

  dimension: self_link {
    type: string
    sql: ${TABLE}.selfLink ;;
  }

  dimension: size {
    type: number
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.size / (1125899906842624)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.size / (1099511627776)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.size / (1073741824)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.size / (1048576)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.size / (1024)
      {% else %}
        ${TABLE}.size
      {% endif %};;
    html:
      <span>{{ size_aid._value }}</span> ;;
    description: "This dimension shows the object's size, automatically using the best unit (KiB, MiB, etc.) in Looker. For CSV or Sheets downloads, select your preferred unit with the 'Size Unit' parameter."
  }

  dimension: storage_class {
    type: string
    sql: ${TABLE}.storageClass ;;
    description: "The storage class of this Google Cloud Storage (GCS) bucket, such as Standard, Nearline, Coldline, or Archive."
  }

  dimension: temporary_hold {
    label: "Has Temporary Hold Policies"
    type: yesno
    sql: ${TABLE}.temporaryHold ;;
    description: "A boolean value indicating if the object is currently under an temporary hold."

  }

  ############################### Extra Dimensions #############################

  dimension: content_type_prefix {
    group_label: "Content Type"
    type: string
    sql: REGEXP_EXTRACT(${TABLE}.contentType, r'^([^\\/]*)/[^\\/]*') ;;
    description: "The primary media type, also known as the main type, in a Content-Type header. It provides a high-level classification of the data, enabling applications to understand the general format of the content. (e.g., text, image, audio, video, application)."
  }

  dimension: content_type_suffix {
    group_label: "Content Type"
    label: "Content Type Suffix"
    type: string
    sql: UPPER(REGEXP_EXTRACT(${TABLE}.contentType,r'^[^\\/]*/([^\\/]*)')) ;;
    description: "The subtype in a Content-Type header specifies a more detailed format within the main type's category, providing finer-grained information about the data's structure and encoding."
  }

  dimension: days_until_expiration{
    label: "Days until expiration"
    type: number
    sql:
      CASE
        WHEN DATE_DIFF(DATE(${TABLE}.retentionExpirationTime), DATE(CURRENT_DATE()), DAY) > 0
          THEN DATE_DIFF(DATE(${TABLE}.retentionExpirationTime), DATE(CURRENT_DATE()), DAY)
        WHEN DATE_DIFF(DATE(${TABLE}.retentionExpirationTime), DATE(CURRENT_DATE()), DAY) <= 0
        THEN 0
      END;;
    description: "This dimension presents the number of days until the object reaches its minimum retention expiration, allowing for deletion."
  }

  dimension: days_until_hard_deletion {
    label: "Days until hard deletion"
    type: number
    sql:
      CASE
        WHEN DATE_DIFF(DATE(${TABLE}.hardDeleteTime), DATE(CURRENT_DATE()), DAY) > 0
          THEN DATE_DIFF(DATE(${TABLE}.hardDeleteTime), DATE(CURRENT_DATE()), DAY)
        WHEN DATE_DIFF(DATE(${TABLE}.hardDeleteTime), DATE(CURRENT_DATE()), DAY) <= 0
        THEN 0
      END;;
    description: "This numerical dimension displays the remaining days until soft-deleted objects are permanently removed."
  }

  dimension: file_extension {
    label: "File extension"
    type: string
    sql: UPPER(REGEXP_EXTRACT(${TABLE}.name, r'([^.]+)$')) ;;
    description: "This field provides the object's file extension, which is the suffix of the file name appearing after the final period."
  }

  dimension: folder {
    type: string
    sql: COALESCE(REGEXP_EXTRACT(${TABLE}.name,r'^([^\/]*\/).*'), '-') ;;
    description: "Indicates if the object resides within a directory structure. The folder represents the object's immediate parent directory."
  }

  dimension: inside_a_folder {
    label: "Is object inside a folder"
    type: yesno
    sql:  IF(${folder} = '-', FALSE, TRUE);;
    description: "A boolean flag denoting the object's presence within a directory hierarchy."
  }

  dimension: live_objects {
    label: "Is object Live"
    hidden: no
    type: yesno
    sql: ${object_status} = 'Live' ;;
    description: "A boolean flag denoting if the object is live."
  }

  dimension: object_size_unit {
    label: "Object size unit"
    type: string
    sql:
      CASE
        WHEN ${TABLE}.size > 1125899906842624 THEN "PiB"
        WHEN ${TABLE}.size  > 1099511627776 THEN "TiB"
        WHEN ${TABLE}.size > 1073741824 THEN "GiB"
        WHEN ${TABLE}.size  > 1048576 THEN "MiB"
        WHEN ${TABLE}.size  > 1024 THEN " KiB"
        WHEN ${TABLE}.size  <= 1024 THEN "B"
      END;;
    description: "The byte-based unit of measure for the object's storage size, such as B, KiB, MiB, etc."
  }

  dimension: object_status {
    type: string
    sql:
      CASE
        WHEN ${deleted_time} IS NOT NULL AND ${soft_delete_time} IS NULL
          THEN 'Noncurrent'
        WHEN ${deleted_time} IS NOT NULL AND ${soft_delete_time} IS NOT NULL
          THEN 'Soft-deleted'
        ELSE
          'Live'
      END;;
    description: "The current operational status of the object is represented in this field. Possible values include 'Noncurrent' for objects in a versioned state, 'Soft-deleted' for objects under a Soft-Delete policy, and 'Live' for objects with no deletion history."
  }

  dimension: prefix {
    label: "Object Prefix"
    type: string
    sql:
      COALESCE(
        {% if prefix_depth._parameter_value == "First" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^([^\/]*\/).*')
        {% elsif prefix_depth._parameter_value == "Second" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^([^\/]*\/[^\/]*\/).*')
        {% elsif prefix_depth._parameter_value == "Third" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^([^\/]*\/[^\/]*\/[^\/]*\/).*')
        {% else %}
          REGEXP_EXTRACT(${TABLE}.name, r'^(.*\/)[^\/]+$')
        {% endif %}
      , "-");;
    description: "The Object Prefix dimension displays folder paths up to a specified depth, allowing users to analyze data at desired folder levels. For example, selecting a Prefix Depth of 'Second' shows paths like '/sub-folder1/sub-folder2/'."
  }

  dimension: soft_deleted_objects {
    label: "Is object Soft-deleted"
    hidden: no
    type: yesno
    sql: ${object_status} = 'Soft-deleted' ;;
    description: "A boolean flag denoting if the object is in a Soft-deleted state."
  }

  ############################### Aid Dimensions ###############################

  dimension: size_aid {
    hidden: no
    type: string
    sql:
      CASE
        WHEN ${TABLE}.size > 1125899906842624 THEN CONCAT(round(${TABLE}.size / 1125899906842624, 2), " PiB")
        WHEN ${TABLE}.size > 1099511627776 THEN CONCAT(round(${TABLE}.size / 1099511627776, 2), " TiB")
        WHEN ${TABLE}.size > 1073741824 THEN CONCAT(round(${TABLE}.size / 1073741824,1), " GiB")
        WHEN ${TABLE}.size > 1048576 THEN CONCAT(round(${TABLE}.size / 1048576, 0), " MiB")
        WHEN ${TABLE}.size > 1024 THEN CONCAT(round(${TABLE}.size / 1024, 0), " KiB")
        WHEN ${TABLE}.size <= 1024 THEN CONCAT(${TABLE}.size," B")
      END;;
    description: "This hidden dimension supports the size dimension by providing the object's size in the most appropriate unit. The value is displayed through an html parameter."
  }

  ################################## Dimension Group ##################################

  dimension_group: created {
    group_label: "Time Created"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeCreated ;;
    description: "A timestamp representing the object's creation time"
  }

  dimension_group: custom {
    group_label: "Custom Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.customTime ;;
    description: "This field allows users to set a custom timestamp for the object. Once assigned, this timestamp cannot be removed or modified to an earlier date and time."
  }

  dimension_group: deleted {
    group_label: "Time Deleted"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeDeleted ;;
    description: "The timestamp when the object was deleted. Present for non-current or soft-deleted objects."
  }

  dimension_group: hard_delete {
    group_label: "Hard Delete Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.hardDeleteTime ;;
    description: "This field denotes the future timestamp at which the object's restorability will expire, calculated as the soft deletion timestamp plus the bucket's soft delete retention duration."
  }

  dimension_group: retention_expiration {
    group_label: "Retention Expiration Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.retentionExpirationTime ;;
    description: "The earliest permissible deletion time for this object, determined by applicable object and bucket retention policies."
  }

  dimension_group: snapshot {
    group_label: "Snapshot Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.snapshotTime ;;
    description: "The snapshotTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the point-in-time when the object snapshot was captured, effectively grouping object snapshots. For the precise time rows were inserted into the table, refer to the Events Explore."
  }

  dimension_group: soft_delete {
    group_label: "Soft Delete Time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.softDeleteTime ;;
    description: "This field indicates the timestamp of the object's soft deletion."
  }

  dimension_group: storage_class_updated {
    group_label: "Time Storage Class Updated"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeStorageClassUpdated ;;
    description: "The time of the object's Storage Class most recent update."
  }

  dimension_group: updated {
    group_label: "Updated"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated ;;
    description: "The time of the object's most recent update, shown in date/time format. This reflects all changes to the object's settings/metadata."
  }

  ################################## Measures ##################################

  measure: average_storage_size {
    type: average
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.size / (1125899906842624)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.size / (1099511627776)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.size / (1073741824)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.size / (1048576)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.size / (1024)
      {% else %}
        ${TABLE}.size
      {% endif %};;
    html: <span>{{ avg_storage_aid._value }}</span> ;;
    description: "A measure that display the storage size average for all the objects, automatically using the best unit (KiB, MiB, etc.) in Looker. For CSV or Sheets downloads, select your preferred unit with the 'Size Unit' parameter."
  }

  measure: bucket_count {
    label: "Total buckets"
    type: count_distinct
    sql: ${bucket_name} ;;
    description: "This measure calculates the count of unique buckets within the object's snapshot."
  }

  measure: object_count {
    label: "Total objects"
    value_format: "#,##0"
    type: count
    drill_fields: [detail*]
    description: "A measure that counts the total number of objects within a snapshot."
  }

  measure: selected_measure {
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${object_count}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_storage_size}
      {% elsif aggregate_function._parameter_value == "average_storage_size" %}
        ${average_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ object_count_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ sum_storage_aid._value }}</span>
      {% elsif aggregate_function._parameter_value == "average_storage_size" %}
        <span>{{ avg_storage_aid._value }}</span>
      {% endif %};;
    description: "This measure allows users to select the displayed aggregation: Total Objects, Total Storage Size, or Average Object Size. The selected function is determined by the 'Aggregate Function' parameter."

  }

  measure: total_storage_size {
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.size / (1125899906842624)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.size / (1099511627776)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.size / (1073741824)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.size / (1048576)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.size / (1024)
      {% else %}
        ${TABLE}.size
      {% endif %};;
    html: <span>{{ sum_storage_aid._value }}</span> ;;
    description: "A measure that display the storage size sum for all the objects, automatically using the best unit (KiB, MiB, etc.) in Looker. For CSV or Sheets downloads, select your preferred unit with the 'Size Unit' parameter."
  }

  ################################ Aid Measures ################################

  measure: avg_storage_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN AVG(${TABLE}.size) > 1152921504606846976 THEN CONCAT(round(AVG(${TABLE}.size) / 1152921504606846976, 2), " EiB")
        WHEN AVG(${TABLE}.size) > 1125899906842624 THEN CONCAT(round(AVG(${TABLE}.size) / 1125899906842624, 2), " PiB")
        WHEN AVG(${TABLE}.size) > 1099511627776 THEN CONCAT(round(AVG(${TABLE}.size) / 1099511627776, 2), " TiB")
        WHEN AVG(${TABLE}.size) > 1073741824 THEN CONCAT(round(AVG(${TABLE}.size) / 1073741824,1), " GiB")
        WHEN AVG(${TABLE}.size) > 1048576 THEN CONCAT(round(AVG(${TABLE}.size) / 1048576, 0), " MiB")
        WHEN AVG(${TABLE}.size) > 1024 THEN CONCAT(round(AVG(${TABLE}.size) / 1024, 0), " KiB")
      END;;
    description: "This hidden measure supports the 'Average Storage Size' measure by aggregating and formatting the size in the optimal unit. The result is presented via an html parameter."
  }

  measure: object_count_aid {
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${object_count}) ;;
    description: "This hidden measure facilitates the formatting of object count values, inserting thousands separators to enhance numerical readability (e.g., 1,234,567)."
  }

  measure: sum_storage_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(${TABLE}.size) > 1152921504606846976 THEN CONCAT(round(SUM(${TABLE}.size) / 1152921504606846976, 2), " EiB")
        WHEN SUM(${TABLE}.size) > 1125899906842624 THEN CONCAT(round(SUM(${TABLE}.size) / 1125899906842624, 2), " PiB")
        WHEN SUM(${TABLE}.size) > 1099511627776 THEN CONCAT(round(SUM(${TABLE}.size) / 1099511627776, 2), " TiB")
        WHEN SUM(${TABLE}.size) > 1073741824 THEN CONCAT(round(SUM(${TABLE}.size) / 1073741824,1), " GiB")
        WHEN SUM(${TABLE}.size) > 1048576 THEN CONCAT(round(SUM(${TABLE}.size) / 1048576, 0), " MiB")
        WHEN SUM(${TABLE}.size) > 1024 THEN CONCAT(round(SUM(${TABLE}.size) / 1024, 0), " KiB")
      END;;
    description: "This hidden measure supports the 'Total Storage Size' measure by aggregating and formatting the size in the optimal unit. The result is presented via an html parameter."
  }

  ################################### Parameters ################################

  parameter: prefix_depth {

    type: unquoted

    allowed_value: {
      label: "First"
      value: "First"
    }

    allowed_value: {
      label: "Second"
      value: "Second"
    }

    allowed_value: {
      label: "Third"
      value: "Third"
    }

    allowed_value: {
      label: "Full"
      value: "Full"
    }

    default_value: "Full"
    description: "This parameter allows users to specify the prefix depth for the prefix dimension. The default value, 'Full', displays the complete prefix for objects within a directory hierarchy."
  }

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

  ################################ Measure Parameters ##########################

  parameter: aggregate_function {
    type: unquoted
    allowed_value: {
      label: "Total Objects"
      value: "total_objects"
    }

    allowed_value: {
      label: "Total Storage Size"
      value: "total_storage_size"
    }

    allowed_value: {
      label: "Average Storage Size"
      value: "average_storage_size"
    }

    default_value: "total_storage_size"
    description: "This parameter allows users to specify the aggregated function for the 'Selected Measure' field. The default measure for this parameter is Total Storage Size."
  }

  #################################### Set ####################################

  set: detail {
    fields: [
      snapshot_time,
      bucket_name,
      location,
      component_count,
      content_disposition,
      content_encoding,
      content_language,
      content_type,
      crc32c,
      custom_time,
      etag,
      event_based_hold,
      generation,
      md5_hash,
      media_link,
      metageneration,
      object_name,
      self_link,
      size,
      storage_class,
      temporary_hold,
      created_time,
      deleted_time,
      updated_time,
      storage_class_updated_time,
      retention_expiration_time,
      soft_delete_time,
      hard_delete_time
    ]
  }
}
