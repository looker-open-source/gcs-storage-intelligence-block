---
- dashboard: object_events
  title: GCS Storage Intelligence - Object Events
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: UmK2s6F4jNnJpyVxlwExt8
  theme_name: ''
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
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
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::error_and_events\"\
      >Error & Events</a>\n  </nav>\n\n  <nav style=\"\n      font-size: 16px;\n \
      \     display: flex; \n      justify-content: center; \n      align-items: center;\n\
      \      gap: 16px; \n      padding: 16px 0;\n      background-color: #fff;\n\
      \  \">\n    \n    <a style=\"\n        padding: 8px 20px; \n        text-decoration:\
      \ none; \n        color: #5f6368; \n        font-weight: 500; \n        border-radius:\
      \ 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::bucket_activity\"\
      >Bucket Activity</a>\n    \n    <a style=\"\n        padding: 8px 20px; \n \
      \       text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500; \n        border-radius: 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::project_activity\"\
      >Project Activity</a>\n    \n    <a style=\"\n        padding: 8px 20px; \n\
      \        text-decoration: none; \n        color: #1967d2; \n        background-color:\
      \ #e8f0fe; \n        font-weight: 700; \n        border-radius: 24px;\n    \
      \    letter-spacing: 0.2px;\n    \" href=\"#\">Object Events</a>\n    \n   \
      \ <a style=\"\n        padding: 8px 20px; \n        text-decoration: none; \n\
      \        color: #5f6368; \n        font-weight: 500; \n        border-radius:\
      \ 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::bucket_region_activity\"\
      >Bucket Region Activity</a>\n  </nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 4
    tab_name: ''
  - type: button
    name: button_274
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::bucket_region_activity"}'
    row: 145
    col: 21
    width: 3
    height: 2
    tab_name: ''
  - title: 'Total # of requests'
    name: 'Total # of requests'
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_requests]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Total # of requests'
    smart_single_value_size: false
    defaults_version: 1
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 14
    col: 2
    width: 4
    height: 2
    tab_name: ''
  - title: 95th Percentile processing time [ms]
    name: 95th Percentile processing time [ms]
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.ninety_five_percentile_request_time]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 95th Percentile processing time [ms]
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 14
    col: 6
    width: 4
    height: 2
    tab_name: ''
  - title: Total data egress
    name: Total data egress
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_data_egress]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total data egress
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      8 - Size Unit: object_events.size_unit
      4 - HTTP Method: object_events.request_http_method
    row: 14
    col: 10
    width: 4
    height: 2
    tab_name: ''
  - title: Total data ingress
    name: Total data ingress
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_data_ingress]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total data ingress
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      8 - Size Unit: object_events.size_unit
      4 - HTTP Method: object_events.request_http_method
    row: 14
    col: 14
    width: 4
    height: 2
    tab_name: ''
  - title: 'Total # of success requests'
    name: 'Total # of success requests'
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_success_requests]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 'Total # of success requests'
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 14
    col: 18
    width: 4
    height: 2
    tab_name: ''
  - title: Total errors
    name: Total errors
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_errors]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total errors
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 16
    col: 4
    width: 4
    height: 2
    tab_name: ''
  - title: Total client errors
    name: Total client errors
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_client_errors]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total client errors
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 16
    col: 8
    width: 4
    height: 2
    tab_name: ''
  - title: Total server errors
    name: Total server errors
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_server_errors]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total server errors
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 16
    col: 12
    width: 4
    height: 2
    tab_name: ''
  - title: Average latency (ms)
    name: Average latency (ms)
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.average_latency_ms]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average latency (ms)
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 16
    col: 16
    width: 4
    height: 2
    tab_name: ''
  - title: Requests Over Time
    name: Requests Over Time
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_line
    fields: [object_events.request_completion_dynamic, object_events.total_delete_requests,
      object_events.total_patch_requests, object_events.total_post_requests, object_events.total_put_requests]
    filters:
      object_events.date_granularity: date^_hour
    sorts: [object_events.request_completion_dynamic desc]
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
    hidden_series: []
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 69
    col: 0
    width: 24
    height: 9
    tab_name: ''
  - title: Top Prefixes by Selected Measure
    name: Top Prefixes by Selected Measure
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_grid
    fields: [object_events.prefix, object_events.selected_measure]
    filters:
      object_events.prefix_depth: full^_prefix
      object_events.aggregate_function: total^_requests
    sorts: [object_events.selected_measure desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_events.selected_measure:
        is_active: false
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
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      10 - Prefix Depth: object_events.prefix_depth
      9 - Selected Metric: object_events.aggregate_function
      8 - Size Unit: object_events.size_unit
      4 - HTTP Method: object_events.request_http_method
    row: 23
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - title: Top Buckets or Projects by Selected Metric
    name: Top Buckets or Projects by Selected Metric
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_bar
    fields: [object_events.bucket_project_selection, object_events.selected_measure]
    filters:
      object_events.bucket_project_selector: bucket
      object_events.aggregate_function: total^_requests
    sorts: [object_events.selected_measure desc]
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
      object_events.selected_measure: "#9FA8DA"
    defaults_version: 1
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      11 - Bucket or Project selector: object_events.bucket_project_selector
      9 - Selected Metric: object_events.aggregate_function
      8 - Size Unit: object_events.size_unit
      4 - HTTP Method: object_events.request_http_method
    row: 95
    col: 0
    width: 12
    height: 9
    tab_name: ''
  - title: Top Projects or Buckets by Selected Metric
    name: Top Projects or Buckets by Selected Metric
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_bar
    fields: [object_events.bucket_project_selection, object_events.selected_measure]
    filters:
      object_events.bucket_project_selector: project^_name
      object_events.aggregate_function: total^_requests
    sorts: [object_events.selected_measure desc]
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
      object_events.selected_measure: "#F06292"
    defaults_version: 1
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      11 - Bucket or Project selector: object_events.bucket_project_selector
      12 - Comparison Selected Metric: object_events.aggregate_function
      8 - Size Unit: object_events.size_unit
      4 - HTTP Method: object_events.request_http_method
    row: 95
    col: 12
    width: 12
    height: 9
    tab_name: ''
  - title: Top Distribution
    name: Top Distribution
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_pie
    fields: [object_events.dimension_selection, object_events.selected_measure]
    filters:
      object_events.dimension_selector: http^_method
      object_events.aggregate_function: total^_requests
    sorts: [object_events.selected_measure desc]
    limit: 10
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
      custom:
        id: 618e07b6-f688-ee02-0621-c722b730f48f
        label: Custom
        type: continuous
        stops:
        - color: "#3F51B5"
          offset: 0
        - color: "#C5CAE9"
          offset: 100
      options:
        steps: 5
        reverse: true
    series_colors: {}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      object_events.selected_measure:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    hide_totals: false
    hide_row_totals: false
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      13 - Dimension Selector: object_events.dimension_selector
      9 - Selected Metric: object_events.aggregate_function
      8 - Size Unit: object_events.size_unit
      4 - HTTP Method: object_events.request_http_method
    row: 33
    col: 0
    width: 24
    height: 10
    tab_name: ''
  - title: Requests Status Over Time
    name: Requests Status Over Time
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_line
    fields: [object_events.request_completion_dynamic, object_events.total_client_errors,
      object_events.total_server_errors, object_events.total_success_requests]
    filters:
      object_events.date_granularity: date^_hour
    sorts: [object_events.request_completion_dynamic desc]
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
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_colors:
      object_events.total_client_errors: "#F9AB00"
      object_events.total_server_errors: "#EA4335"
      object_events.total_success_requests: "#7CB342"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      9 - Selected Metric: object_events.aggregate_function
      4 - HTTP Method: object_events.request_http_method
    row: 80
    col: 0
    width: 24
    height: 10
    tab_name: ''
  - title: Created and Deleted Storage Size Over Time
    name: Created and Deleted Storage Size Over Time
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_line
    fields: [object_events.request_completion_dynamic, object_events.total_created_storage_size,
      object_events.total_deleted_storage_size]
    filters:
      object_events.date_granularity: date^_hour
      object_events.is_error_request: 'No'
    sorts: [object_events.request_completion_dynamic desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: object_events.total_created_storage_size,
            id: object_events.total_created_storage_size, name: Total Created Storage
              Size}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: object_events.total_deleted_storage_size, id: object_events.total_deleted_storage_size,
            name: Total Deleted Storage Size}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_colors:
      object_events.total_client_errors: "#F9AB00"
      object_events.total_server_errors: "#EA4335"
      object_events.total_success_requests: "#7CB342"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      8 - Size Unit: object_events.size_unit
      4 - HTTP Method: object_events.request_http_method
    row: 54
    col: 0
    width: 24
    height: 10
    tab_name: ''
  - title: Error Details
    name: Error Details
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_grid
    fields: [object_events.request_completion_time, object_events.request_http_method,
      object_events.object_name, object_events.response_status, object_events.error_reason]
    filters:
      object_events.is_error_request: 'Yes'
    sorts: [object_events.request_completion_time desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
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
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      14 - Object Name: object_events.object_name
      4 - HTTP Method: object_events.request_http_method
    row: 109
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - title: Top Error-Prone Objects
    name: Top Error-Prone Objects
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_grid
    fields: [object_events.bucket_name, object_events.object_name, object_events.response_status,
      object_events.total_requests]
    filters:
      object_events.is_error_request: 'Yes'
    sorts: [object_events.total_requests desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      object_events.total_requests: Total Errors
    series_cell_visualizations:
      object_events.total_requests:
        is_active: false
    series_value_format:
      object_events.total_requests:
        name: id
        format_string: '0'
        label: ID
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
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 119
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - title: Top 429 Error Reasons
    name: Top 429 Error Reasons
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_grid
    fields: [object_events.error_reason, object_events.total_requests]
    filters:
      object_events.is_too_many_requests_error: 'Yes'
    sorts: [object_events.total_requests desc 0]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_events.total_requests:
        is_active: true
        palette:
          palette_id: c9babd1b-cc61-55f2-cb19-599da61e9942
          collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
          custom_colors:
          - "#E1BEE7"
          - "#6A1B9A"
    series_value_format:
      object_events.total_requests:
        name: id
        format_string: '0'
        label: ID
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
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 129
    col: 0
    width: 24
    height: 4
    tab_name: ''
  - title: Created and Deleted Objects Request Information
    name: Created and Deleted Objects Request Information
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_grid
    fields: [object_events.bucket_name, object_events.object_name, object_events.location,
      object_events.request_completion_time, object_events.request_http_method, object_events.total_storage_size,
      object_events.response_status]
    filters:
      object_events.request_http_method: DELETE,PUT
    sorts: [object_events.request_completion_time desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_events.total_storage_size:
        is_active: false
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
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      8 - Size Unit: object_events.size_unit
      4 - HTTP Method: object_events.request_http_method
    row: 45
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Total 429 Errors Trend
    name: Total 429 Errors Trend
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_line
    fields: [object_events.request_completion_dynamic, object_events.total_too_many_requests_errors]
    filters:
      object_events.date_granularity: date^_hour
    sorts: [object_events.request_completion_dynamic desc]
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
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_colors:
      object_events.total_client_errors: "#F9AB00"
      object_events.total_server_errors: "#EA4335"
      object_events.total_success_requests: "#7CB342"
      object_events.total_too_many_requests_errors: "#EA4335"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Request Completion Time: object_events.request_completion_time
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: object_events.bucket_name
      5 - Response Status: object_events.response_status
      6 - Location: object_events.location
      7 - Storage Class: object_events.storage_class
      4 - HTTP Method: object_events.request_http_method
    row: 135
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - type: button
    name: button_296
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::project_activity"}'
    row: 145
    col: 0
    width: 3
    height: 2
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    display: flex; \n    align-items: center; \n       padding: 24px 0 16px 0; \n    color: #202124;\n\
      \">\n  <svg style=\"color: #1a73e8; width: 32px; height: 32px; margin-right:\
      \ 24px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n     <path d=\"M12 2C6.48\
      \ 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z\"\
      />\n  </svg>\n\n  <span style=\"font-size: 24px; font-weight: 400;\">Key Performance\
      \ Indicators (KPIs)</span>\n</div>"
    row: 11
    col: 0
    width: 24
    height: 3
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\
      \ \n    background-color: #ffffff; \n    border: 1px solid #dadce0; \n    border-radius:\
      \ 8px; \n    padding: 24px; \n    box-shadow: 0 1px 2px 0 rgba(60,64,67,0.3),\
      \ 0 1px 3px 1px rgba(60,64,67,0.15);\n    margin-bottom: 20px;\n\">\n\n  <div\
      \ style=\"\n      display: flex; \n      align-items: center; \n      gap: 32px;\
      \ \n      margin-bottom: 30px; \n      border-bottom: 1px solid #f1f3f4; \n\
      \      padding-bottom: 20px;\n  \">\n    <svg style=\"color: #1a73e8; width:\
      \ 32px; height: 32px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n     \
      \   <path d=\"M10 18h4v-2h-4v2zM3 6v2h18V6H3zm3 7h12v-2H6v2z\"/>\n    </svg>\n\
      \    \n    <span style=\"font-size: 22px; font-weight: 500; color: #202124;\"\
      >Filter Applicability Guide</span>\n    \n    <span style=\"font-size: 13px;\
      \ color: #5f6368; margin-left: auto;\">Refer to the numbers on each chart to\
      \ see which filters apply</span>\n  </div>\n\n  <div style=\"\n      display:\
      \ flex; \n      flex-wrap: wrap; \n      gap: 24px; \n      font-size: 14px;\
      \ \n      color: #3c4043;\n  \">\n\n    <div style=\"display: flex; align-items:\
      \ center; gap: 16px; width: 280px;\">\n      <span style=\"flex-shrink: 0; background:\
      \ #e8f0fe; color: #1967d2; font-weight: 700; font-size: 16px; height: 40px;\
      \ width: 40px; border-radius: 50%; display: flex; align-items: center; justify-content:\
      \ center;\">1</span>\n      <span style=\"font-size: 16px;\">Request Completion\
      \ Time</span>\n    </div>\n\n    <div style=\"display: flex; align-items: center;\
      \ gap: 16px; width: 280px;\">\n      <span style=\"flex-shrink: 0; background:\
      \ #fce8e6; color: #c5221f; font-weight: 700; font-size: 16px; height: 40px;\
      \ width: 40px; border-radius: 50%; display: flex; align-items: center; justify-content:\
      \ center;\">2</span>\n      <span style=\"font-size: 16px;\">Project Name</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #fef7e0;\
      \ color: #f09d00; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >3</span>\n      <span style=\"font-size: 16px;\">Bucket Name</span>\n    </div>\n\
      \n    <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #e6f4ea; color: #137333;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">4</span>\n\
      \      <span style=\"font-size: 16px;\">HTTP Method</span>\n    </div>\n\n \
      \   <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #e8f0fe; color: #1967d2;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">5</span>\n\
      \      <span style=\"font-size: 16px;\">Response Status</span>\n    </div>\n\
      \n    <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fce8e6; color: #c5221f;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">6</span>\n\
      \      <span style=\"font-size: 16px;\">Location</span>\n    </div>\n\n    <div\
      \ style=\"display: flex; align-items: center; gap: 16px; width: 280px;\">\n\
      \      <span style=\"flex-shrink: 0; background: #fef7e0; color: #f09d00; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">7</span>\n      <span\
      \ style=\"font-size: 16px;\">Storage Class</span>\n    </div>\n\n    <div style=\"\
      display: flex; align-items: center; gap: 16px; width: 280px;\">\n      <span\
      \ style=\"flex-shrink: 0; background: #e6f4ea; color: #137333; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">8</span>\n      <span\
      \ style=\"font-size: 16px;\">Size Unit</span>\n    </div>\n\n    <div style=\"\
      display: flex; align-items: center; gap: 16px; width: 280px;\">\n      <span\
      \ style=\"flex-shrink: 0; background: #e8f0fe; color: #1967d2; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">9</span>\n      <span\
      \ style=\"font-size: 16px;\">Selected Metric</span>\n    </div>\n\n    <div\
      \ style=\"display: flex; align-items: center; gap: 16px; width: 280px;\">\n\
      \      <span style=\"flex-shrink: 0; background: #fce8e6; color: #c5221f; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">10</span>\n      <span\
      \ style=\"font-size: 16px;\">Prefix Depth</span>\n    </div>\n\n    <div style=\"\
      display: flex; align-items: center; gap: 16px; width: 280px;\">\n      <span\
      \ style=\"flex-shrink: 0; background: #fef7e0; color: #f09d00; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">11</span>\n      <span\
      \ style=\"font-size: 16px;\">Bucket or Project selector</span>\n    </div>\n\
      \n    <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #e6f4ea; color: #137333;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">12</span>\n\
      \      <span style=\"font-size: 16px;\">Comparison Selected Metric</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #e8f0fe;\
      \ color: #1967d2; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >13</span>\n      <span style=\"font-size: 16px;\">Dimension Selector</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #fce8e6;\
      \ color: #c5221f; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >14</span>\n      <span style=\"font-size: 16px;\">Object Name</span>\n    </div>\n\
      \n  </div>\n</div>"
    row: 4
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">8</div>\n\n</div>"
    row: 18
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    display: flex; \n    align-items: center; \n        padding: 24px 0 16px 0; \n    color: #202124;\n\
      \">\n  <svg style=\"color: #1a73e8; width: 32px; height: 32px; margin-right:\
      \ 24px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n     <path d=\"M12 2C6.48\
      \ 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z\"\
      />\n  </svg>\n\n  <span style=\"font-size: 24px; font-weight: 400;\">Activity\
      \ Breakdown</span>\n</div>"
    row: 20
    col: 0
    width: 24
    height: 3
    tab_name: ''
  - name: " "
    type: text
    title_text: " "
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    display: flex; \n    align-items: center; \n        padding: 24px 0 16px 0; \n    color: #202124;\n\
      \">\n  <svg style=\"color: #1a73e8; width: 32px; height: 32px; margin-right:\
      \ 24px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n     <path d=\"M12 2C6.48\
      \ 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z\"\
      />\n  </svg>\n\n  <span style=\"font-size: 24px; font-weight: 400;\">Activity\
      \ & Performance Trends</span>\n</div>"
    row: 66
    col: 0
    width: 24
    height: 3
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">8</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">9</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">10</div>\n\n</div>"
    row: 31
    col: 17
    width: 7
    height: 2
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">8</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">9</div>\n\n  <div style=\"\n    background: #e8f0fe; \n    color:\
      \ #1967d2; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">13</div>\n\n</div>"
    row: 43
    col: 17
    width: 7
    height: 2
    tab_name: ''
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">8</div>\n\n</div>"
    row: 52
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    display: flex; \n    align-items: center; \n    padding: 24px 0 16px 0;\
      \ \n    color: #202124;\n\">\n  <svg style=\"color: #1a73e8; width: 32px; height:\
      \ 32px; margin-right: 24px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n\
      \     <path d=\"M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2\
      \ 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z\"/>\n  </svg>\n\n  <span style=\"font-size:\
      \ 24px; font-weight: 400;\">Error Analysis</span>\n</div>"
    row: 106
    col: 0
    width: 24
    height: 3
    tab_name: ''
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">8</div>\n\n</div>"
    row: 64
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (11)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 78
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (12)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    display: flex; \n    align-items: center; \n    padding: 24px 0 16px 0;\
      \ \n    color: #202124;\n\">\n  <svg style=\"color: #1a73e8; width: 32px; height:\
      \ 32px; margin-right: 24px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n\
      \     <path d=\"M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2\
      \ 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z\"/>\n  </svg>\n\n  <span style=\"font-size:\
      \ 24px; font-weight: 400;\">Comparison</span>\n</div>"
    row: 92
    col: 0
    width: 24
    height: 3
    tab_name: ''
  - name: " (13)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 90
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (14)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">8</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">9</div>\n\n  <div style=\"\n    background: #fef7e0; \n    color:\
      \ #f09d00; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">11</div>\n\n</div>"
    row: 104
    col: 5
    width: 7
    height: 2
    tab_name: ''
  - name: " (15)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">8</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">11</div>\n\n  <div style=\"\n    background: #e6f4ea; \n   \
      \ color: #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height:\
      \ 32px; \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n\
      \    align-items: center; \n    justify-content: center;\n  \">12</div>\n\n\
      </div>"
    row: 104
    col: 17
    width: 7
    height: 2
    tab_name: ''
  - name: " (16)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">14</div>\n\n</div>"
    row: 117
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (17)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 127
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (18)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 143
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (19)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 143
    col: 0
    width: 18
    height: 2
    tab_name: ''
  - name: " (20)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 133
    col: 18
    width: 6
    height: 2
    tab_name: ''
  filters:
  - name: 1 - Request Completion Time
    title: 1 - Request Completion Time
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.request_completion_time
  - name: 2 - Project Name
    title: 2 - Project Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: project_attributes.project_name
  - name: 3 - Bucket Name
    title: 3 - Bucket Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.bucket_name
  - name: 4 - HTTP Method
    title: 4 - HTTP Method
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.request_http_method
  - name: 5 - Response Status
    title: 5 - Response Status
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.response_status
  - name: 6 - Location
    title: 6 - Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.location
  - name: 7 - Storage Class
    title: 7 - Storage Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.storage_class
  - name: 8 - Size Unit
    title: 8 - Size Unit
    type: field_filter
    default_value: GiB
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.size_unit
  - name: 9 - Selected Metric
    title: 9 - Selected Metric
    type: field_filter
    default_value: total^_requests
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.aggregate_function
  - name: 10 - Prefix Depth
    title: 10 - Prefix Depth
    type: field_filter
    default_value: full^_prefix
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.prefix_depth
  - name: 11 - Bucket or Project selector
    title: 11 - Bucket or Project selector
    type: field_filter
    default_value: bucket
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.bucket_project_selector
  - name: 12 - Comparison Selected Metric
    title: 12 - Comparison Selected Metric
    type: field_filter
    default_value: total^_errors
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.aggregate_function
  - name: 13 - Dimension Selector
    title: 13 - Dimension Selector
    type: field_filter
    default_value: http^_method
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.dimension_selector
  - name: 14 - Object Name
    title: 14 - Object Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.object_name
