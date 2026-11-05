# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Oct 5, 2026
# Modified Date: Nov 4, 2026
# Purpose: Contains information about the Object Context Catalog View Table inside the Storage Intelligence linked Dataset.
# --------------------------------------------------------------------------

view: object_contexts_catalog {

  sql_table_name: `@{PROJECT_ID}.@{BIGQUERY_DATASET}.object_contexts_catalog_view` ;;

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
        CAST(${TABLE}.project AS STRING), '_',
        ${TABLE}.bucket, '_',${TABLE}.name, '_',
        CAST(${TABLE}.generation AS STRING)
      ) ;;
    description: "A hidden, composite primary key uniquely identifying each record using project, bucket, object name, and generation."
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

  dimension: contexts {
    hidden: yes
    sql: ${TABLE}.contexts ;;
    description: "Raw repeated record of object contexts for unnesting."
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

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

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

  dimension: inside_a_folder {
    label: "Is object inside a folder"
    type: yesno
    sql:  IF(${folder} = '-', FALSE, TRUE);;
    description: "A boolean flag denoting the object's presence within a directory hierarchy."
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
    description: "The Object Prefix dimension displays folder paths up to a specified depth, allowing users to analyze data at desired folder levels. For example, selecting a Prefix Depth of '2' shows paths like '/sub-folder1/sub-folder2/'."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: catalog_updated {
    group_label: "Catalog updated time"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.catalogUpdatedTime ;;
    description: "The timestamp when the catalog was updated."
  }

  dimension_group: created {
    group_label: "Time created"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeCreated ;;
    description: "A timestamp representing the object's creation time."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: bucket_count {
    label: "Total buckets"
    type: count_distinct
    sql: ${bucket_name} ;;
    drill_fields: [bucket_name, object_count, location]
    description: "This measure calculates the count of unique buckets within the object's snapshot."
  }

  measure: object_count {
    label: "Total objects"
    value_format: "#,##0"
    type: count
    drill_fields: [detail*]
    link: {
      label: "Explore Top 100 Objects by Creation Date"
      url: "{{ link }}&sorts=object_contexts_catalog.created_date+desc&limit=100"
    }
    description: "A measure that counts the total number of objects that have a context."
  }

  measure: total_contexts {
    label: "Total contexts"
    type: sum
    sql: ARRAY_LENGTH(${TABLE}.contexts) ;;
    drill_fields: [context_drill_detail*]
    description: "The total number of context entries associated with this object version."
  }

  measure: total_objects_with_extended_data {
    label: "Total objects with extended data"
    type: count_distinct
    sql:
      CASE
        WHEN EXISTS (
          SELECT 1 FROM UNNEST(${TABLE}.contexts) AS c WHERE c.extendedData IS NOT NULL
        )
        THEN ${primary_key}
        ELSE NULL
      END
    ;;
    drill_fields: [detail*]
    value_format_name: decimal_0
    description: "The total count of unique objects that contain at least one context with extended data."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Parameters -------------------------------
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

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Sets (Drill Fields) ------------------------
  # --------------------------------------------------------------------------------------------------------

  set: detail {
    fields: [
      project,
      bucket_name,
      object_name,
      generation,
      location,
      file_extension,
      folder,
      created_time,
      catalog_updated_time
    ]
  }

  set: context_drill_detail {
    fields: [
      project,
      bucket_name,
      object_name,
      generation,
      object_contexts_catalog__contexts.key,
      object_contexts_catalog__contexts.value,
      object_contexts_catalog__contexts.context_creation_time
    ]
  }

  drill_fields: [detail*]
}
