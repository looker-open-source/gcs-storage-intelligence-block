---
- dashboard: errors
  title: GCS Intelligence - Errors
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  preferred_slug: x5HcrYsEUGNJcl72qQAIYn
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #ccc;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 40px; display:
      flex; justify-content: center; gap: 20px;">

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::general_analysis">General Analysis</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::usage_and_saving_opportunity">Usage and saving opportunity</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::security_and_compliance">Security and compliance</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::data_discovery">Data Discovery</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::geographical_analysis">Geographical Analysis</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black; font-weight: bold;" href="#">Errors</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::events">Events</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - type: button
    name: button_385
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::geographical_analysis"}'
    row: 52
    col: 0
    width: 3
    height: 2
  - type: button
    name: button_386
    rich_content_json: '{"text":"Share your feedback","description":"","newTab":true,"alignment":"center","size":"large","style":"FILLED","color":"#b0ccfc","href":"https://forms.gle/FJs5Ymhsu5j8o9sC9"}'
    row: 52
    col: 5
    width: 14
    height: 2
  - title: Code by Total Errors
    name: Code by Total Errors
    model: gcs_storage_intelligence
    explore: error_attributes
    type: looker_pie
    fields: [error_attributes.error_code, error_attributes.total_errors]
    sorts: [error_attributes.total_errors desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: so5
      custom:
        id: 38c591b2-61f5-61b1-087b-86a28489c5da
        label: Custom
        type: continuous
        stops:
        - color: "#689cf4"
          offset: 0
        - color: "#e2ecfd"
          offset: 100
      options:
        steps: 5
    series_colors: {}
    hidden_pivots: {}
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
    defaults_version: 1
    listen:
      5 -  Error Date: error_attributes.error_date
    row: 2
    col: 0
    width: 18
    height: 12
  - title: Total Errors
    name: Total Errors
    model: gcs_storage_intelligence
    explore: error_attributes
    type: single_value
    fields: [error_attributes.total_errors]
    sorts: [error_attributes.total_errors desc]
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
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: so5
      custom:
        id: 38c591b2-61f5-61b1-087b-86a28489c5da
        label: Custom
        type: continuous
        stops:
        - color: "#689cf4"
          offset: 0
        - color: "#e2ecfd"
          offset: 100
      options:
        steps: 5
    series_colors: {}
    hidden_pivots: {}
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
    defaults_version: 1
    listen:
      5 -  Error Date: error_attributes.error_date
    row: 2
    col: 18
    width: 6
    height: 6
  - title: Total buckets with errors
    name: Total buckets with errors
    model: gcs_storage_intelligence
    explore: error_attributes
    type: single_value
    fields: [error_attributes.total_errors]
    filters:
      error_attributes.bucket_error_record__bucket_name: "-NULL"
    sorts: [error_attributes.total_errors desc]
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
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: so5
      custom:
        id: 38c591b2-61f5-61b1-087b-86a28489c5da
        label: Custom
        type: continuous
        stops:
        - color: "#689cf4"
          offset: 0
        - color: "#e2ecfd"
          offset: 100
      options:
        steps: 5
    series_colors: {}
    hidden_pivots: {}
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
    defaults_version: 1
    listen:
      5 -  Error Date: error_attributes.error_date
    row: 8
    col: 18
    width: 6
    height: 6
  - title: Total errors over time
    name: Total errors over time
    model: gcs_storage_intelligence
    explore: error_attributes
    type: looker_line
    fields: [error_attributes.error_date, error_attributes.total_errors]
    filters:
      error_attributes.total_errors: NOT NULL
    sorts: [error_attributes.error_date desc]
    limit: 1095
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(offset_list(${error_attributes.total_errors},0, 1095))
      label: Total errors
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: total_errors
      _type_hint: number
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
    series_colors:
      total_errors: "#689cf4"
    hidden_fields: [error_attributes.total_errors]
    defaults_version: 1
    listen:
      5 -  Error Date: error_attributes.error_date
    row: 14
    col: 0
    width: 24
    height: 10
  - title: Top buckets by number of errors
    name: Top buckets by number of errors
    model: gcs_storage_intelligence
    explore: error_attributes
    type: looker_column
    fields: [error_attributes.total_errors, error_attributes.bucket_error_record__bucket_name]
    filters:
      error_attributes.error_with_buckets: 'Yes'
    sorts: [error_attributes.total_errors desc, error_attributes.bucket_error_record__bucket_name
        desc]
    limit: 15
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
    color_application:
      collection_id: so5
      custom:
        id: 68c338ff-4c57-94bf-5b78-14ff2001406e
        label: Custom
        type: discrete
        colors:
        - "#e2ecfd"
        - "#12B5CB"
        - "#E52592"
        - "#E8710A"
        - "#F9AB00"
        - "#7CB342"
        - "#9334E6"
        - "#80868B"
        - "#079c98"
        - "#A8A116"
        - "#EA4335"
        - "#FF8168"
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    value_labels: legend
    label_type: labPer
    hidden_pivots: {}
    show_null_points: true
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      1 - Bucket Name: error_attributes.bucket_error_record__bucket_name
      2 - Location: error_attributes.source_gcs_location
      3 - Geographic Area: regions_information.geographic_area
      4 - Countries: regions_information.countries
      5 -  Error Date: error_attributes.error_date
    row: 29
    col: 0
    width: 24
    height: 11
  - title: Errors breakdown by Geographic area
    name: Errors breakdown by Geographic area
    model: gcs_storage_intelligence
    explore: error_attributes
    type: looker_google_map
    fields: [error_attributes.total_errors, regions_information.geographic_area]
    filters:
      error_attributes.error_with_buckets: 'Yes'
    sorts: [error_attributes.total_errors desc]
    limit: 15
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    map_value_colors: ["#e2ecfd", "#689cf4"]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
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
    color_application:
      collection_id: so5
      custom:
        id: 68c338ff-4c57-94bf-5b78-14ff2001406e
        label: Custom
        type: discrete
        colors:
        - "#e2ecfd"
        - "#12B5CB"
        - "#E52592"
        - "#E8710A"
        - "#F9AB00"
        - "#7CB342"
        - "#9334E6"
        - "#80868B"
        - "#079c98"
        - "#A8A116"
        - "#EA4335"
        - "#FF8168"
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    value_labels: legend
    label_type: labPer
    hidden_pivots: {}
    show_null_points: true
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      1 - Bucket Name: error_attributes.bucket_error_record__bucket_name
      2 - Location: error_attributes.source_gcs_location
      3 - Geographic Area: regions_information.geographic_area
      4 - Countries: regions_information.countries
      5 -  Error Date: error_attributes.error_date
    row: 40
    col: 0
    width: 24
    height: 10
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">2</span>
      </div>
    row: 26
    col: 11
    width: 2
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 26
    col: 6
    width: 3
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">3</span>
      </div>
    row: 26
    col: 13
    width: 2
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 24
    col: 0
    width: 24
    height: 2
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">4</span>
      </div>
    row: 26
    col: 15
    width: 2
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">1</span>
      </div>
    row: 26
    col: 9
    width: 2
    height: 3
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 50
    col: 0
    width: 24
    height: 2
  - type: button
    name: button_506
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::events"}'
    row: 52
    col: 21
    width: 3
    height: 2
  filters:
  - name: 1 - Bucket Name
    title: 1 - Bucket Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [2 - Location, 4 - Countries]
    field: bucket_attributes.bucket_name
  - name: 2 - Location
    title: 2 - Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [1 - Bucket Name, 4 - Countries]
    field: regions_information.location
  - name: 3 - Geographic Area
    title: 3 - Geographic Area
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [1 - Bucket Name, 2 - Location, 4 - Countries]
    field: regions_information.geographic_area
  - name: 4 - Countries
    title: 4 - Countries
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [1 - Bucket Name, 2 - Location]
    field: regions_information.countries
  - name: 5 -  Error Date
    title: 5 -  Error Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: error_attributes
    listens_to_filters: []
    field: error_attributes.error_date
