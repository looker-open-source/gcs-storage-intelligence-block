---
- dashboard: object_events
  title: GCS Storage Intelligence - Object Events
  preferred_viewer: dashboards-next
  style: modern
  description: ''
  preferred_slug: ROyzRVzdNgSQlRQ6oDhwEF
  theme_name: ''
  layout_granularity: granular
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
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::context_catalog\"\
      >Context Catalog</a>\n  </nav>\n\n  <nav style=\"\n      font-size: 16px;\n\
      \      display: flex; \n      justify-content: center; \n      align-items:\
      \ center;\n      gap: 16px; \n      padding: 16px 0;\n      background-color:\
      \ #fff;\n  \">\n    \n    <a style=\"\n        padding: 8px 20px; \n       \
      \ text-decoration: none; \n        color: #5f6368; \n        font-weight: 500;\
      \ \n        border-radius: 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::bucket_activity\"\
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
    width: 72
    height: 8
    tab_name: ''
  - type: button
    name: button_454
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::bucket_region_activity"}'
    row: 242
    col: 63
    width: 9
    height: 4
    tab_name: ''
  - title: 'Total # of requests'
    name: 'Total # of requests'
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_requests_current, object_events.total_requests_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: 'Total # of requests'
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the total volume of object-level API requests recorded in the event logs during the selected timeframe, alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 12
    col: 6
    width: 12
    height: 4
    tab_name: ''
  - title: 95th Percentile processing time [ms]
    name: 95th Percentile processing time [ms]
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.ninety_five_percentile_request_time_current, object_events.ninety_five_percentile_request_time_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: P95 latency [ms]
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the 95th percentile request processing latency in milliseconds across object-level operations, alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 12
    col: 18
    width: 12
    height: 4
    tab_name: ''
  - title: Total data egress
    name: Total data egress
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_data_egress_current, object_events.total_data_egress_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Total data egress
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the cumulative outbound data volume read from object-level operations during the selected period, alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      8 - Size unit: object_events.size_unit
      5 - Response status: object_events.response_status_string
    row: 12
    col: 30
    width: 12
    height: 4
    tab_name: ''
  - title: Total data ingress
    name: Total data ingress
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_data_ingress_current, object_events.total_data_ingress_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Total data ingress
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the cumulative inbound data volume written by object-level operations during the selected period, alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      8 - Size unit: object_events.size_unit
      5 - Response status: object_events.response_status_string
    row: 12
    col: 42
    width: 12
    height: 4
    tab_name: ''
  - title: 'Total # of success requests'
    name: 'Total # of success requests'
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_success_requests_current, object_events.total_success_requests_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Success requests
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the total count of object-level API operations that returned a successful (HTTP 2xx) response status, alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 12
    col: 54
    width: 12
    height: 4
    tab_name: ''
  - title: Total errors
    name: Total errors
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_errors_current, object_events.total_errors_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Total errors
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the combined count of object-level API operations that resulted in a client-side (4xx) or server-side (5xx) error, alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 16
    col: 12
    width: 12
    height: 4
    tab_name: ''
  - title: Total client errors
    name: Total client errors
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_client_errors_current, object_events.total_client_errors_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Total client errors
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the total count of object-level API requests that returned a client-side error (HTTP 4xx), alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 16
    col: 24
    width: 12
    height: 4
    tab_name: ''
  - title: Total server errors
    name: Total server errors
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.total_server_errors_current, object_events.total_server_errors_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Total server errors
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the total count of object-level API requests that returned a server-side error (HTTP 5xx), alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 16
    col: 36
    width: 12
    height: 4
    tab_name: ''
  - title: Average latency (ms)
    name: Average latency (ms)
    model: gcs_storage_intelligence
    explore: object_events
    type: single_value
    fields: [object_events.average_latency_ms_current, object_events.average_latency_ms_pop_change]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Avg latency (ms)
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the mean request processing time in milliseconds across object-level API operations, alongside the period-over-period change.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.analysis_date_filter
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 16
    col: 48
    width: 12
    height: 4
    tab_name: ''
  - title: Requests over time
    name: Requests over time
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Tracks the volume of mutation and upload operations (DELETE, PATCH, POST, and PUT requests) over time at the selected date granularity.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 106
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Top prefixes by selected measure
    name: Top prefixes by selected measure
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
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    modern2026: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_events.selected_measure:
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
    note_text: Lists object prefixes ranked by the selected activity metric at the configured prefix depth to pinpoint high-traffic folder paths.
    listen:
      6 - Location: object_events.location
      Activity breakdown - metric selection: object_events.aggregate_function
      Prefix depth: object_events.prefix_depth
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      8 - Size unit: object_events.size_unit
      5 - Response status: object_events.response_status_string
    row: 28
    col: 0
    width: 72
    height: 16
    tab_name: ''
  - title: Top buckets or projects by selected metric
    name: Top buckets or projects by selected metric
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Ranks the top buckets or projects according to the primary selected activity metric for comparative workload analysis.
    listen:
      6 - Location: object_events.location
      Comparison - bucket or project selector: object_events.bucket_project_selector
      Comparison - metric selection: object_events.aggregate_function
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      8 - Size unit: object_events.size_unit
      5 - Response status: object_events.response_status_string
    row: 156
    col: 0
    width: 36
    height: 18
    tab_name: ''
  - title: Top projects or buckets by selected metric
    name: Top projects or buckets by selected metric
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Ranks the top buckets or projects according to the secondary comparison metric for side-by-side correlation.
    listen:
      6 - Location: object_events.location
      Comparison - bucket or project selector: object_events.bucket_project_selector
      Comparison - metric selection II: object_events.aggregate_function
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      8 - Size unit: object_events.size_unit
      5 - Response status: object_events.response_status_string
    row: 156
    col: 36
    width: 36
    height: 18
    tab_name: ''
  - title: Top distribution
    name: Top distribution
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Displays the proportional breakdown of the selected activity metric across the chosen dimension (such as HTTP Method, Storage Class, or Location).
    listen:
      6 - Location: object_events.location
      Activity breakdown - metric selection II: object_events.aggregate_function
      Activity breakdown - dimension selection: object_events.dimension_selector
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      8 - Size unit: object_events.size_unit
      5 - Response status: object_events.response_status_string
    row: 48
    col: 0
    width: 72
    height: 20
    tab_name: ''
  - title: Requests status over time
    name: Requests status over time
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Plots Successful Requests (2xx), Client Errors (4xx), and Server Errors (5xx) over time to correlate error spikes with overall request volume.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      5 - Response status: object_events.response_status_string
    row: 124
    col: 0
    width: 72
    height: 20
    tab_name: ''
  - title: Created and deleted storage size over time
    name: Created and deleted storage size over time
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Compares the volume of newly created object storage against deleted object storage over time to track net data churn.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      8 - Size unit: object_events.size_unit
      5 - Response status: object_events.response_status_string
    row: 82
    col: 0
    width: 72
    height: 20
    tab_name: ''
  - title: Error details
    name: Error details
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
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    modern2026: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
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
    note_text: Provides a granular event log of failed object requests, listing Request Completion Time, HTTP Method, Object Name, Response Status, and Error Reason.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      Object name: object_events.object_name
      Error analysis - response status: object_events.response_status_string
    row: 186
    col: 0
    width: 72
    height: 16
    tab_name: ''
  - title: Top error-prone objects
    name: Top error-prone objects
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
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    modern2026: false
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
    note_state: collapsed
    note_display: hover
    note_text: Identifies the specific objects and buckets experiencing the highest count of failed requests by HTTP Response Status.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      Error analysis - response status: object_events.response_status_string
    row: 202
    col: 0
    width: 72
    height: 16
    tab_name: ''
  - title: Top 429 error reasons
    name: Top 429 error reasons
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
    modern2026: false
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
    note_state: collapsed
    note_display: hover
    note_text: Breaks down HTTP 429 (Too Many Requests) throttling events by their specific Error Reason and total request count.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
    row: 218
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: Created and deleted objects request information
    name: Created and deleted objects request information
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
    modern2026: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_events.total_storage_size:
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
    note_text: Lists individual object creation and deletion events with Bucket Name, Object Name, Location, Request Completion Time, HTTP Method, Total Storage Size, and Response Status.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
      8 - Size unit: object_events.size_unit
      5 - Response status: object_events.response_status_string
    row: 68
    col: 0
    width: 72
    height: 14
    tab_name: ''
  - title: Total 429 errors trend
    name: Total 429 errors trend
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Tracks the trend of HTTP 429 (Too Many Requests) rate-limiting errors over time to identify throttling windows.
    listen:
      6 - Location: object_events.location
      1 - Request completion Time: object_events.request_completion_time
      2 - Project name: project_attributes.project_name
      3 - Bucket name: object_events.bucket_name
      4 - HTTP method: object_events.request_http_method
      7 - Storage class: object_events.storage_class
    row: 226
    col: 0
    width: 72
    height: 16
    tab_name: ''
  - type: button
    name: button_476
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::project_activity"}'
    row: 242
    col: 0
    width: 9
    height: 4
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
  - name: " (3)"
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
          Activity breakdown
      </div>
    row: 20
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
         Activity performance trends
      </div>
    row: 102
    col: 0
    width: 72
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
          Error Analysis
      </div>
    row: 174
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
          Comparison
      </div>
    row: 144
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - type: filter
    name: Activity breakdown - metric selection
    row: 24
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Prefix depth
    row: 24
    col: 12
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Activity breakdown - dimension selection
    row: 44
    col: 16
    width: 15
    height: 4
    tab_name: ''
  - type: filter
    name: Activity breakdown - metric selection II
    row: 44
    col: 0
    width: 15
    height: 4
    tab_name: ''
  - type: filter
    name: Comparison - bucket or project selector
    row: 148
    col: 0
    width: 14
    height: 4
    tab_name: ''
  - type: filter
    name: Comparison - metric selection II
    row: 152
    col: 36
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Comparison - metric selection
    row: 152
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 148
    col: 18
    width: 52
    height: 4
    tab_name: ''
  - type: filter
    name: Object name
    row: 182
    col: 2
    width: 10
    height: 4
    tab_name: ''
  - type: filter
    name: Error analysis - response status
    row: 178
    col: 0
    width: 12
    height: 4
    tab_name: ''
  filters:
  - name: 1 - Request completion Time
    title: 1 - Request completion Time
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
    field: object_events.request_completion_time
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
    explore: object_events
    listens_to_filters: []
    field: project_attributes.project_name
  - name: 3 - Bucket name
    title: 3 - Bucket name
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
  - name: 4 - HTTP method
    title: 4 - HTTP method
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
  - name: 5 - Response status
    title: 5 - Response status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - match
      - "!match"
      - startsWith
      - endsWith
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.response_status_string
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
  - name: 7 - Storage class
    title: 7 - Storage class
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
  - name: 8 - Size unit
    title: 8 - Size unit
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
  - name: Activity breakdown - metric selection
    title: Activity breakdown - metric selection
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
  - name: Prefix depth
    title: Prefix depth
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
  - name: Activity breakdown - metric selection II
    title: Activity breakdown - metric selection II
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
  - name: Activity breakdown - dimension selection
    title: Activity breakdown - dimension selection
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
  - name: Comparison - bucket or project selector
    title: Comparison - bucket or project selector
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
  - name: Comparison - metric selection
    title: Comparison - metric selection
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
    explore: object_events
    listens_to_filters: []
    field: object_events.aggregate_function
  - name: Object name
    title: Object name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - match
      - "!match"
      - contains
      - "!contains"
      - startsWith
      - "!startsWith"
      - endsWith
      - "!endsWith"
      - blank
      - "!blank"
      - 'null'
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.object_name
  - name: Error analysis - response status
    title: Error analysis - response status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - '400'
      - '401'
      - '403'
      - '404'
      - '429'
      - '500'
      - '502'
      - '503'
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.response_status_string
