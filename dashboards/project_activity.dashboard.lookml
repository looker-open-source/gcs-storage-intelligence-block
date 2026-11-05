---
- dashboard: project_activity
  title: GCS Storage Intelligence - Project Activity
  preferred_viewer: dashboards-next
  style: modern
  description: ''
  preferred_slug: IJVLmGw3j18uE47Opvn3xC
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: 'Total # of requests'
    name: 'Total # of requests'
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.total_requests_current, project_activity.total_requests_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Total # of requests'
    smart_single_value_size: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Aggregates the total volume of object-level API operations (e.g., GET,
      PUT) against selected projects. This metric includes all requests, regardless
      of status, serving as the primary baseline for system load and access frequency.
    aria_description: Aggregates the total volume of object-level API operations (e.g.,
      GET, PUT) against selected projects. This metric includes all requests, regardless
      of status, serving as the primary baseline for system load and access frequency.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
    row: 12
    col: 6
    width: 12
    height: 4
    tab_name: ''
  - title: Total success responses
    name: Total success responses
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.total_success_responses_current, project_activity.total_success_responses_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total success responses
    smart_single_value_size: false
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Aggregates the total volume of API operations that completed successfully,
      returning a 2xx series HTTP status code. This indicator represents the effective
      throughput of the system, excluding all requests that resulted in client-side
      (4xx) or server-side (5xx) errors.
    aria_description: The total count of object-level API requests that resulted in
      a successful response (HTTP 2xx status). This metric tracks the volume of effective
      operations, filtering out client and server errors.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
    row: 12
    col: 18
    width: 12
    height: 4
    tab_name: ''
  - title: Total data egress
    name: Total data egress
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.total_data_egress_current, project_activity.total_data_egress_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total data egress
    smart_single_value_size: false
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Displays the total amount of data read from the storage environment.
      This metric tracks egress volume, serving as a key indicator of data retrieval
      intensity and network consumption.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Throughput size unit: project_activity.throughput_size_unit
    row: 12
    col: 30
    width: 12
    height: 4
    tab_name: ''
  - title: Total data ingress
    name: Total data ingress
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.total_data_ingress_current, project_activity.total_data_ingress_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total data ingress
    smart_single_value_size: false
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Displays the total amount of data written into the storage environment.
      This metric tracks ingestion volume, serving as a key indicator of write intensity
      and new data accumulation.
    aria_description: The total volume of data uploaded to the selected projects (ingress).
      This metric measures the cumulative size of all incoming write operations.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Throughput size unit: project_activity.throughput_size_unit
    row: 12
    col: 42
    width: 12
    height: 4
    tab_name: ''
  - title: Total read requests
    name: Total read requests
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.total_read_requests_current, project_activity.total_read_requests_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total read requests
    smart_single_value_size: false
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Displays the cumulative count of read operations performed on the storage
      environment. This metric measures how often your data is being accessed or downloaded
      by users and applications.
    aria_description: The total count of object-level read requests (e.g., GET operations).
      This metric measures the volume of data retrieval and access events.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
    row: 12
    col: 54
    width: 12
    height: 4
    tab_name: ''
  - title: Error rate
    name: Error rate
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.error_rate_current, project_activity.error_rate_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Error rate
    smart_single_value_size: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the proportion of failed operations within the storage environment.
      This metric monitors system reliability, where a lower percentage indicates
      healthier application integration and stability.
    aria_description: The percentage of object-level API requests that resulted in
      an error (HTTP 4xx or 5xx status). This metric measures the rate of failed operations.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
    row: 16
    col: 12
    width: 12
    height: 4
    tab_name: ''
  - title: Total server errors
    name: Total server errors
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.total_server_error_responses_current, project_activity.total_server_error_responses_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total server errors
    smart_single_value_size: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the cumulative volume of internal system errors. Unlike client
      errors (4xx), these failures indicate issues with the storage service infrastructure
      or availability.
    aria_description: The total count of object-level API requests that resulted in
      a server error (HTTP 5xx). This metric measures the volume of internal system
      failures.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
    row: 16
    col: 24
    width: 12
    height: 4
    tab_name: ''
  - title: Total client errors
    name: Total client errors
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.total_client_error_responses_current, project_activity.total_client_error_responses_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total client errors
    smart_single_value_size: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: The total number of object-level API requests that resulted in a client-side
      error (HTTP 4xx), representing invalid or unauthorized operations.
    aria_description: The total count of object-level API requests that resulted in
      a client error (HTTP 4xx). This metric measures the volume of invalid or unauthorized
      requests.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
    row: 16
    col: 36
    width: 12
    height: 4
    tab_name: ''
  - title: Total limit exceeded errors
    name: Total limit exceeded errors
    model: gcs_storage_intelligence
    explore: project_activity
    type: single_value
    fields: [project_activity.total_429_error_responses_current, project_activity.total_429_error_responses_pop_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total 429 errors
    smart_single_value_size: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Aggregates the total count of object-level API operations that failed
      with an HTTP 429 "Too Many Requests" status. This indicator measures the volume
      of requests rejected because the client application exceeded the provisioned
      rate limits (QPS or bandwidth quotas).
    aria_description: The total count of object-level API requests that resulted in
      a 429 error (Too Many Requests). This metric measures the volume of rate-limited
      operations.
    listen:
      1 - Snapshot start date: project_activity.analysis_date_filter
      2 - Project name: project_attributes.project_name
    row: 16
    col: 48
    width: 12
    height: 4
    tab_name: ''
  - title: Volume trend
    name: Volume trend
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_line
    fields: [project_activity.snapshot_start_dynamic, project_activity.selected_measure]
    filters:
      project_activity.date_granularity: date^_hour
      project_activity.aggregate_function: total^_requests
    sorts: [project_activity.snapshot_start_dynamic desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: project_activity.selected_measure,
            id: project_activity.selected_measure, name: Total Requests}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      project_activity.selected_measure: "#880E4F"
    trend_lines: [{color: "#C2185B", label_position: right, order: 3, period: 7, regression_type: polynomial,
        series_index: 1, show_label: false}]
    defaults_version: 1
    show_null_labels: true
    note_state: collapsed
    note_display: hover
    note_text: A dynamic time-series visualization that renders the historical trend
      for the specific indicator currently chosen in the "Selected Metric" filter.
      This chart enables temporal analysis (e.g., seasonality, spikes, anomalies)
      across various operational dimensions, such as Request Volume, Data Throughput
      (Ingress/Egress), or Error Counts.
    aria_description: A dynamic line chart showing the trend over time for the metric
      currently active in the 'Selected Metric' filter. The Y-axis values update to
      reflect the chosen data point (e.g., Total Requests, Data Egress, or Error counts).
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
      Time selection: project_activity.date_granularity
      Historical analysis - metric selection: project_activity.aggregate_function
      3 - Throughput size unit: project_activity.throughput_size_unit
    row: 32
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Error rate trends
    name: Error rate trends
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_line
    fields: [project_activity.snapshot_start_dynamic, project_activity.error_rate,
      project_activity.total_server_error_responses, project_activity.total_client_error_responses,
      project_activity.total_requests]
    filters:
      project_activity.date_granularity: date^_hour
      project_activity.aggregate_function: total^_requests
    sorts: [project_activity.snapshot_start_dynamic desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: project_activity.error_rate,
            id: project_activity.error_rate, name: Error Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: project_activity.total_server_error_responses,
            id: project_activity.total_server_error_responses, name: Total Server
              Error Responses}, {axisId: project_activity.total_requests, id: project_activity.total_requests,
            name: Total Requests}, {axisId: project_activity.total_client_error_responses,
            id: project_activity.total_client_error_responses, name: Total Client
              Error Responses}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      project_activity.selected_measure: "#880E4F"
    trend_lines: [{color: "#C2185B", label_position: right, order: 3, period: 7, regression_type: polynomial,
        series_index: 1, show_label: false}]
    defaults_version: 1
    show_null_labels: true
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Monitors system health trends over time by displaying the Error Rate
      alongside the volume of specific error types and total traffic. Use this view
      to determine if rising errors are proportional to traffic growth or indicative
      of a specific failure mode (Client vs. Server).
    aria_description: A multi-line chart displaying trends for Error Rate, Total Server
      Errors, Total Client Errors, and Total Requests over time. This visualization
      correlates failure percentages with traffic volume and specific error types.
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
      Time selection: project_activity.date_granularity
      3 - Throughput size unit: project_activity.throughput_size_unit
    row: 50
    col: 0
    width: 72
    height: 20
    tab_name: ''
  - title: Box plot distribution by selected metric
    name: Box plot distribution by selected metric
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_boxplot
    fields: [project_activity.selected_minimum, project_activity.snapshot_start_dynamic,
      project_activity.selected_quarter_percentile, project_activity.selected_median,
      project_activity.selected_three_quarter_percentile, project_activity.selected_maximum]
    filters:
      project_activity.aggregate_function: total^_requests
      project_activity.date_granularity: date
    sorts: [project_activity.snapshot_start_dynamic desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: A statistical box-and-whisker plot displaying the daily distribution
      of the selected metric across all projects. This chart visualizes the median,
      interquartile range (IQR), and minimum/maximum values, allowing you to assess
      the volatility and spread of operational load (e.g., Requests, Errors) day by
      day.
    aria_description: A box plot showing the daily statistical distribution (minimum,
      maximum, median, and quartiles) for the metric currently active in the 'Selected
      Metric' filter. This chart highlights variability and outliers in daily project
      activity.
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
      Time selection: project_activity.date_granularity
      Historical analysis - metric selection II: project_activity.aggregate_function
      3 - Throughput size unit: project_activity.throughput_size_unit
    row: 74
    col: 0
    width: 72
    height: 22
    tab_name: ''
  - title: Total data ingress and total data egress by time
    name: Total data ingress and total data egress by time
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_line
    fields: [project_activity.total_data_ingress, project_activity.total_data_egress,
      project_activity.snapshot_start_date_hour]
    sorts: [project_activity.snapshot_start_date_hour desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Monitors network traffic flow by contrasting incoming data (Ingress)
      against outgoing data (Egress). Use this view to track bandwidth consumption
      trends and determine if your storage is primarily being used for archival (ingestion)
      or distribution (retrieval).
    aria_description: A dual-line chart comparing Total Data Ingress and Total Data
      Egress trends over time. This visualization contrasts the volume of incoming
      data (uploads) against outgoing data (downloads).
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
      Time selection: project_activity.date_granularity
      3 - Throughput size unit: project_activity.throughput_size_unit
    row: 96
    col: 0
    width: 72
    height: 24
    tab_name: ''
  - title: Top 10 projects by selected metric
    name: Top 10 projects by selected metric
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_bar
    fields: [project_attributes.project_name, project_activity.selected_measure]
    filters:
      project_activity.aggregate_function: total^_requests
    sorts: [project_activity.selected_measure desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      project_activity.selected_measure: "#F06292"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: A dual-chart comparative view designed for correlation analysis. The
      left chart displays the top projects ranked by the Primary Metric (Filter 4),
      while the right chart displays the top projects ranked by the Comparison Metric
      (Filter 6). This side-by-side layout allows you to visually validate relationships
      between different operational indicators (e.g., correlating Total Requests with
      Total Client Errors).
    aria_description: Two side-by-side bar charts comparing the top 10 projects across
      two different metrics. The first chart reflects the 'Selected Metric' (Filter
      6), and the second chart reflects the 'Comparison Metric' (Filter 6), allowing
      for visual correlation of project performance.
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
      3 - Throughput size unit: project_activity.throughput_size_unit
      Comparison Selected Metric: project_activity.aggregate_function
    row: 148
    col: 0
    width: 36
    height: 20
    tab_name: ''
  - title: Top 10 projects by selected metric
    name: Top 10 projects by selected metric (2)
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_bar
    fields: [project_attributes.project_name, project_activity.selected_measure]
    filters:
      project_activity.aggregate_function: total^_requests
    sorts: [project_activity.selected_measure desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      project_activity.selected_measure: "#9FA8DA"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: A dual-chart comparative view designed for correlation analysis. The
      left chart displays the top projects ranked by the Primary Metric (Filter 4),
      while the right chart displays the top projects ranked by the Comparison Metric
      (Filter 6). This side-by-side layout allows you to visually validate relationships
      between different operational indicators (e.g., correlating Total Requests with
      Total Client Errors).
    aria_description: Two side-by-side bar charts comparing the top 10 projects across
      two different metrics. The first chart reflects the 'Selected Metric' (Filter
      6), and the second chart reflects the 'Comparison Metric' (Filter 6), allowing
      for visual correlation of projects performance.
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
      3 - Throughput size unit: project_activity.throughput_size_unit
      Comparison - metric selection II: project_activity.aggregate_function
    row: 148
    col: 36
    width: 36
    height: 20
    tab_name: ''
  - title: Mutation requests over time
    name: Mutation requests over time
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_column
    fields: [project_activity.total_write_requests, project_activity.total_update_requests,
      project_activity.total_delete_requests, project_activity.snapshot_start_date_hour]
    sorts: [project_activity.snapshot_start_date_hour desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'A 100% stacked bar chart displaying the distribution of data modification
      operations (Mutations) over time. It segments the workload into three distinct
      categories: Write Requests (creation), Update Requests (modification), and Delete
      Requests (removal). Use this view to analyze the operational lifecycle and the
      changing nature of data interaction (e.g., heavy ingestion vs. cleanup phases).'
    aria_description: A 100% stacked bar chart showing the daily ratio of data mutation
      types. It compares the proportion of Total Write Requests, Total Update Requests,
      and Total Delete Requests over time.
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
    row: 120
    col: 0
    width: 72
    height: 20
    tab_name: ''
  - title: 4xx status distribution
    name: 4xx status distribution
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_pie
    fields: [client_error_status.client_error_label, project_activity.total_client_error_status_requests]
    sorts: [client_error_status.client_error_label]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
      custom:
        id: 002e7559-e8d9-f3a5-3a70-d7a51f3cf19b
        label: Custom
        type: continuous
        stops:
        - color: "#FFB300"
          offset: 0
        - color: "#FFECB3"
          offset: 100
      options:
        steps: 5
    series_colors: {}
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: A detailed breakdown of Client Error (4xx) responses by specific HTTP
      status code. This visualization segments the aggregate client error volume into
      distinct categories such as 400 Bad Request (syntax issues), 403 Forbidden (permissions),
      and 429 Too Many Requests (throttling), facilitating targeted root-cause analysis
      for failed operations.
    aria_description: A donut chart showing the percentage distribution of specific
      4xx error codes. It breaks down client errors into categories like 400 Bad Request,
      403 Forbidden, and 429 Too Many Requests.
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
    row: 172
    col: 36
    width: 36
    height: 16
    tab_name: ''
  - title: Status distribution
    name: Status distribution
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_pie
    fields: [status_values.status_label, project_activity.total_requests_per_status]
    sorts: [status_values.status_label]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
      palette_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce-categorical-0
      options:
        steps: 5
    series_colors:
      2xx: "#7CB342"
      4xx: "#F9AB00"
      5xx: "#EA4335"
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'A donut chart illustrating the proportional distribution of HTTP response
      status codes across all processed requests. It segments traffic into three primary
      categories: Success (2xx series), Client Errors (4xx series), and Server Errors
      (5xx series). This view is essential for assessing the overall reliability and
      error composition of the workload.'
    aria_description: A donut chart showing the percentage distribution of HTTP status
      codes. It compares the volume of successful requests (2xx) against client errors
      (4xx) and server errors (5xx).
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
    row: 172
    col: 0
    width: 36
    height: 16
    tab_name: ''
  - title: Top projects by number of requests
    name: Top projects by number of requests
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_column
    fields: [project_attributes.project_name, project_activity.total_requests]
    sorts: [project_activity.total_requests desc]
    limit: 20
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      project_activity.total_requests: "#4CAF50"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: A bar chart ranking storage projects in descending order based on the
      aggregate volume of API requests received. This visualization isolates the specific
      containers contributing the most to overall system load, facilitating hotspot
      identification and resource allocation analysis.
    aria_description: A bar chart displaying the top projects ranked by total number
      of requests. This visualization identifies the most active storage containers
      in the system.
    modern2026: true
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
    row: 192
    col: 0
    width: 72
    height: 22
    tab_name: ''
  - title: Most active projects
    name: Most active projects
    model: gcs_storage_intelligence
    explore: project_activity
    type: looker_grid
    fields: [project_attributes.project_name, project_activity.total_requests, project_activity.total_errors,
      project_activity.total_data_egress]
    sorts: [project_activity.total_requests desc 0, project_activity.total_data_egress
        desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: looker_2026
      options:
        mirror: false
        reverse: false
        stepped: false
      palette_id: looker_2026_categorical_1
    modern2026: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      project_activity.total_requests:
        is_active: false
    table_show_footer: false
    table_enable_pagination: false
    table_page_size_options: 20, 50, 100
    table_column_hover_highlight_enable: false
    table_show_headers: true
    header_font_bold: false
    header_font_italic: false
    cell_font_weight: ''
    cell_font_style: ''
    cell_text_alignment: ''
    table_custom_border_enable: false
    table_custom_border_width:
    table_custom_border_style: solid
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'A detailed tabular view listing individual storage projects with their
      corresponding key performance indicators: Project Name, Total Requests, Total Errors,
      and Total Data Egress. This detailed breakdown supports granular analysis, allowing
      you to correlate high traffic volume with specific error counts or bandwidth
      usage at the project level.'
    listen:
      1 - Snapshot start date: project_activity.snapshot_start_date
      2 - Project name: project_attributes.project_name
      3 - Throughput size unit: project_activity.throughput_size_unit
    row: 214
    col: 0
    width: 72
    height: 12
    tab_name: ''
  - type: button
    name: button_425
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#80868B","href":"/dashboards/gcs_storage_intelligence::bucket_activity"}'
    row: 226
    col: 0
    width: 9
    height: 4
    tab_name: ''
  - type: button
    name: button_426
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#80868B","href":"/dashboards/gcs_storage_intelligence::object_events"}'
    row: 226
    col: 63
    width: 9
    height: 4
    tab_name: ''
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\
      \ \n    background-color: #ffffff; \n    border: 1px solid #dadce0; \n    border-radius:\
      \ 8px; \n    box-shadow: 0 1px 2px 0 rgba(60,64,67,0.3), 0 1px 3px 1px rgba(60,64,67,0.15);\n\
      \    margin-bottom: 20px;\n    overflow: hidden;\n\">\n\n  <nav style=\"\n \
      \     font-size: 18px;\n      font-weight: 500;\n      display: flex; \n   \
      \   justify-content: center; \n      align-items: center;\n      border-bottom:\
      \ 1px solid #f1f3f4;\n      background-color: #fff;\n  \">\n    <a style=\"\n\
      \        padding: 18px 24px; \n        text-decoration: none; \n        color:\
      \ #5f6368; \n        font-weight: 500; \n        border-bottom: 3px solid transparent;\
      \ \n        transition: background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::general_analysis\"\
      >General Analysis</a>\n    \n    <a style=\"\n        padding: 18px 24px; \n\
      \        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500;\n        border-bottom: 3px solid transparent; \n        transition:\
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::cost_management\"\
      >Cost Management</a>\n    \n    <a style=\"\n        padding: 18px 24px; \n\
      \        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500;\n        border-bottom: 3px solid transparent; \n        transition:\
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::security_and_compliance\"\
      >Security & Compliance</a>\n    \n    <a style=\"\n        padding: 18px 24px;\
      \ \n        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500;\n        border-bottom: 3px solid transparent; \n        transition:\
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::context_catalog\"\
      >Context Catalog</a>\n  </nav>\n\n  <nav style=\"\n      font-size: 16px;\n\
      \      display: flex; \n      justify-content: center; \n      align-items:\
      \ center;\n      gap: 16px; \n      padding: 16px 0;\n      background-color:\
      \ #fff;\n  \">\n    \n    <a style=\"\n        padding: 8px 20px; \n       \
      \ text-decoration: none; \n        color: #5f6368; \n        font-weight: 500;\
      \ \n        border-radius: 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::bucket_activity\"\
      >Bucket Activity</a>\n    \n    <a style=\"\n        padding: 8px 20px; \n \
      \       text-decoration: none; \n        color: #1967d2; \n        background-color:\
      \ #e8f0fe; \n        font-weight: 700; \n        border-radius: 24px;\n    \
      \    letter-spacing: 0.2px;\n    \" href=\"#\">Project Activity</a>\n    \n\
      \    <a style=\"\n        padding: 8px 20px; \n        text-decoration: none;\
      \ \n        color: #5f6368; \n        font-weight: 500; \n        border-radius:\
      \ 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::object_events\"\
      >Object Events</a>\n    \n    <a style=\"\n        padding: 8px 20px; \n   \
      \     text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500; \n        border-radius: 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::bucket_region_activity\"\
      >Bucket Region Activity</a>\n  </nav>\n\n</div>"
    row: 0
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="
          font-family: 'Google Sans', Roboto, Arial, sans-serif;
          color: #5f6368;
          border-bottom: 2px solid #c4c4c4;
          padding: 0 0 8px 0;
          margin-bottom: 16px;
          font-size: 20px;
          font-weight: 600;
      ">
          Key performance indicators (KPIs)
      </div>
    row: 8
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - name: " "
    type: text
    title_text: " "
    subtitle_text: ''
    body_text: |-
      <div style="
          font-family: 'Google Sans', Roboto, Arial, sans-serif;
          color: #5f6368;
          border-bottom: 2px solid #c4c4c4;
          padding: 0 0 8px 0;
          margin-bottom: 16px;
          font-size: 20px;
          font-weight: 600;
      ">
          Historical analysis
      </div>
    row: 20
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: ''
    row: 16
    col: 60
    width: 12
    height: 4
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="
          font-family: 'Google Sans', Roboto, Arial, sans-serif;
          color: #5f6368;
          border-bottom: 2px solid #c4c4c4;
          padding: 0 0 8px 0;
          margin-bottom: 16px;
          font-size: 20px;
          font-weight: 600;
      ">
          Comparison
      </div>
    row: 140
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="
          font-family: 'Google Sans', Roboto, Arial, sans-serif;
          color: #5f6368;
          border-bottom: 2px solid #c4c4c4;
          padding: 0 0 8px 0;
          margin-bottom: 16px;
          font-size: 20px;
          font-weight: 600;
      ">
          Error distribution
      </div>
    row: 168
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="
          font-family: 'Google Sans', Roboto, Arial, sans-serif;
          color: #5f6368;
          border-bottom: 2px solid #c4c4c4;
          padding: 0 0 8px 0;
          margin-bottom: 16px;
          font-size: 20px;
          font-weight: 600;
      ">
          Project insights
      </div>
    row: 188
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - type: filter
    name: Historical analysis - metric selection
    row: 28
    col: 2
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Time selection
    row: 24
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Historical analysis - metric selection II
    row: 70
    col: 2
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Comparison - metric selection II
    row: 144
    col: 36
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Comparison Selected Metric
    row: 144
    col: 1
    width: 12
    height: 4
    tab_name: ''
  filters:
  - name: 1 - Snapshot start date
    title: 1 - Snapshot start date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: project_activity
    listens_to_filters: []
    field: project_activity.snapshot_start_date
  - name: 2 - Project name
    title: 2 - Project name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: project_activity
    listens_to_filters: []
    field: project_attributes.project_name
  - name: 3 - Throughput size unit
    title: 3 - Throughput size unit
    type: field_filter
    default_value: TiB
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: project_activity
    listens_to_filters: []
    field: project_activity.throughput_size_unit
  - name: Time selection
    title: Time selection
    type: field_filter
    default_value: date
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: project_activity
    listens_to_filters: []
    field: project_activity.date_granularity
  - name: Historical analysis - metric selection
    title: Historical analysis - metric selection
    type: field_filter
    default_value: total^_requests
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: project_activity
    listens_to_filters: []
    field: project_activity.aggregate_function
  - name: Historical analysis - metric selection II
    title: Historical analysis - metric selection II
    type: field_filter
    default_value: total^_requests
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: project_activity
    listens_to_filters: []
    field: project_activity.aggregate_function
  - name: Comparison Selected Metric
    title: Comparison Selected Metric
    type: field_filter
    default_value: total^_requests
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: project_activity
    listens_to_filters: []
    field: project_activity.aggregate_function
  - name: Comparison - metric selection II
    title: Comparison - metric selection II
    type: field_filter
    default_value: total^_requests
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: project_activity
    listens_to_filters: []
    field: project_activity.aggregate_function
