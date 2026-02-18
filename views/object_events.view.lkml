# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Feb 12, 2026
# Modified Date: Feb 17, 2026
# Purpose: Contains information about the Object Events View Table inside the Storage Intelligence linked Dataset.
# --------------------------------------------------------------------------

view: object_events {

  sql_table_name: `@{PROJECT_ID}.@{BIGQUERY_DATASET}.object_events_view` ;;

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Primary Key -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql:
      CONCAT(
        CAST(${TABLE}.requestCompletionTime AS STRING), '_',
        ${TABLE}.requestId, '_',
        ${TABLE}.bucketName
      );;
    description: "Primary key representing a unique log entry. A concatenation of the completion timestamp, the specific request ID, and the target bucket name."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_name {
    label: "Bucket Name"
    type: string
    sql: ${TABLE}.bucketName ;;
    description: "The name of the Google Cloud Storage (GCS) bucket from which data is being sourced."
  }

  dimension: error_reason {
    label: "Error Reason"
    type: string
    sql: ${TABLE}.errorReason ;;
    description: "Explanatory error message provided by Google Cloud Storage (GCS) when a request fails due to rate limiting (HTTP 429 Too Many Requests). This field is populated only for GCS object modification requests, specifically delete, update and create operations."
  }

  dimension: generation {
    label: "Generation"
    type: number
    sql: ${TABLE}.generation ;;
    description: "A unique identifier for each object's version, present regardless of the bucket's versioning configuration."
  }

  dimension: location {
    label: "Location"
    type: string
    sql: ${TABLE}.location ;;
    description: "The region or multi-region location of the source Google Cloud Storage (GCS) object."
  }

  dimension: object_name {
    label: "Object Name"
    type: string
    sql: ${TABLE}.objectName ;;
    description: "The name of the Google Cloud Storage (GCS) object from which data is being sourced."
  }

  dimension: project {
    label: "Project Number"
    type: string
    sql: CAST(${TABLE}.project AS STRING) ;;
    description: "The Google Cloud project number associated with the project that contains the bucket."
  }

  dimension: request_bytes {
    label: "Data Ingress"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.requestBytes FLOAT64) / (POW(1024, 5))
      {% elsif size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.requestBytes FLOAT64) / (POW(1024, 4))
      {% elsif size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.requestBytes FLOAT64) / (POW(1024, 3))
      {% elsif size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.requestBytes FLOAT64) / (POW(1024, 2))
      {% elsif size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.requestBytes FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.requestBytes FLOAT64)
      {% endif %};;
    html:
      <span>{{ request_bytes_aid._value }}</span> ;;
    description: "The volume of data sent from the client to the server (ingress) in the request body. This typically represents upload size. The displayed unit (e.g., GiB, MiB) is controlled by the 'Size Unit' parameter."
  }

  dimension: request_host {
    label: "Request Host"
    type: string
    sql: ${TABLE}.requestHost ;;
    description: "Host header value from the original HTTP request. This indicates the domain name that the client was trying to reach (e.g., storage.googleapis.com)"
  }

  dimension: request_http_method {
    label: "Request HTTP Method"
    type: string
    sql: ${TABLE}.requestHttpMethod ;;
    description: "The specific HTTP method (e.g., POST, PUT, PATCH, DELETE) used by the client when sending the request. This method determines the intended operation on the requested source."
  }

  dimension: request_id {
    label: "Request ID"
    type: string
    sql: ${TABLE}.requestId ;;
    description: "The unique identifier generated and assigned by Google Cloud Storage (GCS) to a particular transaction."
  }

  dimension: request_operation {
    label: "Request Operation"
    type: string
    sql: ${TABLE}.requestOperation ;;
    description: "Categorizes the type of operation performed on the storage object."
  }

  dimension: request_processing_time {
    label: "Request Processing Time (ms)"
    type: number
    sql: ${TABLE}.requestProcessingTimeMicros / 1000 ;;
    description: "The total duration (in milliseconds) taken to process the request. Calculated by converting microseconds from the raw source data."
  }

  dimension: request_referrer {
    label: "Request Referrer"
    type: string
    sql: ${TABLE}.requestReferrer ;;
    description: "Identifies the source URL where the request originated. This field can be used to track which websites or applications are driving traffic to the object."
  }

  dimension: response_bytes {
    label: "Data Egress"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.responseBytes FLOAT64) / (POW(1024, 5))
      {% elsif size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.responseBytes FLOAT64) / (POW(1024, 4))
      {% elsif size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.responseBytes FLOAT64) / (POW(1024, 3))
      {% elsif size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.responseBytes FLOAT64) / (POW(1024, 2))
      {% elsif size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.responseBytes FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.responseBytes FLOAT64)
      {% endif %};;
    html:
      <span>{{ response_bytes_aid._value }}</span> ;;
    description: "The volume of data sent from the server to the client (egress) in response to the request. The displayed unit (e.g., GiB, MiB) is controlled by the 'Size Unit' parameter."
  }

  dimension: response_status {
    label: "Response Status"
    type: number
    sql: ${TABLE}.responseStatus ;;
    description: "The HTTP code indicating the success or failure of the GCS operation (e.g., 200, 400, 500)."
  }

  dimension: size {
    label: "Object Size"
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
    label: "Storage Class"
    type: string
    sql: ${TABLE}.storageClass ;;
    description: "The storage class of a Google Cloud Storage (GCS) object. It can be Standard, Nearline, Coldline, Archive or Rapid."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Extra Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: bucket_project_selection {
    label_from_parameter: bucket_project_selector
    type: string
    sql:
      {% if bucket_project_selector._parameter_value == "bucket" %}
        ${bucket_name}
      {% elsif bucket_project_selector._parameter_value == "project_name" %}
        ${project_attributes.project_name}
      {% else %}
        ${bucket_name}
      {% endif %};;
    description: "Dynamic dimension where users can select if they want to visualize the Bucket Name or the Project Name."
  }

  dimension: dimension_selection {
    label_from_parameter: dimension_selector
    type: string
    sql:
      {% if dimension_selector._parameter_value == "http_method" %}
        ${request_http_method}
      {% elsif dimension_selector._parameter_value == "status" %}
        ${response_status}
      {% elsif dimension_selector._parameter_value == "request_host" %}
        ${request_host}
      {% elsif dimension_selector._parameter_value == "request_operation" %}
        ${request_operation}
      {% elsif dimension_selector._parameter_value == "location" %}
        ${location}
      {% elsif dimension_selector._parameter_value == "storage_class" %}
        ${storage_class}
      {% else %}
        ${request_http_method}
      {% endif %};;
    description: "Dynamic dimension used to facilitate the process of choosing a specific dimension within the GCS Storage Intelligence - Object Events table."
  }

  dimension: is_delete_request {
    label: "Is DELETE request?"
    type: yesno
    description: "A boolean field that describes if the HTTP request method's purpose was inteded to delete an object (DELETE)."
    sql: ${request_http_method} = 'DELETE' ;;
  }

  dimension: is_error_request {
    label: "Is an Error Request?"
    type: yesno
    description: "A boolean field that describes if a request has an error status or not."
    sql: ${response_status} >= 400;;
  }

  dimension: is_put_request {
    label: "Is PUT request?"
    type: yesno
    description: "A boolean field that describes if the HTTP request method's purpose was inteded to create an object (PUT)."
    sql: ${request_http_method} = 'PUT' ;;
  }

  dimension: is_too_many_requests_error {
    label: "Is a 429 (Too Many Requests) Error?"
    type: yesno
    description: "A boolean field that describes if a requests has a 429 (Too Many Requests) error status or not."
    sql: ${response_status} = 429 ;;
  }

  dimension: prefix {
    label: "Object Prefix"
    type: string
    sql:
      COALESCE(
        {% if prefix_depth._parameter_value == "1" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){1})')
        {% elsif prefix_depth._parameter_value == "2" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){2})')
        {% elsif prefix_depth._parameter_value == "3" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){3})')
        {% elsif prefix_depth._parameter_value == "4" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){4})')
        {% elsif prefix_depth._parameter_value == "5" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){5})')
        {% elsif prefix_depth._parameter_value == "6" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){6})')
        {% elsif prefix_depth._parameter_value == "7" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){7})')
        {% elsif prefix_depth._parameter_value == "8" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){8})')
        {% elsif prefix_depth._parameter_value == "9" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){9})')
        {% elsif prefix_depth._parameter_value == "10" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){10})')
        {% elsif prefix_depth._parameter_value == "11" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){11})')
        {% elsif prefix_depth._parameter_value == "12" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){12})')
        {% elsif prefix_depth._parameter_value == "13" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){13})')
        {% elsif prefix_depth._parameter_value == "14" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){14})')
        {% elsif prefix_depth._parameter_value == "15" %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^((?:[^/]+/){15})')
        {% else %}
          REGEXP_EXTRACT(${TABLE}.objectName, r'^(.*\/)[^\/]+$')
        {% endif %}
      , "-");;
    description: "The Object Prefix dimension displays folder paths up to a specified depth, allowing users to analyze data at desired folder levels. For example, selecting a Prefix Depth of 'Second' shows paths like '/sub-folder1/sub-folder2/'."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Dimensions -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension: request_bytes_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN CAST(${TABLE}.requestBytes FLOAT64) >= POW(1024, 5) THEN CONCAT(ROUND(CAST(${TABLE}.requestBytes FLOAT64) / POW(1024, 5), 2), " PiB")
        WHEN CAST(${TABLE}.requestBytes FLOAT64) >= POW(1024, 4) THEN CONCAT(ROUND(CAST(${TABLE}.requestBytes FLOAT64) / POW(1024, 4), 2), " TiB")
        WHEN CAST(${TABLE}.requestBytes FLOAT64) >= POW(1024, 3) THEN CONCAT(ROUND(CAST(${TABLE}.requestBytes FLOAT64) / POW(1024, 3),1), " GiB")
        WHEN CAST(${TABLE}.requestBytes FLOAT64) >= POW(1024, 2) THEN CONCAT(ROUND(CAST(${TABLE}.requestBytes FLOAT64) / POW(1024, 2), 0), " MiB")
        WHEN CAST(${TABLE}.requestBytes FLOAT64) >= 1024 THEN CONCAT(ROUND(CAST(${TABLE}.requestBytes FLOAT64) / 1024, 0), " KiB")
        ELSE CONCAT(CAST(${TABLE}.requestBytes FLOAT64)," B")
      END;;
    description: "Internal helper that formats the data ingress (request bytes) into a human-readable string (e.g., '5.20 MiB'). Used for HTML formatting in the 'Data Ingress' dimension."
  }

  dimension: response_bytes_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN CAST(${TABLE}.responseBytes FLOAT64) >= POW(1024, 5) THEN CONCAT(ROUND(CAST(${TABLE}.responseBytes FLOAT64) / POW(1024, 5), 2), " PiB")
        WHEN CAST(${TABLE}.responseBytes FLOAT64) >= POW(1024, 4) THEN CONCAT(ROUND(CAST(${TABLE}.responseBytes FLOAT64) / POW(1024, 4), 2), " TiB")
        WHEN CAST(${TABLE}.responseBytes FLOAT64) >= POW(1024, 3) THEN CONCAT(ROUND(CAST(${TABLE}.responseBytes FLOAT64) / POW(1024, 3),1), " GiB")
        WHEN CAST(${TABLE}.responseBytes FLOAT64) >= POW(1024, 2) THEN CONCAT(ROUND(CAST(${TABLE}.responseBytes FLOAT64) / POW(1024, 2), 0), " MiB")
        WHEN CAST(${TABLE}.responseBytes FLOAT64) >= 1024 THEN CONCAT(ROUND(CAST(${TABLE}.responseBytes FLOAT64) / 1024, 0), " KiB")
        ELSE CONCAT(CAST(${TABLE}.responseBytes FLOAT64)," B")
      END;;
    description: "Internal helper that formats the data egress (response bytes) into a human-readable string (e.g., '1.20 GiB'). Used for HTML formatting in the 'Data Egress' dimension."
  }

  dimension: size_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${TABLE}.size >= POW(1024, 5) THEN CONCAT(ROUND(${TABLE}.size / POW(1024, 5), 2), " PiB")
        WHEN ${TABLE}.size >= POW(1024, 4) THEN CONCAT(ROUND(${TABLE}.size / POW(1024, 4), 2), " TiB")
        WHEN ${TABLE}.size >= POW(1024, 3) THEN CONCAT(ROUND(${TABLE}.size / POW(1024, 3),1), " GiB")
        WHEN ${TABLE}.size >= POW(1024, 2) THEN CONCAT(ROUND(${TABLE}.size / POW(1024, 2), 0), " MiB")
        WHEN ${TABLE}.size >= 1024 THEN CONCAT(ROUND(${TABLE}.size / 1024, 0), " KiB")
        ELSE CONCAT(${TABLE}.size," B")
      END;;
    description: "This hidden dimension supports the size dimension by providing the object's size in the most appropriate unit. The value is displayed through an html parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Dimension Group -------------------------------
  # --------------------------------------------------------------------------------------------------------

  dimension_group: created {
    group_label: "Time Created"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timeCreated ;;
    description: "A timestamp representing the object's creation time"
  }

  dimension_group: request_completion {
    group_label: "Request Completion"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    sql: ${TABLE}.requestCompletionTimestamp ;;
    description: "A timestamp representing the request's completion time"
  }

  dimension: request_completion_date_hour {
    group_label: "Request Completion"
    label: "Date and Hour"
    type: date_time
    sql: TIMESTAMP_TRUNC(${TABLE}.requestCompletionTimestamp, HOUR) ;;
    description: "A timestamp representing the request's completion time"
    html:
      {{ value | date: "%Y-%m-%d %H:00" }} ;;
  }

  dimension: request_completion_dynamic {
    label_from_parameter: date_granularity
    group_label: "Request Completion"
    description: "Dynamic date field that changes based on the Parameter selection."
    type: date_time

    sql:
      {% if date_granularity._parameter_value == 'date_hour' %}
        TIMESTAMP_TRUNC(${TABLE}.requestCompletionTimestamp, HOUR)
      {% elsif date_granularity._parameter_value == 'date' %}
        TIMESTAMP_TRUNC(${TABLE}.requestCompletionTimestamp, DAY)
      {% elsif date_granularity._parameter_value == 'year_month' %}
        TIMESTAMP_TRUNC(${TABLE}.requestCompletionTimestamp, MONTH)
      {% elsif date_granularity._parameter_value == 'month_name' %}
        TIMESTAMP_TRUNC(${TABLE}.requestCompletionTimestamp, MONTH)
      {% else %}
        TIMESTAMP_TRUNC(${TABLE}.requestCompletionTimestamp, HOUR)
      {% endif %} ;;

    html:
      {% if date_granularity._parameter_value == 'date_hour' %}
        {{ rendered_value | date: "%Y-%m-%d %H:00" }}
      {% elsif date_granularity._parameter_value == 'date' %}
        {{ rendered_value | date: "%Y-%m-%d" }}
      {% elsif date_granularity._parameter_value == 'year_month' %}
        {{ rendered_value | date: "%B %Y" }}
      {% elsif date_granularity._parameter_value == 'month_name' %}
        {{ rendered_value | date: "%B" }}
      {% else %}
        {{ rendered_value }}
      {% endif %} ;;
  }

  dimension: request_completion_year_month {
    group_label: "Request Completion"
    label: "Year Month"
    type: date_time
    sql: TIMESTAMP_TRUNC(${TABLE}.requestCompletionTimestamp, MONTH) ;;
    description: "A timestamp representing the request's completion time"
    html:
      {{ value | date: "%B %Y" }} ;;
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: average_latency_ms {
    group_label: "Request Latency"
    label: "Average Latency (ms)"
    type: average
    sql: ${request_processing_time} ;;
    value_format_name: dynamic_thousands
    description: "The average time in milliseconds (ms) the server took to process requests. This measures the duration from receiving the request until the response is completed."
  }

  measure: ninety_five_percentile_request_time {
    group_label: "Request Latency"
    label: "95th Percentile - Request Time"
    type: percentile
    percentile: 95
    sql: ${request_processing_time} ;;
    value_format_name: dynamic_thousands
    description: "The maximum processing time for the fastest 95% of requests. This means only the slowest 5% of requests took longer than this value, making it a key indicator of 'worst-case' performance."
  }

  measure: selected_measure {
    group_label: "Dynamic Metrics"
    label_from_parameter: aggregate_function
    type: number
    value_format: "#,##0"
    sql:
      {% if aggregate_function._parameter_value == "total_requests" %}
        ${total_requests}
      {% elsif aggregate_function._parameter_value == "total_post_requests" %}
        ${total_post_requests}
      {% elsif aggregate_function._parameter_value == "total_put_requests" %}
        ${total_put_requests}
      {% elsif aggregate_function._parameter_value == "total_patch_requests" %}
        ${total_patch_requests}
      {% elsif aggregate_function._parameter_value == "total_delete_requests" %}
        ${total_delete_requests}
      {% elsif aggregate_function._parameter_value == "ninety_five_percentile_request_time" %}
        ${ninety_five_percentile_request_time}
      {% elsif aggregate_function._parameter_value == "total_success_requests" %}
        ${total_success_requests}
      {% elsif aggregate_function._parameter_value == "total_errors" %}
        ${total_errors}
      {% elsif aggregate_function._parameter_value == "total_client_errors" %}
        ${total_client_errors}
      {% elsif aggregate_function._parameter_value == "total_server_errors" %}
        ${total_server_errors}
      {% else %}
        ${total_requests}
      {% endif %};;
    description: "Dynamic measure that updates the calculation logic based on the 'Aggregate Function' parameter. Use this to toggle between different metrics (e.g., Total Requests, Error Counts, Latency) in a single visualization."
  }

  measure: total_client_errors {
    group_label: "Request Status"
    type: count
    filters: [
      response_status: ">= 400 AND < 500"
    ]
    description: "Count of requests with a 4xx response status"
    value_format_name: dynamic_thousands
  }

  measure: total_created_storage_size {
    group_label: "Operations"
    label: "Total Created Storage Size"
    type: sum
    value_format: "#,##0.00"
    filters: [request_http_method: "PUT"]
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.size / (POW(1024, 5))
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.size / (POW(1024, 4))
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.size / (POW(1024, 3))
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.size / (POW(1024, 2))
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.size / (1024)
      {% else %}
        ${TABLE}.size
      {% endif %};;
    html: <span>{{ total_created_storage_size_aid._value }}</span> ;;
    description: "A measure that dispaly the storage size sum for all the objects that were created. It uses the best Unit (KiB, MiB, etc.) in Looker. For CSV or sheets downloads, select your preferred unit with the 'Size Unit' parameter."
  }

  measure: total_data_egress {
    group_label: "Data Transfer"
    label: "Total Data Egress"
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 2))
      {% elsif size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.responseBytes AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.responseBytes AS FLOAT64)
      {% endif %};;
    html: <span>{{ total_data_egress_aid._value }}</span>;;
    description: "The total volume of outbound data sent from Google Cloud Storage to clients or other services. The displayed unit (e.g., GiB, MiB) is controlled by the 'Size Unit' parameter."
  }

  measure: total_data_ingress {
    group_label: "Data Transfer"
    label: "Total Data Ingress"
    type: sum
    value_format: "#,##0.00"
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 2))
      {% elsif size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.requestBytes AS FLOAT64)
      {% endif %};;
    html: <span>{{ total_data_ingress_aid._value }}</span>;;
    description: "The total volume of inbound data received by Google Cloud Storage from clients (uploads). The displayed unit (e.g., GiB, MiB) is controlled by the 'Size Unit' parameter."
  }

  measure: total_delete_requests {
    group_label: "Operations"
    label: "Total DELETE requests"
    type: count
    filters: [
      request_http_method: "DELETE"
    ]
    description: "The total number of requests made to permanently remove objects from storage. This counts all DELETE attempts, including those that may have failed due to permissions or errors."
  }

  measure: total_deleted_storage_size {
    group_label: "Operations"
    label: "Total Deleted Storage Size"
    type: sum
    value_format: "#,##0.00"
    filters: [request_http_method: "DELETE"]
    sql:
      {% if size_unit._parameter_value == "PiB" %}
        ${TABLE}.size / (POW(1024, 5))
      {% elsif size_unit._parameter_value == "TiB" %}
        ${TABLE}.size / (POW(1024, 4))
      {% elsif size_unit._parameter_value == "GiB" %}
        ${TABLE}.size / (POW(1024, 3))
      {% elsif size_unit._parameter_value == "MiB" %}
        ${TABLE}.size / (POW(1024, 2))
      {% elsif size_unit._parameter_value == "KiB" %}
        ${TABLE}.size / (1024)
      {% else %}
        ${TABLE}.size
      {% endif %};;
    html: <span>{{ total_deleted_storage_size_aid._value }}</span> ;;
    description: "A measure that dispaly the storage size sum for all the objects that were deleted. It uses the best Unit (KiB, MiB, etc.) in Looker. For CSV or sheets downloads, select your preferred unit with the 'Size Unit' parameter."
  }

  measure: total_errors {
    group_label: "Request Status"
    type: count
    filters: [
      response_status: ">= 400"
    ]
    description: "The total number of failed requests. This includes both Client errors (4xx, such as 'Not Found' or 'Unauthorized') and Server errors (5xx, such as 'Internal Server Error')."
    value_format_name: dynamic_thousands
  }

  measure: total_patch_requests {
    group_label: "Operations"
    label: "Total PATCH requests"
    type: count
    filters: [
      request_http_method: "PATCH"
    ]
    description: "The total number of requests made to partially update object metadata. Unlike PUT, which replaces an object, PATCH is typically used for targeted modifications to existing resources."
  }

  measure: total_post_requests {
    group_label: "Operations"
    label: "Total POST requests"
    type: count
    filters: [
      request_http_method: "POST"
    ]
    description: "The total number of requests used to create new resources (objects)."
  }

  measure: total_put_requests {
    group_label: "Operations"
    label: "Total PUT requests"
    type: count
    filters: [
      request_http_method: "PUT"
    ]
    description: "The total number of requests made to upload or replace an entire object. This is the standard method used for uploading files and updating existing objects by overwriting them entirely."
  }

  measure: total_requests {
    group_label: "Traffic Overview"
    label: "Total Requests"
    type: count_distinct
    sql: ${request_id}  ;;
    description: "The total number of unique operations processed by Google Cloud Storage. This uses a distinct count of Request IDs to ensure accurate traffic volume reporting."
    value_format_name: dynamic_thousands
  }

  measure: total_server_errors {
    group_label: "Request Status"
    type: count
    filters: [
      response_status: ">= 500"
    ]
    description: "The total number of requests that failed due to server-side issues (HTTP 500-599). High values indicate system instability, such as 'Internal Server Error' (500) or 'Service Unavailable' (503), and typically require immediate investigation."
    value_format_name: dynamic_thousands
  }

  measure: total_storage_size {
    group_label: "Metadata"
    type: sum
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
    html: <span>{{ total_storage_size_aid._value }}</span> ;;
    description: "The cumulative size of all storage objects associated with the logged events. The unit (e.g., GiB, MiB) is automatically optimized for the UI but can be manually overridden for exports using the 'Size Unit' parameter."
  }

  measure: total_success_requests {
    group_label: "Request Status"
    type: count
    filters: [
      response_status: ">= 200 AND < 300"
    ]
    description: "The total number of requests that were successfully received, understood, and accepted by the server (HTTP 200-299). This is the primary indicator of healthy system traffic."
    value_format_name: dynamic_thousands
  }

  measure: total_too_many_requests_errors {
    group_label: "Request Status"
    label: "Total 429 (Too Many Requests Errors)"
    type: count
    filters: [
      response_status: "429"
    ]
    description: "The total number of requests rejected due to rate limiting (HTTP 429). This occurs when a client has sent too many requests in a given amount of time, exceeding the defined quota for the bucket or project."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_created_storage_size_aid {
    group_label: "Operations"
    hidden: yes
    type: string
    sql:
    CASE
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 6)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 6), 2), " EiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 5)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 5), 2), " PiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 4)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 4), 2), " TiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 3)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 3), 2), " GiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 2)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 2), 2), " MiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) >= 1024
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END) / 1024, 2), " KiB")
      ELSE CONCAT(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'PUT' THEN ${TABLE}.size ELSE 0 END), " B")
    END ;;
    description: "Internal helper that aggregates and formats the total size of newly created/uploaded objects (PUT requests) into a human-readable string. Used for HTML formatting."
  }

  measure: total_data_egress_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)), 0), " B")
      END;;
    description: "Internal helper that aggregates and formats total data egress into a human-readable string (e.g., '1.25 TiB'). Used for HTML formatting in the 'Total Data Egress' measure."
  }

  measure: total_data_ingress_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
        WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)), 0), " B")
      END;;
    description: "Internal helper that aggregates and formats total data ingress (uploads) into a human-readable string. Used for HTML formatting in the 'Total Data Ingress' measure."
  }

  measure: total_deleted_storage_size_aid {
    group_label: "Operations"
    hidden: yes
    type: string
    sql:
    CASE
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 6)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 6), 2), " EiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 5)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 5), 2), " PiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 4)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 4), 2), " TiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 3)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 3), 2), " GiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) >= POW(1024, 2)
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) / POW(1024, 2), 2), " MiB")
      WHEN SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) >= 1024
        THEN CONCAT(ROUND(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END) / 1024, 2), " KiB")
      ELSE CONCAT(SUM(CASE WHEN ${TABLE}.requestHttpMethod = 'DELETE' THEN ${TABLE}.size ELSE 0 END), " B")
    END ;;
    description: "Internal helper that aggregates and formats the total size of deleted objects into a human-readable string (KiB to EiB). Filters for 'DELETE' HTTP methods and is used for front-end HTML display."
  }

  measure: total_storage_size_aid {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN SUM(${TABLE}.size) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(${TABLE}.size) / POW(1024, 6), 2), " EiB")
        WHEN SUM(${TABLE}.size) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(${TABLE}.size) / POW(1024, 5), 2), " PiB")
        WHEN SUM(${TABLE}.size) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(${TABLE}.size) / POW(1024, 4), 2), " TiB")
        WHEN SUM(${TABLE}.size) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(${TABLE}.size) / POW(1024, 3), 2), " GiB")
        WHEN SUM(${TABLE}.size) >= POW(1024, 2) THEN CONCAT(round(SUM(${TABLE}.size) / POW(1024, 2), 2), " MiB")
        WHEN SUM(${TABLE}.size) >= 1024 THEN CONCAT(ROUND(SUM(${TABLE}.size) / 1024, 2), " KiB")
        ELSE CONCAT(SUM(${TABLE}.size), " B")
      END;;
    description: "This hidden measure supports the 'Total Storage Size' measure by aggregating and formatting the size in the optimal unit. The result is presented via an html parameter."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Period over Period (PoP) Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: average_latency_ms_current {
    group_label: "Request Latency"
    label: "Average Latency (ms) - Current Period"
    type: average
    sql:
      CASE
        WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
        THEN ${request_processing_time}
        ELSE NULL
      END ;;
    value_format_name: dynamic_thousands
    description: "The average server processing time (ms) specifically within the selected analysis period."
  }

  measure: average_latency_ms_pop_change {
    group_label: "Request Latency"
    label: "Average Latency (ms) - PoP Change"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${average_latency_ms_current} - ${average_latency_ms_previous}),
          ${average_latency_ms_previous}
        )
      {% else %}
        0
      {% endif %} ;;
    value_format_name: percent_2
    html:
      {% if analysis_date_filter._is_filtered %}
        {{ rendered_value }}
      {% else %}
        <div style="display: none;"></div>
      {% endif %} ;;
    description: "The percentage change in average latency compared to the previous period."
  }


  measure: average_latency_ms_previous {
    group_label: "Request Latency"
    label: "Average Latency (ms) - Previous Period"
    type: average
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE
        WHEN ${request_completion_raw} >=
             TIMESTAMP_SUB({% date_start analysis_date_filter %},
             INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND ${request_completion_raw} < {% date_start analysis_date_filter %}
        THEN ${request_processing_time}
        ELSE NULL
      END
    {% else %}
      NULL
    {% endif %} ;;
    value_format_name: dynamic_thousands
    description: "The average server processing time (ms) during the timeframe immediately preceding the selected analysis period."
  }

  measure: ninety_five_percentile_request_time_current {
    group_label: "Request Latency"
    label: "95Th Percentile - Request Time (Current Period)"
    type: percentile
    percentile: 95
    sql:
      CASE
        WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
        THEN ${request_processing_time}
        ELSE NULL
      END;;
    value_format_name: dynamic_thousands
    description: "95th percentile request time the selected analysis period. The unit is in Milliseconds."
  }

  measure: ninety_five_percentile_request_time_pop_change {
    group_label: "Request Latency"
    label: "95th Percentile - Request Time (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${ninety_five_percentile_request_time_current} - ${ninety_five_percentile_request_time_previous}),
          ${ninety_five_percentile_request_time_previous}
        )
      {% else %}
        0
      {% endif %};;
    value_format_name: percent_2
    html:
      {% if analysis_date_filter._is_filtered %}
        {{ rendered_value }}
      {% else %}
        <div style="display: none;"></div>
      {% endif %} ;;
    description: "Percentage change in the 95th percentile request time vs the previous period."
  }

  measure: ninety_five_percentile_request_time_previous {
    group_label: "Request Latency"
    label: "95th Percentile - Request Time (Previous Period)"
    type: percentile
    percentile: 95
    sql:
      CASE
        WHEN ${request_completion_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
          ${request_completion_raw} < {% date_start analysis_date_filter %}
        THEN ${request_processing_time}
        ELSE NULL
      END;;
    value_format_name: dynamic_thousands
    description: "95th percentile request time for the period immediately preceding the selection."
  }

  measure: total_client_errors_current {
    group_label: "Request Status"
    label: "Total Client Errors (Current Period)"
    type: sum
    sql:
    CASE
      WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
      AND ${response_status} >= 400 AND ${response_status} < 500
      THEN 1
      ELSE 0
    END ;;
    value_format_name: dynamic_thousands
    description: "The total number of client-side failed requests (HTTP 4xx) specifically within the selected analysis period."
  }

  measure: total_client_errors_pop_change {
    group_label: "Request Status"
    label: "Total Client Errors (PoP Change)"
    type: number
    sql:
    {% if analysis_date_filter._is_filtered %}
      SAFE_DIVIDE(
        (${total_client_errors_current} - ${total_client_errors_previous}),
        ${total_client_errors_previous}
      )
    {% else %}
      0
    {% endif %} ;;
    value_format_name: percent_2
    html:
    {% if analysis_date_filter._is_filtered %}
      {{ rendered_value }}
    {% else %}
      <div style="display: none;"></div>
    {% endif %} ;;
    description: "The percentage change in client errors (4xx) compared to the previous period."
  }

  measure: total_client_errors_previous {
    group_label: "Request Status"
    label: "Total Client Errors (Previous Period)"
    type: sum
    sql:
    CASE
      WHEN ${request_completion_raw} >=
           TIMESTAMP_SUB({% date_start analysis_date_filter %},
           INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
      AND ${request_completion_raw} < {% date_start analysis_date_filter %}
      AND ${response_status} >= 400 AND ${response_status} < 500
      THEN 1
      ELSE 0
    END ;;
    value_format_name: dynamic_thousands
    description: "The total number of client-side failed requests (HTTP 4xx) during the timeframe immediately preceding the selected analysis period."
  }

  measure: total_data_egress_current {
    group_label: "Data Transfer"
    label: "Total Data Egress (Current Period)"
    type: sum
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE WHEN
          {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
        THEN
          {% if size_unit._parameter_value == "PiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 5))
          {% elsif size_unit._parameter_value == "TiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 4))
          {% elsif size_unit._parameter_value == "GiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 3))
          {% elsif size_unit._parameter_value == "MiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 2))
          {% elsif size_unit._parameter_value == "KiB" %}
            CAST(${TABLE}.responseBytes AS FLOAT64) / (1024)
          {% else %}
            CAST(${TABLE}.responseBytes AS FLOAT64)
          {% endif %}
        ELSE 0
        END
      {% else %}
        {% if size_unit._parameter_value == "PiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.responseBytes AS FLOAT64)
        {% endif %}
      {% endif %};;
    html: <span>{{ total_data_egress_aid_current._value }}</span> ;;
    value_format_name: dynamic_thousands
    description: "The total volume of data transferred out of Google Cloud Storage (GCS) specifically within the selected analysis period. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_data_egress_pop_change {
    group_label: "Data Transfer"
    label: "Total Data Egress (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${total_data_egress_current} - ${total_data_egress_previous}),
          ${total_data_egress_previous}
        )
      {% else %}
        0
      {% endif %} ;;
    value_format_name: percent_2
    html:
      {% if analysis_date_filter._is_filtered %}
         {{ rendered_value }}
      {% else %}
         <div style="display: none;"></div>
      {% endif %} ;;
    description: "The percentage change in data egress volume compared to the previous period. A positive value indicates that more data is being transferred out of GCS than in the prior timeframe."
  }

  measure: total_data_egress_previous {
    group_label: "Data Transfer"
    label: "Total Data Egress (Previous Period)"
    type: sum
    value_format: "#,##0.00"
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE WHEN
        ${request_completion_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
        ${request_completion_raw} < {% date_start analysis_date_filter %}
      THEN
        {% if size_unit._parameter_value == "PiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.responseBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.responseBytes AS FLOAT64)
        {% endif %}
      ELSE 0
      END
    {% else %}
      NULL
    {% endif %} ;;
    html: <span>{{ total_data_egress_aid_previous._value }}</span> ;;
    description: "The total volume of data transferred out of Google Cloud Storage (GCS) during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing current data egress trends. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_data_ingress_current {
    group_label: "Data Transfer"
    label: "Total Data Ingress (Current Period)"
    type: sum
    value_format: "#,##0.00"
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE WHEN
        {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
      THEN
        {% if size_unit._parameter_value == "PiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 5))
        {% elsif size_unit._parameter_value == "TiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 4))
        {% elsif size_unit._parameter_value == "GiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 3))
        {% elsif size_unit._parameter_value == "MiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 2))
        {% elsif size_unit._parameter_value == "KiB" %}
          CAST(${TABLE}.requestBytes AS FLOAT64) / (1024)
        {% else %}
          CAST(${TABLE}.requestBytes AS FLOAT64)
        {% endif %}
      ELSE 0
      END
    {% else %}
      {% if size_unit._parameter_value == "PiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 5))
      {% elsif size_unit._parameter_value == "TiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 4))
      {% elsif size_unit._parameter_value == "GiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 3))
      {% elsif size_unit._parameter_value == "MiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 2))
      {% elsif size_unit._parameter_value == "KiB" %}
        CAST(${TABLE}.requestBytes AS FLOAT64) / (1024)
      {% else %}
        CAST(${TABLE}.requestBytes AS FLOAT64)
      {% endif %}
    {% endif %} ;;

    html: <span>{{ total_data_ingress_aid_current._value }}</span> ;;
    description: "The total volume of data uploaded or transferred into Google Cloud Storage (GCS) specifically within the selected analysis period. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_data_ingress_pop_change {
    group_label: "Data Transfer"
    label: "Total Data Ingress (PoP Change)"
    type: number
    sql:
          {% if analysis_date_filter._is_filtered %}
            SAFE_DIVIDE(
              (${total_data_ingress_current} - ${total_data_ingress_previous}),
              ${total_data_ingress_previous}
            )
          {% else %}
            0
          {% endif %} ;;
    value_format_name: percent_2
    html:
          {% if analysis_date_filter._is_filtered %}
             {{ rendered_value }}
          {% else %}
             <div style="display: none;"></div>
          {% endif %} ;;
    description: "The percentage change in data ingress volume compared to the previous period. A positive value indicates that more data is being uploaded or transferred into GCS than in the prior timeframe."
  }

  measure: total_data_ingress_previous {
    group_label: "Data Transfer"
    label: "Total Data Ingress (Previous Period)"
    type: sum
    value_format: "#,##0.00"
    sql:
        {% if analysis_date_filter._is_filtered %}
          CASE WHEN
            ${request_completion_raw} >=
              TIMESTAMP_SUB({% date_start analysis_date_filter %},
              INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
            AND
            ${request_completion_raw} < {% date_start analysis_date_filter %}
          THEN
            {% if size_unit._parameter_value == "PiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 5))
            {% elsif size_unit._parameter_value == "TiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 4))
            {% elsif size_unit._parameter_value == "GiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 3))
            {% elsif size_unit._parameter_value == "MiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (POW(1024, 2))
            {% elsif size_unit._parameter_value == "KiB" %}
              CAST(${TABLE}.requestBytes AS FLOAT64) / (1024)
            {% else %}
              CAST(${TABLE}.requestBytes AS FLOAT64)
            {% endif %}
          ELSE 0
          END
        {% else %}
          NULL
        {% endif %} ;;

    html: <span>{{ total_data_ingress_aid_previous._value }}</span> ;;
    description: "The total volume of data uploaded or transferred into Google Cloud Storage (GCS) during the timeframe immediately preceding the selected analysis period. This serves as the historical baseline for comparing current data ingress trends. The unit scales dynamically based on the 'Throughput Size Unit' parameter."
  }

  measure: total_errors_current {
    group_label: "Request Status"
    label: "Total Errors (Current Period)"
    type: sum
    sql:
    CASE
      WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
      AND ${response_status} >= 400
      THEN 1
      ELSE 0
    END ;;
    value_format_name: dynamic_thousands
    description: "The total number of failed requests (HTTP 400+) specifically within the selected analysis period."
  }

  measure: total_errors_pop_change {
    group_label: "Request Status"
    label: "Total Errors (PoP Change)"
    type: number
    sql:
    {% if analysis_date_filter._is_filtered %}
      SAFE_DIVIDE(
        (${total_errors_current} - ${total_errors_previous}),
        ${total_errors_previous}
      )
    {% else %}
      0
    {% endif %} ;;
    value_format_name: percent_2
    html:
    {% if analysis_date_filter._is_filtered %}
      {{ rendered_value }}
    {% else %}
      <div style="display: none;"></div>
    {% endif %} ;;
    description: "The percentage change in total errors compared to the previous period."
  }

  measure: total_errors_previous {
    group_label: "Request Status"
    label: "Total Errors (Previous Period)"
    type: sum
    sql:
    CASE
      WHEN ${request_completion_raw} >=
           TIMESTAMP_SUB({% date_start analysis_date_filter %},
           INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
      AND ${request_completion_raw} < {% date_start analysis_date_filter %}
      AND ${response_status} >= 400
      THEN 1
      ELSE 0
    END ;;
    value_format_name: dynamic_thousands
    description: "The total number of failed requests (HTTP 400+) during the timeframe immediately preceding the selected analysis period."
  }

  measure: total_requests_current {
    group_label: "Traffic Overview"
    label: "Total Requests (Current Period)"
    type: count_distinct
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE
          WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
          THEN ${request_id}
        END
      {% else %}
        ${request_id}
      {% endif %};;
    value_format_name: dynamic_thousands
    description: "The total number of unique operations processed by Google Cloud Storage specifically within the selected analysis period. This uses a distinct count of Request IDs to ensure accurate traffic volume reporting."
  }

  measure: total_requests_pop_change {
    group_label: "Traffic Overview"
    label: "Total Requests (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${total_requests_current} - ${total_requests_previous}),
          ${total_requests_previous}
        )
      {% else %}
        0
      {% endif %};;
    value_format_name: percent_2
    html:
      {% if analysis_date_filter._is_filtered %}
        {{ rendered_value }}
      {% else %}
        <div style="display: none;"></div>
      {% endif %} ;;
    description: "The percentage change in the total volume of requests compared to the previous period. A positive value indicates an overall increase in traffic to the monitored resources relative to the prior timeframe."
  }

  measure: total_requests_previous {
    group_label: "Traffic Overview"
    label: "Total Requests (Previous Period)"
    type: count_distinct
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE
          WHEN ${request_completion_raw} >=
            TIMESTAMP_SUB({% date_start analysis_date_filter %},
            INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
          AND
            ${request_completion_raw} < {% date_start analysis_date_filter %}
          THEN ${request_id}
        END
      {% else %}
        NULL
      {% endif %};;
    value_format_name: dynamic_thousands
    description: "The total number of unique operations processed by Google Cloud Storage specifically during the timeframe immediately preceding the selected analysis period. This uses a distinct count of Request IDs to ensure accurate traffic volume reporting."
  }

  measure: total_server_errors_current {
    group_label: "Request Status"
    label: "Total Server Errors (Current Period)"
    type: sum
    sql:
      CASE
        WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
        AND ${response_status} >= 500
        THEN 1
        ELSE 0
      END ;;
    value_format_name: dynamic_thousands
    description: "The total number of server-side failed requests (HTTP 500+) specifically within the selected analysis period."
  }

  measure: total_server_errors_pop_change {
    group_label: "Request Status"
    label: "Total Server Errors (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${total_server_errors_current} - ${total_server_errors_previous}),
          ${total_server_errors_previous}
        )
      {% else %}
        0
      {% endif %} ;;
    value_format_name: percent_2
    html:
      {% if analysis_date_filter._is_filtered %}
        {{ rendered_value }}
      {% else %}
        <div style="display: none;"></div>
      {% endif %} ;;
    description: "The percentage change in server errors (5xx) compared to the previous period."
  }

  measure: total_server_errors_previous {
    group_label: "Request Status"
    label: "Total Server Errors (Previous Period)"
    type: sum
    sql:
      CASE
        WHEN ${request_completion_raw} >=
             TIMESTAMP_SUB({% date_start analysis_date_filter %},
             INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND ${request_completion_raw} < {% date_start analysis_date_filter %}
        AND ${response_status} >= 500
        THEN 1
        ELSE 0
      END ;;
    value_format_name: dynamic_thousands
    description: "The total number of server-side failed requests (HTTP 500+) during the timeframe immediately preceding the selected analysis period."
  }

  measure: total_success_requests_current {
    group_label: "Request Status"
    label: "Total Success Requests (Current Period)"
    type: sum
    sql:
      CASE
        WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %}
        AND ${response_status} >= 200 AND ${response_status} < 300
        THEN 1
        ELSE 0
      END;;
    value_format_name: dynamic_thousands
    description: "The total number of successful requests (HTTP 200-299) specifically within the selected analysis period."
  }

  measure: total_success_requests_pop_change {
    group_label: "Request Status"
    label: "Total Success Requests (PoP Change)"
    type: number
    sql:
      {% if analysis_date_filter._is_filtered %}
        SAFE_DIVIDE(
          (${total_success_requests_current} - ${total_success_requests_previous}),
          ${total_success_requests_previous}
        )
      {% else %}
        0
      {% endif %};;
    value_format_name: percent_2
    html:
      {% if analysis_date_filter._is_filtered %}
        {{ rendered_value }}
      {% else %}
        <div style="display: none;"></div>
      {% endif %} ;;
    description: "The percentage change in successful requests compared to the previous period."
  }

  measure: total_success_requests_previous {
    group_label: "Request Status"
    label: "Total Success Requests (Previous Period)"
    type: sum
    sql:
      CASE
        WHEN ${request_completion_raw} >=
          TIMESTAMP_SUB({% date_start analysis_date_filter %},
          INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND)
        AND
          ${request_completion_raw} < {% date_start analysis_date_filter %}
        AND ${response_status} >= 200 AND ${response_status} < 300
        THEN 1
        ELSE 0
      END ;;
    value_format_name: dynamic_thousands
    description: "The total number of successful requests (HTTP 200-299) during the timeframe immediately preceding the selected analysis period."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Aid Period over Period (PoP) Measures -------------------------------
  # --------------------------------------------------------------------------------------------------------

  measure: total_data_egress_aid_current {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END), 0), " B")
        END
      {% else %}
        CASE
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.responseBytes AS FLOAT64)), 0), " B")
        END
      {% endif %} ;;
    description: "A hidden helper measure that formats the Total Data Egress value specifically for the selected analysis period into a human-readable string with the appropriate unit (e.g., '1.5 GiB'). Used for HTML display in period-over-period comparisons."
  }

  measure: total_data_egress_aid_previous {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE
          WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.responseBytes AS FLOAT64) ELSE 0 END), 0), " B")
        END
      {% else %}
        NULL
      {% endif %} ;;
    description: "A hidden helper measure that formats the Total Data Egress value specifically for the timeframe immediately preceding the selected analysis period. It converts the value into a human-readable string with the appropriate unit (e.g., '1.2 GiB') for HTML display."
  }

  measure: total_data_ingress_aid_current {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
      {% if analysis_date_filter._is_filtered %}
        CASE
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= 1024
            THEN CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CASE WHEN {% condition analysis_date_filter %} ${request_completion_raw} {% endcondition %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END), 0), " B")
        END
      {% else %}
        CASE
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 6) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 6), 2), " EiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 5) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 5), 2), " PiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 4) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 4), 2), " TiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 3) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 3), 1), " GiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= POW(1024, 2) THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / POW(1024, 2), 0), " MiB")
          WHEN SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) >= 1024 THEN CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)) / 1024, 0), " KiB")
          ELSE CONCAT(ROUND(SUM(CAST(${TABLE}.requestBytes AS FLOAT64)), 0), " B")
        END
      {% endif %} ;;
    description: "A hidden helper measure that formats the Total Data Ingress value specifically for the selected analysis period into a human-readable string with the appropriate unit (e.g., '2.5 GiB'). Used for HTML display in period-over-period comparisons."
  }

  measure: total_data_ingress_aid_previous {
    group_label: "Data Transfer"
    hidden: yes
    type: string
    sql:
    {% if analysis_date_filter._is_filtered %}
      CASE
        WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 6)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 6), 2), " EiB")
        WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 5)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 5), 2), " PiB")
        WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 4)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 4), 2), " TiB")
        WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 3)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 3), 1), " GiB")
        WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= POW(1024, 2)
          THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / POW(1024, 2), 0), " MiB")
        WHEN SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) >= 1024
          THEN CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END) / 1024, 0), " KiB")
        ELSE CONCAT(ROUND(SUM(CASE WHEN ${request_completion_raw} >= TIMESTAMP_SUB({% date_start analysis_date_filter %}, INTERVAL TIMESTAMP_DIFF({% date_end analysis_date_filter %}, {% date_start analysis_date_filter %}, SECOND) SECOND) AND ${request_completion_raw} < {% date_start analysis_date_filter %} THEN CAST(${TABLE}.requestBytes AS FLOAT64) ELSE 0 END), 0), " B")
      END
    {% else %}
      NULL
    {% endif %} ;;
    description: "A hidden helper measure that formats the Total Data Ingress value specifically for the timeframe immediately preceding the selected analysis period. It converts the value into a human-readable string with the appropriate unit (e.g., '1.2 GiB') for HTML display."
  }

  # --------------------------------------------------------------------------------------------------------
  # ------------------------------- Filters  -------------------------------------
  # --------------------------------------------------------------------------------------------------------

  filter: analysis_date_filter {
    type: date
    label: "Snapshot Start Range"
    description: "Select the date range for analysis. The 'Previous Period' measure will automatically calculate based on this duration."
  }

  # --------------------------------------------------------------------------------------------------------
  # ---------------------------- Parameters -------------------------------
  # --------------------------------------------------------------------------------------------------------

  parameter: size_unit {
    type: unquoted
    label: "Size Unit"

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

  parameter: date_granularity {
    type: unquoted
    label: "Date Granularity"
    description: "This parameter allows users to specify the desired Request Completion Timestamp granularity. The default measure for this parameter is Date and Hour."

    allowed_value: {
      label: "Date and Hour"
      value: "date_hour"
    }

    allowed_value: {
      label: "Date"
      value: "date"
    }

    allowed_value: {
      label: "Year Month"
      value: "year_month"
    }

    allowed_value: {
      label: "Month Name"
      value: "month_name"
    }

    default_value: "date_hour"
  }

  parameter: bucket_project_selector {
    label: "Bucket or Project selector"
    type: unquoted

    allowed_value: {
      label: "Bucket"
      value: "bucket"
    }

    allowed_value: {
      label: "Project Name"
      value: "project_name"
    }

    default_value: "bucket"
    description: "This parameter allows users to specify the desired dimension for the selected Bucket or Project Name. The default value, 'Bucket', displays the Bucket name."
  }

  parameter: dimension_selector {
    label: "Dimension Selector"
    type: unquoted

    allowed_value: {
      label: "HTTP Method"
      value: "http_method"
    }

    allowed_value: {
      label: "Status"
      value: "status"
    }

    allowed_value: {
      label: "Request Host"
      value: "request_host"
    }

    allowed_value: {
      label: "Request Operation"
      value: "request_operation"
    }

    allowed_value: {
      label: "Location"
      value: "location"
    }

    allowed_value: {
      label: "Storage Class"
      value: "storage_class"
    }

    default_value: "http_method"
    description: "This parameter allows users to specify the desired dimension. The default value: 'HTTP Method."
  }

  parameter: aggregate_function {
    label: "Selected Metric"
    type: unquoted

    allowed_value: {
      label: "Total Requests"
      value: "total_requests"
    }

    allowed_value: {
      label: "Total POST Requests"
      value: "total_post_requests"
    }

    allowed_value: {
      label: "Total PUT Requests"
      value: "total_put_requests"
    }

    allowed_value: {
      label: "Total PATCH Requests"
      value: "total_patch_requests"
    }

    allowed_value: {
      label: "Total DELETE Requests"
      value: "total_delete_requests"
    }

    allowed_value: {
      label: "95th Percentile - Request Time"
      value: "ninety_five_percentile_request_time"
    }

    allowed_value: {
      label: "Total Success Requests"
      value: "total_success_requests"
    }

    allowed_value: {
      label: "Total Errors"
      value: "total_errors"
    }

    allowed_value: {
      label: "Total Client Errors"
      value: "total_client_errors"
    }

    allowed_value: {
      label: "Total Server Errors"
      value: "total_server_errors"
    }

    default_value: "total_requests"
    description: "This parameter allows users to specify the desired measure for the selected measure metric. The default value, 'Total Requests', displays the Total Request metric."
  }

  parameter: prefix_depth {

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
      label: "Full Prefix"
      value: "full_prefix"
    }

    default_value: "full_prefix"
    description: "This parameter allows users to specify the prefix depth for the prefix dimension. The default value, 'Full Prefix', displays the complete prefix for objects within a directory hierarchy."
  }
}
