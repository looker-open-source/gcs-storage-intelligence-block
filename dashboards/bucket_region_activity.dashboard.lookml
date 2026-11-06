---
- dashboard: bucket_region_activity
  title: GCS Storage Intelligence - Bucket Region Activity
  preferred_viewer: dashboards-next
  style: modern
  description: ''
  preferred_slug: iokoyxiGP8UHgl56PJkVbE
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
      \        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500; \n        border-radius: 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::object_events\"\
      >Object Events</a>\n    \n    <a style=\"\n        padding: 8px 20px; \n   \
      \     text-decoration: none; \n        color: #1967d2; \n        background-color:\
      \ #e8f0fe; \n        font-weight: 700; \n        border-radius: 24px;\n    \
      \    letter-spacing: 0.2px;\n    \" href=\"#\">Bucket Region Activity</a>\n\
      \  </nav>\n\n</div>"
    row: 0
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: 'Total # of buckets'
    name: 'Total # of buckets'
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    type: single_value
    fields: [bucket_region_activity.total_buckets_current, bucket_region_activity.total_buckets_pop_change]
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
    single_value_title: 'Total # of buckets'
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the count of unique storage buckets with recorded regional
      activity during the selected period, alongside the period-over-period change.
    listen:
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: bucket_region_activity.bucket_name
      4 - Source Location: bucket_region_activity.bucket_location
      5 - Request Location: bucket_region_activity.request_location
      1 - Snapshot Start Time: bucket_region_activity.analysis_date_filter
    row: 8
    col: 6
    width: 15
    height: 4
    tab_name: ''
  - title: 'Total # of requested regions'
    name: 'Total # of requested regions'
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    type: single_value
    fields: [bucket_region_activity.total_requested_locations_current, bucket_region_activity.total_requested_locations_pop_change]
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
    single_value_title: 'Total # of requested regions'
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the count of distinct Google Cloud regions from which requests
      originated against the selected buckets, alongside the period-over-period change.
    listen:
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: bucket_region_activity.bucket_name
      4 - Source Location: bucket_region_activity.bucket_location
      5 - Request Location: bucket_region_activity.request_location
      1 - Snapshot Start Time: bucket_region_activity.analysis_date_filter
    row: 8
    col: 21
    width: 15
    height: 4
    tab_name: ''
  - title: Total data egress
    name: Total data egress
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    type: single_value
    fields: [bucket_region_activity.total_data_egress_current, bucket_region_activity.total_data_egress_pop_change]
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
    note_text: Displays the total volume of outbound data read from buckets across
      regional request paths during the selected period, alongside the period-over-period
      change.
    listen:
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: bucket_region_activity.bucket_name
      4 - Source Location: bucket_region_activity.bucket_location
      5 - Request Location: bucket_region_activity.request_location
      6 - Throughput Size Unit: bucket_region_activity.throughput_size_unit
      1 - Snapshot Start Time: bucket_region_activity.analysis_date_filter
    row: 8
    col: 36
    width: 15
    height: 4
    tab_name: ''
  - title: Total data ingress
    name: Total data ingress
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    type: single_value
    fields: [bucket_region_activity.total_data_ingress_current, bucket_region_activity.total_data_ingress_pop_change]
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
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the total volume of inbound data written to buckets across
      regional request paths during the selected period, alongside the period-over-period
      change.
    listen:
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: bucket_region_activity.bucket_name
      4 - Source Location: bucket_region_activity.bucket_location
      5 - Request Location: bucket_region_activity.request_location
      6 - Throughput Size Unit: bucket_region_activity.throughput_size_unit
      1 - Snapshot Start Time: bucket_region_activity.analysis_date_filter
    row: 8
    col: 51
    width: 15
    height: 4
    tab_name: ''
  - title: Data Flow by Bucket and Request Location
    name: Data Flow by Bucket and Request Location
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    type: marketplace_viz_sankey::sankey
    fields: [bucket_region_activity.bucket_location, bucket_region_activity.request_location,
      bucket_region_activity.selected_measure]
    filters:
      bucket_region_activity.aggregate_function: total^_data^_egress
    sorts: [bucket_region_activity.bucket_location desc, bucket_region_activity.selected_measure
        desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#1A73E8", "#12B5CB", "#E52592", "#E8710A", "#F9AB00", "#7CB342",
      "#9334E6", "#80868B", "#079c98", "#A8A116", "#EA4335", "#FF8168"]
    label_type: name
    show_null_points: true
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
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: A Sankey flow diagram mapping traffic between the physical Bucket Location
      and the originating Request Location for the selected activity metric, highlighting
      cross-region data transfer patterns.
    listen:
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: bucket_region_activity.bucket_name
      4 - Source Location: bucket_region_activity.bucket_location
      5 - Request Location: bucket_region_activity.request_location
      6 - Throughput Size Unit: bucket_region_activity.throughput_size_unit
      7 - Selected Metric: bucket_region_activity.aggregate_function
      1 - Snapshot Start Time: bucket_region_activity.snapshot_start_time
    row: 12
    col: 0
    width: 72
    height: 30
    tab_name: ''
  - title: Bucket Region Traffic Distribution
    name: Bucket Region Traffic Distribution
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    type: looker_grid
    fields: [bucket_region_activity.bucket_name, bucket_region_activity.project, bucket_region_activity.bucket_location,
      bucket_region_activity.request_location, bucket_region_activity.selected_measure,
      bucket_region_activity.traffic_percentage, bucket_totals_summary.selected_measure]
    filters:
      bucket_region_activity.bucket_name: ''
      bucket_region_activity.aggregate_function: total^_data^_ingress
    sorts: [bucket_region_activity.bucket_name, bucket_region_activity.selected_measure
        desc]
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
    series_labels:
      bucket_region_activity.selected_measure: Total Requested Region
      bucket_totals_summary.selected_measure: Total Bucket Origin
    series_cell_visualizations:
      bucket_region_activity.selected_measure:
        is_active: true
      bucket_totals_summary.selected_measure:
        is_active: true
        palette:
          palette_id: ce208afd-aed6-caac-fc1a-5939fa43c151
          collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
          custom_colors:
          - "#FFFFFF"
          - "#F06292"
      bucket_region_activity.traffic_percentage:
        is_active: true
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
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: A granular breakdown of regional bucket traffic by Bucket Name, Project,
      Bucket Location, and Request Location. Contrasts the regional metric and traffic
      percentage against total bucket activity to pinpoint cross-region egress hotspots.
    listen:
      2 - Project Name: project_attributes.project_name
      3 - Bucket Name: bucket_region_activity.bucket_name
      4 - Source Location: bucket_region_activity.bucket_location
      5 - Request Location: bucket_region_activity.request_location
      6 - Throughput Size Unit: bucket_region_activity.throughput_size_unit
      7 - Selected Metric: bucket_region_activity.aggregate_function
      1 - Snapshot Start Time: bucket_region_activity.snapshot_start_time
    row: 42
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - type: button
    name: button_583
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::object_events"}'
    row: 60
    col: 0
    width: 9
    height: 4
    tab_name: ''
  filters:
  - name: 1 - Snapshot Start Time
    title: 1 - Snapshot Start Time
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    listens_to_filters: []
    field: bucket_region_activity.snapshot_start_time
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
    explore: bucket_region_activity
    listens_to_filters: []
    field: project_attributes.project_name
  - name: 3 - Bucket Name
    title: 3 - Bucket Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    listens_to_filters: []
    field: bucket_region_activity.bucket_name
  - name: 4 - Source Location
    title: 4 - Source Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    listens_to_filters: []
    field: bucket_region_activity.bucket_location
  - name: 5 - Request Location
    title: 5 - Request Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    listens_to_filters: []
    field: bucket_region_activity.request_location
  - name: 6 - Throughput Size Unit
    title: 6 - Throughput Size Unit
    type: field_filter
    default_value: PiB
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    listens_to_filters: []
    field: bucket_region_activity.throughput_size_unit
  - name: 7 - Selected Metric
    title: 7 - Selected Metric
    type: field_filter
    default_value: total^_data^_egress
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: bucket_region_activity
    listens_to_filters: []
    field: bucket_region_activity.aggregate_function
