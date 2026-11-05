# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Nov 4, 2026
# Purpose: Contains information about the Object Attributes View Table inside the Storage Intelligence linked Dataset.
# --------------------------------------------------------------------------
view: object_attributes {

  sql_table_name: `@{PROJECT_ID}.@{BIGQUERY_DATASET}.object_attributes_latest_snapshot_view` ;;

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
        CAST(${TABLE}.generation AS STRING), '_',
        ${TABLE}.name, '_',
        ${TABLE}.location, '_',
        CAST(${TABLE}.project AS STRING), '_',
        CAST(${TABLE}.timeCreated AS STRING)
      ) ;;
    description: "A hidden, composite primary key used to uniquely identify records. It is constructed by concatenating the snapshot time, generation, name, location, project, and time created."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_name {
    label: "Bucket name"
    type: string
    sql: ${TABLE}.bucket ;;
    description: "The unique name of the Google Cloud Storage (GCS) bucket where the object resides."
  }

  dimension: component_count {
    label: "Component count"
    type: number
    sql: ${TABLE}.componentCount ;;
    description: "The total count of non-composite objects that contributed to the current composite object."
  }

  dimension: content_disposition {
    label: "Content disposition"
    type: string
    sql: ${TABLE}.contentDisposition ;;
    description: "The Content-Disposition header of the object."
  }

  dimension: content_encoding {
    label: "Content encoding"
    type: string
    sql: ${TABLE}.contentEncoding ;;
    description: "The Content-Encoding header of the object."
  }

  dimension: content_language {
    label: "Content language"
    type: string
    sql: ${TABLE}.contentLanguage ;;
    description: "The Content-Language header of the object."
  }

  dimension: content_type {
    group_label: "Content type"
    type: string
    sql: ${TABLE}.contentType ;;
    description: "The Content-Type header of the object. Objects without a specified Content-Type are served as application/octet-stream."
  }

  dimension: crc32c {
    label: "CRC32C"
    type: number
    sql: ${TABLE}.crc32c ;;
    description: "CRC32c checksum (RFC 4960, Appendix B), base64-encoded in big-endian byte order."
  }

  dimension: encryption_type {
    label: "Encryption type (default)"
    type: string
    hidden: yes
    sql: ${TABLE}.encryptionType ;;
    description: "The raw encryption type code applied to the object (GMEK, CMEK, or CSEK)."
  }

  dimension: etag {
    label: "Entity tag"
    type: string
    sql: ${TABLE}.etag ;;
    description: "The HTTP 1.1 Entity tag (ETag) for the object, a unique identifier used for cache validation and conditional requests."
  }

  dimension: event_based_hold {
    label: "Has event based hold policies?"
    type: yesno
    sql: ${TABLE}.eventBasedHold ;;
    description: "A boolean value indicating if the object is currently under an event-based hold."
  }

  dimension: generation {
    label: "Generation"
    type: string
    sql: CAST(${TABLE}.generation AS STRING) ;;
    description: "A unique identifier for each object's version, present regardless of the bucket's versioning configuration."
  }

  dimension: location {
    label: "Location"
    type: string
    sql: ${TABLE}.location ;;
    description: "The region or multi-region location of the source Google Cloud Storage (GCS) object."
  }

  dimension: md5_hash {
    label: "MD5 hash"
    type: string
    sql: ${TABLE}.md5Hash ;;
    description: "The base64-encoded MD5 hash of the object's data. This field is omitted for composite objects."
  }

  dimension: media_link {
    label: "Media link"
    type: string
    sql: ${TABLE}.mediaLink ;;
    description: "A clickable URL that provides direct download access to the object's data."
    link: {
      label: "Go to link"
      url: "{{ value }}"
    }
  }

  dimension: metageneration {
    label: "Metageneration"
    type: number
    sql: CAST(${TABLE}.metageneration AS STRING) ;;
    description: "The metadata version (metageneration) for this object's current generation. It is used for preconditions and metadata change detection, and is specific to the object's generation."
  }

  dimension: object_age {
    label: "Object age (days)"
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), DATE(${TABLE}.timeCreated), DAY) ;;
    description: "The date difference between the current date and the object's created date in days."
  }

  dimension: object_name {
    label: "Object name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the Google Cloud Storage (GCS) object from which data is being sourced."
  }

  dimension: project {
    label: "Project number"
    type: string
    sql: CAST(${TABLE}.project AS STRING) ;;
    description: "The Google Cloud project number associated with the project that contains the bucket."
  }

  dimension: read_public_access {
    label: "Read public access"
    type: string
    sql: ${TABLE}.securityInsights.publicAccessInsight.readPublicAccess ;;
    description: "The public readability status of the object."
  }

  dimension: retain_until_time_lock_status {
    label: "Retain until time lock status"
    type: string
    sql: ${TABLE}.retainUntilTimeLockStatus ;;
    description: "The lock status of the object's retention period ('LOCKED' or 'UNLOCKED'). When locked, the object cannot be deleted or replaced, and the retention period cannot be shortened until the retain-until time has passed."
  }


  dimension: self_link {
    label: "Self link"
    type: string
    sql: ${TABLE}.selfLink ;;
    description: "A clickable URL linking directly to this specific object in the source system."
    link: {
      label: "Go to link"
      url: "{{ value }}"
    }
  }

  dimension: size {
    label: "Object size"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.size / POW(1024, 5)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.size / POW(1024, 4)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.size / POW(1024, 3)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.size / POW(1024, 2)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.size / 1024
      {% else %}
        ${TABLE}.size
      {% endif %};;
    html:
      <span>{{ size_aid._value }}</span> ;;
    description: "This dimension shows the object's size, automatically using the best unit (KiB, MiB, etc.) in Looker. For CSV or Sheets downloads, select your preferred unit with the 'Size Unit' parameter."
  }

  dimension: storage_class {
    label: "Storage class"
    type: string
    sql: ${TABLE}.storageClass ;;
    description: "The storage class of a Google Cloud Storage (GCS) object. It can be Standard, Nearline, Coldline, Archive or Rapid."
  }

  dimension: temporary_hold {
    label: "Has temporary hold policies?"
    type: yesno
    sql: ${TABLE}.temporaryHold ;;
    description: "A boolean value indicating if the object is currently under a temporary hold."
  }

  dimension: write_public_access {
    label: "Write public access"
    type: string
    sql: ${TABLE}.securityInsights.publicAccessInsight.writePublicAccess ;;
    description: "Indicates the public writability status of an object."
  }


  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: content_type_prefix {
    group_label: "Content type"
    type: string
    sql: REGEXP_EXTRACT(${TABLE}.contentType, r'^([^\\/]*)/[^\\/]*') ;;
    description: "The primary media type, also known as the main type, in a Content-Type header. It provides a high-level classification of the data, enabling applications to understand the general format of the content. (e.g., text, image, audio, video, application)."
  }

  dimension: content_type_suffix {
    group_label: "Content type"
    label: "Content type suffix"
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
    label: "Folder"
    type: string
    sql: COALESCE(REGEXP_EXTRACT(${TABLE}.name,r'^([^\/]*\/).*'), '-') ;;
    description: "Indicates if the object resides within a directory structure. The folder represents the object's immediate parent directory."
  }

  dimension: has_no_retention {
    label: "Has no retention expiration?"
    type: yesno
    hidden: yes
    sql: ${TABLE}.retentionExpirationTime IS NULL ;;
    description: "Indicates whether the object lacks a retention expiration time (meaning no retention policy applies to it)."
  }

  dimension: inside_a_folder {
    label: "Is object inside a folder?"
    type: yesno
    sql:  IF(${folder} = '-', FALSE, TRUE);;
    description: "A boolean flag denoting the object's presence within a directory hierarchy."
  }

  dimension: is_retention_active {
    label: "Is retention active?"
    type: yesno
    hidden: yes
    sql: ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() ;;
    description: "Indicates whether the object's retention period is currently active (expiration time is in the future)."
  }

  dimension: is_retention_expired {
    label: "Is retention expired?"
    type: yesno
    hidden: yes
    sql: ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() ;;
    description: "Indicates whether the object's retention period has passed (expiration time is in the past)."
  }

  dimension: live_objects {
    label: "Is object Live?"
    hidden: no
    type: yesno
    sql: ${object_status} = 'Live' ;;
    description: "A boolean flag denoting if the object is live."
  }

  dimension: object_encryption_type_formatted {
    label: "Encryption type"
    type: string
    sql:
          CASE
            WHEN ${encryption_type} = 'GMEK' THEN 'Google-managed (GMEK)'
            WHEN ${encryption_type} = 'CMEK' THEN 'Customer-managed (CMEK)'
            WHEN ${encryption_type} = 'CSEK' THEN 'Customer-supplied (CSEK)'
            ELSE ${encryption_type}
          END ;;
    description: "The type of encryption applied to the object (Google-managed, Customer-managed, or Customer-supplied)."
  }

  dimension: object_retention_profile {
    label: "Object retention profile"
    type: string
    sql:
          CASE
            WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN 'Active retention'
            WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN 'Retention expired'
            ELSE 'No retention'
          END ;;
    description: "The retention profile of the object based on its retention expiration time. Returns 'Active retention' if the expiration is in the future, 'Retention expired' if in the past, or 'No retention' if no retention policy is applied."
  }

  dimension: object_size_unit {
    label: "Object size unit"
    type: string
    sql:
      CASE
        WHEN ${TABLE}.size >= POW(1024, 5) THEN "PiB"
        WHEN ${TABLE}.size >= POW(1024, 4) THEN "TiB"
        WHEN ${TABLE}.size >= POW(1024, 3) THEN "GiB"
        WHEN ${TABLE}.size >= POW(1024, 2) THEN "MiB"
        WHEN ${TABLE}.size >= 1024 THEN " KiB"
        ELSE "B"
      END;;
    description: "The byte-based unit of measure for the object's storage size, such as B, KiB, MiB, etc."
  }

  dimension: object_status {
    label: "Object status"
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
    label: "Object prefix"
    type: string
    sql:
      COALESCE(
        {% if prefix_depth._parameter_value == "1" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){1})')
        {% elsif prefix_depth._parameter_value == "2" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){2})')
        {% elsif prefix_depth._parameter_value == "3" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){3})')
        {% elsif prefix_depth._parameter_value == "4" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){4})')
        {% elsif prefix_depth._parameter_value == "5" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){5})')
        {% elsif prefix_depth._parameter_value == "6" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){6})')
        {% elsif prefix_depth._parameter_value == "7" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){7})')
        {% elsif prefix_depth._parameter_value == "8" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){8})')
        {% elsif prefix_depth._parameter_value == "9" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){9})')
        {% elsif prefix_depth._parameter_value == "10" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){10})')
        {% elsif prefix_depth._parameter_value == "11" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){11})')
        {% elsif prefix_depth._parameter_value == "12" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){12})')
        {% elsif prefix_depth._parameter_value == "13" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){13})')
        {% elsif prefix_depth._parameter_value == "14" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){14})')
        {% elsif prefix_depth._parameter_value == "15" %}
          REGEXP_EXTRACT(${TABLE}.name, r'^((?:[^/]+/){15})')
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

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: size_aid {
    label: "Object size (aid)"
    hidden: yes
    type: string
    sql:
    CASE
      WHEN ${TABLE}.size >= POW(1024,5) THEN CONCAT(CAST(ROUND(${TABLE}.size / POW(1024,5), 2) AS STRING), " PiB")
      WHEN ${TABLE}.size >= POW(1024,4) THEN CONCAT(CAST(ROUND(${TABLE}.size / POW(1024,4), 2) AS STRING), " TiB")
      WHEN ${TABLE}.size >= POW(1024,3) THEN CONCAT(CAST(ROUND(${TABLE}.size / POW(1024,3), 2) AS STRING), " GiB")
      WHEN ${TABLE}.size >= POW(1024,2) THEN CONCAT(CAST(ROUND(${TABLE}.size / POW(1024,2), 2) AS STRING), " MiB")
      WHEN ${TABLE}.size >= 1024 THEN CONCAT(CAST(ROUND(${TABLE}.size / 1024, 2) AS STRING), " KiB")
      ELSE CONCAT(CAST(${TABLE}.size AS STRING), " B")
    END ;;
    description: "This hidden dimension supports the size dimension by providing the object's size in the most appropriate unit. The value is displayed through an html parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: created {
    group_label: "Time created"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeCreated ;;
    description: "A timestamp representing the object's creation time"
  }

  dimension_group: custom {
    group_label: "Custom time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.customTime ;;
    description: "This field allows users to set a custom timestamp for the object. Once assigned, this timestamp cannot be removed or modified to an earlier date and time."
  }

  dimension_group: deleted {
    group_label: "Time deleted"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeDeleted ;;
    description: "The timestamp when the object was deleted. Present for non-current or soft-deleted objects."
  }

  dimension_group: hard_delete {
    group_label: "Hard delete time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.hardDeleteTime ;;
    description: "This field denotes the future timestamp at which the object's restorability will expire, calculated as the soft deletion timestamp plus the bucket's soft delete retention duration."
  }

  dimension_group: retention_expiration {
    group_label: "Retention expiration time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.retentionExpirationTime ;;
    description: "The earliest permissible deletion time for this object, determined by applicable object and bucket retention policies."
  }

  dimension_group: snapshot {
    group_label: "Snapshot time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.snapshotTime ;;
    description: "The snapshotTime field in the GCS Storage Intelligence table is a timestamp string in RFC 3339 format. It represents the point-in-time when the object snapshot was captured, effectively grouping object snapshots. For the precise time rows were inserted into the table, refer to the Events Explore."
  }

  dimension_group: soft_delete {
    group_label: "Soft delete time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.softDeleteTime ;;
    description: "This field indicates the timestamp of the object's soft deletion."
  }

  dimension_group: storage_class_updated {
    group_label: "Time storage class updated"
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

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: average_storage_size {
    label: "Average storage size"
    type: average
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.size / POW(1024,5)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.size / POW(1024,4)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.size / POW(1024,3)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.size / POW(1024,2)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.size / 1024
      {% else %}
        ${TABLE}.size
      {% endif %};;
    html: <span>{{ avg_storage_aid._value }}</span> ;;
    description: "A measure that displays the storage size average for all the objects, automatically using the best unit (KiB, MiB, etc.) in Looker. For CSV or Sheets downloads, select your preferred unit with the 'Size Unit' parameter."
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
    label: "Total storage size"
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.size / POW(1024,5)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.size / POW(1024,4)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.size / POW(1024,3)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.size / POW(1024,2)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.size / 1024
      {% else %}
        ${TABLE}.size
      {% endif %};;
    html: <span>{{ sum_storage_aid._value }}</span> ;;
    description: "A measure that displays the storage size sum for all the objects, automatically using the best unit (KiB, MiB, etc.) in Looker. For CSV or Sheets downloads, select your preferred unit with the 'Size Unit' parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: selected_cmek_metric {
    label: "{% if aggregate_function._parameter_value == 'total_objects' %}CMEK - Total objects{% elsif aggregate_function._parameter_value ==
    'total_storage_size' %}CMEK - Total storage size{% else %}CMEK Objects{% endif %}"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${total_cmek_objects}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_cmek_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ cmek_object_count_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ cmek_sum_storage_aid._value }}</span>
      {% endif %};;
    description: "Dynamically outputs either the total object count or total storage size for all objects encrypted with Customer-Managed Encryption Keys (CMEK), based on the selected aggregate_function parameter."
  }

  measure: selected_csek_metric {
    label: "{% if aggregate_function._parameter_value == 'total_objects' %}CSEK - Total objects{% elsif aggregate_function._parameter_value ==
    'total_storage_size' %}CSEK - Total storage size{% else %}CSEK Objects{% endif %}"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${total_csek_objects}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_csek_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ csek_object_count_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ csek_sum_storage_aid._value }}</span>
      {% endif %};;
    description: "Dynamically outputs either the total object count or total storage size for all objects encrypted with Customer-Supplied Encryption Keys (CSEK), based on the selected aggregate_function parameter."
  }

  measure: selected_gmek_metric {
    label: "{% if aggregate_function._parameter_value == 'total_objects' %}GMEK - Total objects{% elsif aggregate_function._parameter_value ==
    'total_storage_size' %}GMEK - Total storage size{% else %}GMEK Objects{% endif %}"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${total_gmek_objects}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_gmek_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ gmek_object_count_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ gmek_sum_storage_aid._value }}</span>
      {% endif %};;
    description: "Dynamically outputs either the total object count or total storage size for all objects encrypted with Google-managed encryption keys (GMEK), based on the selected aggregate_function parameter."
  }

  measure: selected_no_retention_metric {
    label: "{% if aggregate_function._parameter_value == 'total_objects' %}No retention - Total objects{% elsif aggregate_function._parameter_value ==
    'total_storage_size' %}No retention - Total storage size{% else %}No retention{% endif %}"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${total_no_retention_objects}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_no_retention_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ no_retention_object_count_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ no_retention_sum_storage_aid._value }}</span>
      {% endif %};;
    description: "Dynamic measure for No Retention toggling between object count and storage size."
  }

  measure: selected_public_read_metric {
    label: "{% if aggregate_function._parameter_value == 'total_objects' %}Readable objects - Total objects{% elsif aggregate_function._parameter_value ==
    'total_storage_size' %}Readable objects - Total storage size{% else %}Readable objects{% endif %}"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${total_public_read_objects}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_public_read_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ public_read_object_count_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ public_read_sum_storage_aid._value }}</span>
      {% endif %};;
    description: "Dynamic measure for Public Read Access toggling between object count and storage size."
  }

  measure: selected_public_write_metric {
    label: "{% if aggregate_function._parameter_value == 'total_objects' %}Writable objects - Total objects{% elsif
     aggregate_function._parameter_value == 'total_storage_size' %}Writable objects - Total storage size{% else %}Writable objects{% endif %}"
    type: number
    value_format: "#,##0.00"
    sql:
          {% if aggregate_function._parameter_value == "total_objects" %}
            ${total_public_write_objects}
          {% elsif aggregate_function._parameter_value == "total_storage_size" %}
            ${total_public_write_storage_size}
          {% endif %} ;;
    html:
          {% if aggregate_function._parameter_value == "total_objects" %}
            <span>{{ public_write_object_count_aid._rendered_value }}</span>
          {% elsif aggregate_function._parameter_value == "total_storage_size" %}
            <span>{{ public_write_sum_storage_aid._rendered_value }}</span>
          {% endif %} ;;
    description: "Dynamic measure for Public Write Access toggling between object count and storage size."
  }

  measure: selected_retention_active_metric {
    label: "{% if aggregate_function._parameter_value == 'total_objects' %}Active retention - Total objects{% elsif aggregate_function._parameter_value ==
    'total_storage_size' %}Active retention - Total storage size{% else %}Active retention{% endif %}"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${total_retention_active_objects}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_retention_active_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ retention_active_object_count_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ retention_active_sum_storage_aid._value }}</span>
      {% endif %};;
    description: "A dynamic measure that displays either the total number of objects or the total storage size for objects with an active retention period, depending on the selected aggregate function."
  }

  measure: selected_retention_expired_metric {
    label: "{% if aggregate_function._parameter_value == 'total_objects' %}Retention expired - Total objects{% elsif aggregate_function._parameter_value ==
    'total_storage_size' %}Retention expired - Total storage size{% else %}Retention expired{% endif %}"
    type: number
    value_format: "#,##0.00"
    sql:
      {% if aggregate_function._parameter_value == "total_objects" %}
        ${total_retention_expired_objects}
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        ${total_retention_expired_storage_size}
      {% endif %};;
    html:
      {% if aggregate_function._parameter_value == "total_objects" %}
        <span><number>{{ retention_expired_object_count_aid._value }}</number></span>
      {% elsif aggregate_function._parameter_value == "total_storage_size" %}
        <span>{{ retention_expired_sum_storage_aid._value }}</span>
      {% endif %};;
    description: "A dynamic measure that displays either the total number of objects or the total storage size for objects whose retention expiration time has passed, depending on the selected aggregate function."
  }

  measure: total_cmek_objects {
    label: "Total CMEK objects"
    type: count
    hidden: yes
    filters: [encryption_type: "CMEK"]
    description: "The total number of objects encrypted using Customer-Managed Encryption Keys (CMEK)."
  }

  measure: total_cmek_storage_size {
    label: "Total storage size - CMEK objects"
    type: sum
    hidden: yes
    value_format: "#,##0.00"
    filters: [encryption_type: "CMEK"]
    sql:
          {% if size_unit._parameter_value == "PiB" %}
            ${TABLE}.size / POW(1024, 5)
          {% elsif size_unit._parameter_value == "TiB" %}
            ${TABLE}.size / POW(1024, 4)
          {% elsif size_unit._parameter_value == "GiB" %}
            ${TABLE}.size / POW(1024, 3)
          {% elsif size_unit._parameter_value == "MiB" %}
            ${TABLE}.size / POW(1024, 2)
          {% elsif size_unit._parameter_value == "KiB" %}
            ${TABLE}.size / 1024
          {% else %}
            ${TABLE}.size
          {% endif %} ;;
    description: "The total storage size of all objects encrypted using Customer-Managed Encryption Keys (CMEK), dynamically formatted by the selected size unit."
  }

  measure: total_csek_objects {
    label: "Total CSEK objects"
    type: count
    hidden: yes
    filters: [encryption_type: "CSEK"]
    description: "The total number of objects encrypted using Customer-Supplied Encryption Keys (CSEK)."
  }

  measure: total_csek_storage_size {
    label: "Total storage size - CSEK objects"
    type: sum
    hidden: yes
    value_format: "#,##0.00"
    filters: [encryption_type: "CSEK"]
    sql:
          {% if size_unit._parameter_value == "PiB" %}
            ${TABLE}.size / POW(1024, 5)
          {% elsif size_unit._parameter_value == "TiB" %}
            ${TABLE}.size / POW(1024, 4)
          {% elsif size_unit._parameter_value == "GiB" %}
            ${TABLE}.size / POW(1024, 3)
          {% elsif size_unit._parameter_value == "MiB" %}
            ${TABLE}.size / POW(1024, 2)
          {% elsif size_unit._parameter_value == "KiB" %}
            ${TABLE}.size / 1024
          {% else %}
            ${TABLE}.size
          {% endif %} ;;
    description: "The total storage size of all objects encrypted using Customer-Supplied Encryption Keys (CSEK), dynamically formatted by the selected size unit."
  }

  measure: total_gmek_objects {
    label: "Total GMEK objects"
    type: count
    hidden: yes
    filters: [encryption_type: "GMEK"]
    description: "The total number of objects encrypted using Google-owned and Google-managed encryption keys (GMEK)."
  }

  measure: total_gmek_storage_size {
    label: "Total storage size - GMEK objects"
    type: sum
    hidden: yes
    value_format: "#,##0.00"
    filters: [encryption_type: "GMEK"]
    sql:
          {% if size_unit._parameter_value == "PiB" %}
            ${TABLE}.size / POW(1024, 5)
          {% elsif size_unit._parameter_value == "TiB" %}
            ${TABLE}.size / POW(1024, 4)
          {% elsif size_unit._parameter_value == "GiB" %}
            ${TABLE}.size / POW(1024, 3)
          {% elsif size_unit._parameter_value == "MiB" %}
            ${TABLE}.size / POW(1024, 2)
          {% elsif size_unit._parameter_value == "KiB" %}
            ${TABLE}.size / 1024
          {% else %}
            ${TABLE}.size
          {% endif %} ;;
    description: "The total storage size of all objects encrypted using Google-owned and Google-managed encryption keys (GMEK), dynamically formatted by the selected size unit."
  }

  measure: total_no_retention_objects {
    label: "Total objects without retention"
    type: count
    hidden: yes
    filters: [has_no_retention: "yes"]
    description: "The total number of objects that have no retention expiration time."
  }

  measure: total_no_retention_storage_size {
    label: "Total storage size - inactive retention objects"
    type: number
    hidden: yes
    value_format: "#,##0.00"
    sql:
          {% if size_unit._parameter_value == "PiB" %}
            ${total_no_retention_storage_size_bytes} / POW(1024, 5)
          {% elsif size_unit._parameter_value == "TiB" %}
            ${total_no_retention_storage_size_bytes} / POW(1024, 4)
          {% elsif size_unit._parameter_value == "GiB" %}
            ${total_no_retention_storage_size_bytes} / POW(1024, 3)
          {% elsif size_unit._parameter_value == "MiB" %}
            ${total_no_retention_storage_size_bytes} / POW(1024, 2)
          {% elsif size_unit._parameter_value == "KiB" %}
            ${total_no_retention_storage_size_bytes} / 1024
          {% else %}
            ${total_no_retention_storage_size_bytes}
          {% endif %} ;;
    description: "The total storage size of objects with no retention policy, dynamically converted to the selected size unit."
  }

  measure: total_no_retention_storage_size_bytes {
    label: "Total storage size - inactive retention objects (bytes)"
    type: sum
    hidden: yes
    sql: ${TABLE}.size ;;
    filters: [has_no_retention: "yes"]
    description: "The raw total storage size (in bytes) of objects that have no active retention policy."
  }

  measure: total_public_read_objects {
    label: "Total public read objects"
    type: count
    hidden: yes
    filters: [read_public_access: "PUBLIC"]
    description: "The total number of objects with Public read access."
  }

  measure: total_public_read_storage_size {
    label: "Total storage size - public read objects"
    type: number
    hidden: yes
    value_format: "#,##0.00"
    sql:
      SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN
        {% if size_unit._parameter_value == "PiB" %}
          ${TABLE}.size / POW(1024, 5)
        {% elsif size_unit._parameter_value == "TiB" %}
          ${TABLE}.size / POW(1024, 4)
        {% elsif size_unit._parameter_value == "GiB" %}
          ${TABLE}.size / POW(1024, 3)
        {% elsif size_unit._parameter_value == "MiB" %}
          ${TABLE}.size / POW(1024, 2)
        {% elsif size_unit._parameter_value == "KiB" %}
          ${TABLE}.size / 1024
        {% else %}
          ${TABLE}.size
        {% endif %}
      ELSE 0 END) ;;
    description: "The total storage size of objects with Public read access."
  }

  measure: total_public_write_objects {
    label: "Total public write objects"
    type: count
    hidden: yes
    filters: [write_public_access: "PUBLIC"]
    description: "The total number of objects with Public Write access."
  }

  measure: total_public_write_storage_size {
    label: "Total public write storage size"
    type: sum
    hidden: yes
    value_format: "#,##0.00"
    sql:
          CASE WHEN ${write_public_access} = 'PUBLIC' THEN
            {% if size_unit._parameter_value == "PiB" %}
              ${TABLE}.size / POW(1024, 5)
            {% elsif size_unit._parameter_value == "TiB" %}
              ${TABLE}.size / POW(1024, 4)
            {% elsif size_unit._parameter_value == "GiB" %}
              ${TABLE}.size / POW(1024, 3)
            {% elsif size_unit._parameter_value == "MiB" %}
              ${TABLE}.size / POW(1024, 2)
            {% elsif size_unit._parameter_value == "KiB" %}
              ${TABLE}.size / 1024
            {% else %}
              ${TABLE}.size
            {% endif %}
          ELSE 0 END ;;
    description: "The total storage size of objects with Public write access."
  }

  measure: total_retention_active_objects {
    label: "Total active retention objects"
    type: count
    hidden: yes
    filters: [is_retention_active: "yes"]
    description: "The total number of objects whose retention expiration time has not yet passed."
  }

  measure: total_retention_active_storage_size {
    label: "Total storage size - active retention objects"
    type: number
    hidden: yes
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${total_retention_active_storage_size_bytes} / POW(1024, 5)
      {% elsif size_unit._parameter_value == "TiB" %}
        ${total_retention_active_storage_size_bytes} / POW(1024, 4)
      {% elsif size_unit._parameter_value == "GiB" %}
        ${total_retention_active_storage_size_bytes} / POW(1024, 3)
      {% elsif size_unit._parameter_value == "MiB" %}
        ${total_retention_active_storage_size_bytes} / POW(1024, 2)
      {% elsif size_unit._parameter_value == "KiB" %}
        ${total_retention_active_storage_size_bytes} / 1024
      {% else %}
        ${total_retention_active_storage_size_bytes}
      {% endif %} ;;
    description: "The total storage size of Retention Active objects, dynamically converted to the selected size unit."
  }

  measure: total_retention_active_storage_size_bytes {
    label: "Total storage size - active retention objects (bytes)"
    type: sum
    hidden: yes
    sql: ${TABLE}.size ;;
    filters: [is_retention_active: "yes"]
    description: "The raw total storage size (in bytes) of objects whose retention is active."
  }

  measure: total_retention_expired_objects {
    label: "Total retention-expired objects"
    type: count
    hidden: yes
    filters: [is_retention_expired: "yes"]
    description: "The total number of objects whose retention expiration time has passed."
  }

  measure: total_retention_expired_storage_size {
    label: "Total storage size - expired retention objects"
    type: number
    hidden: yes
    value_format: "#,##0.00"
    sql:
          {% if size_unit._parameter_value == "PiB" %}
            ${total_retention_expired_storage_size_bytes} / POW(1024, 5)
          {% elsif size_unit._parameter_value == "TiB" %}
            ${total_retention_expired_storage_size_bytes} / POW(1024, 4)
          {% elsif size_unit._parameter_value == "GiB" %}
            ${total_retention_expired_storage_size_bytes} / POW(1024, 3)
          {% elsif size_unit._parameter_value == "MiB" %}
            ${total_retention_expired_storage_size_bytes} / POW(1024, 2)
          {% elsif size_unit._parameter_value == "KiB" %}
            ${total_retention_expired_storage_size_bytes} / 1024
          {% else %}
            ${total_retention_expired_storage_size_bytes}
          {% endif %} ;;
    description: "The total storage size of objects whose retention expiration time has passed, dynamically converted to the
    selected size unit."
  }

  measure: total_retention_expired_storage_size_bytes {
    label: "Total storage size - expired retention objects (bytes)"
    type: sum
    hidden: yes
    sql: ${TABLE}.size ;;
    filters: [is_retention_expired: "yes"]
    description: "The raw total storage size (in bytes) of objects whose retention expiration time has passed."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: avg_storage_aid {
    label: "Average storage (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN AVG(${TABLE}.size) >= POW(1024,6) THEN CONCAT(CAST(ROUND(AVG(${TABLE}.size) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN AVG(${TABLE}.size) >= POW(1024,5) THEN CONCAT(CAST(ROUND(AVG(${TABLE}.size) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN AVG(${TABLE}.size) >= POW(1024,4) THEN CONCAT(CAST(ROUND(AVG(${TABLE}.size) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN AVG(${TABLE}.size) >= POW(1024,3) THEN CONCAT(CAST(ROUND(AVG(${TABLE}.size) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN AVG(${TABLE}.size) >= POW(1024,2) THEN CONCAT(CAST(ROUND(AVG(${TABLE}.size) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN AVG(${TABLE}.size) >= 1024 THEN CONCAT(CAST(ROUND(AVG(${TABLE}.size) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(AVG(${TABLE}.size), 2) AS STRING), " B")
      END ;;
    description: "This hidden measure supports the 'Average Storage Size' measure by aggregating and formatting the size in the optimal unit. The result is presented via an html parameter."
  }

  measure: cmek_object_count_aid {
    label: "Total CMEK objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${total_cmek_objects}) ;;
    description: "Hidden string measure used to explicitly format the total CMEK object count with commas for specialized HTML rendering."
  }

  measure: cmek_sum_storage_aid {
    label: "Total storage size - CMEK objects (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CMEK' THEN ${TABLE}.size ELSE 0 END), 2) AS STRING), " B")
      END ;;
    description: "Hidden measure to format CMEK storage size."
  }

  measure: csek_object_count_aid {
    label: "Total CSEK objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${total_csek_objects}) ;;
    description: "Hidden measure to format CSEK object count."
  }

  measure: csek_sum_storage_aid {
    label: "Total storage size - CSEK objects (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'CSEK' THEN ${TABLE}.size ELSE 0 END), 2) AS STRING), " B")
      END ;;
    description: "Hidden measure to format CSEK storage size."
  }

  measure: gmek_object_count_aid {
    label: "Total GMEK objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${total_gmek_objects}) ;;
    description: "Hidden measure to format GMEK object count."
  }

  measure: gmek_sum_storage_aid {
    label: "Total storage size - GMEK objects (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(SUM(CASE WHEN ${encryption_type} = 'GMEK' THEN ${TABLE}.size ELSE 0 END), 2) AS STRING), " B")
      END ;;
    description: "Hidden measure to format GMEK storage size."
  }

  measure: no_retention_object_count_aid {
    label: "Total objects without retention (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${total_no_retention_objects}) ;;
    description: "Hidden measure to format No Retention object count."
  }

  measure: no_retention_sum_storage_aid {
    label: "Total storage size - inactive retention objects (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime IS NULL THEN ${TABLE}.size ELSE 0 END), 2) AS STRING), " B")
      END ;;
    description: "Hidden measure to format No Retention storage size."
  }

  measure: object_count_aid {
    label: "Total objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${object_count}) ;;
    description: "This hidden measure facilitates the formatting of object count values, inserting thousands separators to enhance numerical readability (e.g., 1,234,567)."
  }

  measure: public_read_object_count_aid {
    label: "Total public read objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${total_public_read_objects}) ;;
    description: "Hidden measure to format Public read access object count."
  }

  measure: public_read_sum_storage_aid {
    label: "Total storage size - public read objects (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(SUM(CASE WHEN ${read_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END), 2) AS STRING), " B")
      END ;;
    description: "Hidden measure to format Public Read Access storage size."
  }

  measure: public_write_object_count_aid {
    label: "Total public write objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${total_public_write_objects}) ;;
    description: "Hidden measure to format Public write access object count."
  }

  measure: public_write_sum_storage_aid {
    label: "Total storage size - public write objects (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(SUM(CASE WHEN ${write_public_access} = 'PUBLIC' THEN ${TABLE}.size ELSE 0 END), 2) AS STRING), " B")
      END ;;
    description: "Hidden measure to format Public Write Access storage size."
  }

  measure: retention_active_object_count_aid {
    label: "Total active retention objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${total_retention_active_objects}) ;;
    description: "Hidden measure to format Retention Active object count."
  }

  measure: retention_active_sum_storage_aid {
    label: "Total storage size - active retention objects (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime > CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END), 2) AS STRING), " B")
      END ;;
    description: "Hidden measure to format Retention Active storage size."
  }

  measure: retention_expired_object_count_aid {
    label: "Total retention-expired objects (aid)"
    hidden: yes
    type: string
    sql: FORMAT("%'d", ${total_retention_expired_objects}) ;;
    description: "Hidden measure to format Retention Expired object count."
  }

  measure: retention_expired_sum_storage_aid {
    label: "Total storage size - expired retention objects (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) >= 1024 THEN CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(ROUND(SUM(CASE WHEN ${TABLE}.retentionExpirationTime <= CURRENT_TIMESTAMP() THEN ${TABLE}.size ELSE 0 END), 2) AS STRING), " B")
      END ;;
    description: "Hidden measure to format Retention Expired storage size."
  }

  measure: sum_storage_aid {
    label: "Total storage size (aid)"
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(${TABLE}.size) >= POW(1024,6) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.size) / POW(1024,6), 2) AS STRING), " EiB")
        WHEN SUM(${TABLE}.size) >= POW(1024,5) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.size) / POW(1024,5), 2) AS STRING), " PiB")
        WHEN SUM(${TABLE}.size) >= POW(1024,4) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.size) / POW(1024,4), 2) AS STRING), " TiB")
        WHEN SUM(${TABLE}.size) >= POW(1024,3) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.size) / POW(1024,3), 2) AS STRING), " GiB")
        WHEN SUM(${TABLE}.size) >= POW(1024,2) THEN CONCAT(CAST(ROUND(SUM(${TABLE}.size) / POW(1024,2), 2) AS STRING), " MiB")
        WHEN SUM(${TABLE}.size) >= 1024 THEN CONCAT(CAST(ROUND(SUM(${TABLE}.size) / 1024, 2) AS STRING), " KiB")
        ELSE CONCAT(CAST(SUM(${TABLE}.size) AS STRING), " B")
      END ;;
    description: "This hidden measure supports the 'Total Storage Size' measure by aggregating and formatting the size in the optimal unit. The result is presented via an html parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Parameters - Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  parameter: prefix_depth {
    label: "Prefix depth"
    type: unquoted
    allowed_value: {
      label: "1"
      value: "1"
    }

    allowed_value: {
      label: "2"
      value: "2"
    }

    allowed_value: {
      label: "3"
      value: "3"
    }

    allowed_value: {
      label: "4"
      value: "4"
    }

    allowed_value: {
      label: "5"
      value: "5"
    }

    allowed_value: {
      label: "6"
      value: "6"
    }

    allowed_value: {
      label: "7"
      value: "7"
    }

    allowed_value: {
      label: "8"
      value: "8"
    }

    allowed_value: {
      label: "9"
      value: "9"
    }

    allowed_value: {
      label: "10"
      value: "10"
    }

    allowed_value: {
      label: "11"
      value: "11"
    }

    allowed_value: {
      label: "12"
      value: "12"
    }

    allowed_value: {
      label: "13"
      value: "13"
    }

    allowed_value: {
      label: "14"
      value: "14"
    }

    allowed_value: {
      label: "15"
      value: "15"
    }

    allowed_value: {
      label: "Full prefix"
      value: "full_prefix"
    }

    default_value: "full_prefix"
    description: "This parameter allows users to specify the prefix depth for the prefix dimension. The default value, 'Full Prefix', displays the complete prefix for objects within a directory hierarchy."
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
  # ---------------------------- Parameter - Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  parameter: aggregate_function {
    label: "Selected measure"
    type: unquoted
    allowed_value: {
      label: "Total Objects"
      value: "total_objects"
    }

    allowed_value: {
      label: "Total Storage Size"
      value: "total_storage_size"
    }

    default_value: "total_objects"
    description: "This parameter allows users to specify the aggregated function for the 'Selected Measure' field. The default measure for this parameter is Total Objects."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Sets -------------------------------
  # --------------------------------------------------------------------------------------------------------

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
      retention_expiration_time,
      soft_delete_time,
      hard_delete_time
    ]
  }
}
