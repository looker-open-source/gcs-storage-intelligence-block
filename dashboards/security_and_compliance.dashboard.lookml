---
- dashboard: security_and_compliance
  title: GCS Storage Intelligence - Security & Compliance
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: bQfrUXv0NsAXaTmUw5M50s
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
      \     font-size: 18px; \n      font-weight: 500;\n      display: flex; \n  \
      \    justify-content: center; \n      align-items: center;\n      border-bottom:\
      \ 1px solid #f1f3f4;\n      background-color: #fff;\n  \">\n    <a style=\"\n\
      \        padding: 18px 24px; \n        text-decoration: none; \n        color:\
      \ #5f6368; \n        font-weight: 500;\n        border-bottom: 3px solid transparent;\
      \ \n        transition: background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::general_analysis\"\
      >General Analysis</a>\n    \n    <a style=\"\n        padding: 18px 24px; \n\
      \        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500;\n        border-bottom: 3px solid transparent; \n        transition:\
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::cost_management\"\
      >Cost Management</a>\n    \n    <a style=\"\n        padding: 10px 24px; \n\
      \        text-decoration: none; \n        color: #1967d2; \n        background-color:\
      \ #e8f0fe; \n        font-weight: 700; \n        border-radius: 24px;\n    \
      \    letter-spacing: 0.2px;\n        transition: background 0.2s;\n    \" href=\"\
      #\">Security & Compliance</a>\n    \n    <a style=\"\n        padding: 18px\
      \ 24px; \n        text-decoration: none; \n        color: #5f6368; \n      \
      \  font-weight: 500;\n        border-bottom: 3px solid transparent; \n     \
      \   transition: background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::error_and_events\"\
      >Error & Events</a>\n  </nav>\n\n  <nav style=\"\n      font-size: 16px; \n\
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
      \     text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500; \n        border-radius: 24px;\n    \" href=\"/dashboards/gcs_storage_intelligence::bucket_region_activity\"\
      >Bucket Region Activity</a>\n  </nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 4
    tab_name: ''
  - type: button
    name: button_225
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::error_and_events"}'
    row: 74
    col: 21
    width: 3
    height: 2
    tab_name: ''
  - title: Buckets without Uniform Access
    name: Buckets without Uniform Access
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: single_value
    fields: [bucket_attributes.bucket_count]
    filters:
      project_attributes.project_name: ''
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.uniform_bucket_level_access: 'No'
    sorts: [bucket_attributes.bucket_count desc 0]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Buckets without Uniform Access
    smart_single_value_size: false
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    y_axes: []
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: bucket_attributes.storage_class
    row: 13
    col: 3
    width: 6
    height: 2
    tab_name: ''
  - title: Buckets without Soft-Delete policy
    name: Buckets without Soft-Delete policy
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: single_value
    fields: [bucket_attributes.bucket_count]
    filters:
      project_attributes.project_name: ''
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.retention_duration_timeframe_selection: NOT NULL
    sorts: [bucket_attributes.bucket_count desc 0]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Buckets without Soft-Delete policy
    smart_single_value_size: false
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    y_axes: []
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: bucket_attributes.storage_class
    row: 13
    col: 9
    width: 6
    height: 2
    tab_name: ''
  - title: Objects Under Hold
    name: Objects Under Hold
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.object_count]
    filters:
      project_attributes.project_name: ''
      object_attributes.bucket_name: ''
      object_attributes.location: ''
    limit: 500
    column_limit: 50
    filter_expression: matches_filter(${object_attributes.event_based_hold}, `Yes`)
      OR matches_filter(${object_attributes.temporary_hold}, `Yes`)
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Objects Under Hold
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
    y_axes: []
    hidden_pivots: {}
    listen:
      2 - Bucket Name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 13
    col: 15
    width: 6
    height: 2
    tab_name: ''
  - title: Bucket and countries information
    name: Bucket and countries information
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.selected_measure, bucket_attributes.bucket_name, regions_information.countries]
    filters:
      bucket_attributes.aggregate_function: total^_objects
      project_attributes.project_name: ''
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.lifecycle: ''
      bucket_attributes.enabled: ''
    sorts: [bucket_attributes.selected_measure desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
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
      bucket_attributes.selected_measure:
        is_active: false
    header_background_color: "#F0F0F0"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce,
          palette_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
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
      10 - Countries: regions_information.countries_union
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      6 - Metric Selection: bucket_attributes.aggregate_function
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: bucket_attributes.storage_class
      7 - Public Access Prevention: bucket_attributes.public_access_prevention
      8 - Uniform Bucket Level Access Enabled: bucket_attributes.uniform_bucket_level_access
      9 - Bucket Level Access Disabled: bucket_attributes.bucket_level_access_disabled
      5 - Storage Size Unit: bucket_attributes.size_unit
    row: 17
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Objects and storage size breakdown by geographic area
    name: Objects and storage size breakdown by geographic area
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_google_map
    fields: [bucket_attributes.location, regions_information.coordinates, bucket_attributes.selected_measure]
    filters:
      bucket_attributes.location: africa-south1
    sorts: [bucket_attributes.selected_measure desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: true
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_radius_fixed: 200000
    map_marker_radius_min: 100000
    map_marker_radius_max: 300000
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    map_value_colors: ["#F3D1DE", "#E7A3BD", "#DB749D", "#CE467C", "#C2185B"]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    hidden_pivots: {}
    listen:
      10 - Countries: regions_information.countries_union
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      6 - Metric Selection: bucket_attributes.aggregate_function
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: bucket_attributes.storage_class
      7 - Public Access Prevention: bucket_attributes.public_access_prevention
      8 - Uniform Bucket Level Access Enabled: bucket_attributes.uniform_bucket_level_access
      9 - Bucket Level Access Disabled: bucket_attributes.bucket_level_access_disabled
      5 - Storage Size Unit: bucket_attributes.size_unit
    row: 26
    col: 0
    width: 24
    height: 9
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style=\"border-radius: 10px; background-color: #f0f0f0; padding:\
      \ 20px; height: 100%; width: 100%; text-align: justify;\">\n<b>Object Lifecycle\
      \ Management</b> can be either inherited or enforced. If inherited, the settings\
      \ are determined by the organization policy constraint at the project level.\
      \ If enforced, it is explicitly set for the bucket. For more information:\_\n\
      \    <br> \n    <a style=\"padding: 5px 15px; text-decoration: none; color:\
      \ #434343;\" href=\"https://docs.cloud.google.com/storage/docs/public-access-prevention#inheritance\"\
      \ target=\"_blank\"> Object Lifecycle Management </a> "
    row: 35
    col: 0
    width: 16
    height: 3
    tab_name: ''
  - title: Top 100 objects with retention expiration time
    name: Top 100 objects with retention expiration time
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.object_name, object_attributes.retention_expiration_date,
      object_attributes.days_until_expiration]
    filters:
      object_attributes.retention_expiration_date: NOT NULL
      object_attributes.days_until_expiration: ">0"
    sorts: [object_attributes.days_until_expiration desc]
    limit: 100
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
      object_attributes.size:
        is_active: false
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
    listen:
      2 - Bucket Name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
      11 - Days until retention expiration: object_attributes.days_until_expiration
    row: 38
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Distribution by Soft Deleted or Non Current Objects
    name: Distribution by Soft Deleted or Non Current Objects
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.object_status, object_attributes.object_name, object_attributes.hard_delete_date,
      object_attributes.selected_measure]
    filters:
      object_attributes.live_objects: 'No'
      object_attributes.object_status: ''
    sorts: [object_attributes.object_status]
    limit: 100
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
      object_attributes.size:
        is_active: false
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
    listen:
      2 - Bucket Name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      6 - Metric Selection: object_attributes.aggregate_function
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
      12 - Object Status: object_attributes.object_status
      5 - Storage Size Unit: object_attributes.size_unit
    row: 47
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Buckets with Soft-Deleted policy enabled
    name: Buckets with Soft-Deleted policy enabled
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.selected_measure, bucket_attributes.bucket_name]
    filters:
      bucket_attributes.soft_delete_enabled: 'Yes'
    sorts: [bucket_attributes.selected_measure desc 0]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
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
      bucket_attributes.selected_measure:
        is_active: false
    header_background_color: "#F0F0F0"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce,
          palette_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
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
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      6 - Metric Selection: bucket_attributes.aggregate_function
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: bucket_attributes.storage_class
      5 - Storage Size Unit: bucket_attributes.size_unit
    row: 56
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Soft-Deleted objects remaining retention
    name: Soft-Deleted objects remaining retention
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.object_name, object_attributes.hard_delete_time, object_attributes.days_until_hard_deletion,
      object_attributes.size]
    filters:
      object_attributes.object_status: Soft-deleted
    sorts: [object_attributes.days_until_hard_deletion desc, object_attributes.size
        desc]
    limit: 100
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
      object_attributes.size:
        is_active: false
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
    listen:
      4 - Storage Class: object_attributes.storage_class
      13 - Days until hard deletion: object_attributes.days_until_hard_deletion
      5 - Storage Size Unit: object_attributes.size_unit
    row: 65
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - type: button
    name: button_236
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::cost_management"}'
    row: 74
    col: 0
    width: 3
    height: 2
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
      \ center;\">1</span>\n      <span style=\"font-size: 16px;\">Project Name</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #fce8e6;\
      \ color: #c5221f; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >2</span>\n      <span style=\"font-size: 16px;\">Bucket Name</span>\n    </div>\n\
      \n    <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fef7e0; color: #f09d00;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">3</span>\n\
      \      <span style=\"font-size: 16px;\">Location</span>\n    </div>\n\n    <div\
      \ style=\"display: flex; align-items: center; gap: 16px; width: 280px;\">\n\
      \      <span style=\"flex-shrink: 0; background: #e6f4ea; color: #137333; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">4</span>\n      <span\
      \ style=\"font-size: 16px;\">Storage Class</span>\n    </div>\n\n    <div style=\"\
      display: flex; align-items: center; gap: 16px; width: 280px;\">\n      <span\
      \ style=\"flex-shrink: 0; background: #e8f0fe; color: #1967d2; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">5</span>\n      <span\
      \ style=\"font-size: 16px;\">Storage Size Unit</span>\n    </div>\n\n    <div\
      \ style=\"display: flex; align-items: center; gap: 16px; width: 280px;\">\n\
      \      <span style=\"flex-shrink: 0; background: #fce8e6; color: #c5221f; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">6</span>\n      <span\
      \ style=\"font-size: 16px;\">Metric Selection</span>\n    </div>\n\n    <div\
      \ style=\"display: flex; align-items: center; gap: 16px; width: 280px;\">\n\
      \      <span style=\"flex-shrink: 0; background: #fef7e0; color: #f09d00; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">7</span>\n      <span\
      \ style=\"font-size: 16px;\">Public Access Prevention</span>\n    </div>\n\n\
      \    <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #e6f4ea; color: #137333;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">8</span>\n\
      \      <span style=\"font-size: 16px;\">Uniform Bucket Level Access</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #e8f0fe;\
      \ color: #1967d2; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >9</span>\n      <span style=\"font-size: 16px;\">Bucket Level Access Disabled</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #fce8e6;\
      \ color: #c5221f; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >10</span>\n      <span style=\"font-size: 16px;\">Countries</span>\n    </div>\n\
      \n    <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fef7e0; color: #f09d00;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">11</span>\n\
      \      <span style=\"font-size: 16px;\">Days until retention expiration</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #e6f4ea;\
      \ color: #137333; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >12</span>\n      <span style=\"font-size: 16px;\">Object Status</span>\n  \
      \  </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #e8f0fe;\
      \ color: #1967d2; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >13</span>\n      <span style=\"font-size: 16px;\">Days until hard deletion</span>\n\
      \    </div>\n\n  </div>\n</div>"
    row: 4
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    display: flex; \n    align-items: center; \n    padding: 24px 0 16px 0;\
      \ \n    color: #202124;\n\">\n  <svg style=\"color: #1a73e8; width: 32px; height:\
      \ 32px; margin-right: 24px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n\
      \     <path d=\"M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2\
      \ 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z\"/>\n  </svg>\n\n  <span style=\"font-size:\
      \ 24px; font-weight: 400;\">Key Security Indicators </span>\n</div>"
    row: 11
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
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
      \ center; \n    justify-content: center;\n  \">4</div>\n\n</div>"
    row: 15
    col: 19
    width: 5
    height: 2
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
    row: 35
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
      \ center;\n  \">9</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">10</div>\n\n</div>"
    row: 24
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
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
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
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">11</div>\n\n</div>"
    row: 45
    col: 19
    width: 5
    height: 2
    tab_name: ''
  - name: " (9)"
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
      \    background: #e6f4ea; \n    color: #137333; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">12</div>\n\n</div>"
    row: 54
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 72
    col: 0
    width: 18
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
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #e8f0fe; \n    color:\
      \ #1967d2; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">13</div>\n\n</div>"
    row: 72
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (12)"
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
      \ center; \n    justify-content: center;\n  \">6</div>\n\n</div>"
    row: 63
    col: 19
    width: 5
    height: 2
    tab_name: ''
  filters:
  - name: 1 - Project Name
    title: 1 - Project Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [2 - Bucket Name, 3 - Location]
    field: project_attributes.project_name
  - name: 2 - Bucket Name
    title: 2 - Bucket Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [1 - Project Name, 3 - Location]
    field: bucket_attributes.bucket_name
  - name: 3 - Location
    title: 3 - Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [1 - Project Name, 2 - Bucket Name]
    field: bucket_attributes.location
  - name: 4 - Storage Class
    title: 4 - Storage Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.storage_class
  - name: 5 - Storage Size Unit
    title: 5 - Storage Size Unit
    type: field_filter
    default_value: GiB
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.size_unit
  - name: 6 - Metric Selection
    title: 6 - Metric Selection
    type: field_filter
    default_value: total^_objects
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.aggregate_function
  - name: 7 - Public Access Prevention
    title: 7 - Public Access Prevention
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options:
      - ENFORCED
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.public_access_prevention
  - name: 8 - Uniform Bucket Level Access Enabled
    title: 8 - Uniform Bucket Level Access Enabled
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options:
      - 'Yes'
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.uniform_bucket_level_access
  - name: 9 - Bucket Level Access Disabled
    title: 9 - Bucket Level Access Disabled
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options:
      - 'Yes'
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.bucket_level_access_disabled
  - name: 10 - Countries
    title: 10 - Countries
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: regions_information.countries_union
  - name: 11 - Days until retention expiration
    title: 11 - Days until retention expiration
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.days_until_expiration
  - name: 12 - Object Status
    title: 12 - Object Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - Noncurrent
      - Soft-deleted
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.object_status
  - name: 13 - Days until hard deletion
    title: 13 - Days until hard deletion
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.days_until_hard_deletion
