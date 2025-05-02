---
- dashboard: events
  title: GCS Intelligence - Events
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  preferred_slug: uECuNcX118MBUrSMmPgDMj
  elements:
  - name: ''
    type: text
    title_text: ''
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

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::errors">Errors</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black; font-weight: bold;" href="#">Events</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - type: button
    name: button_666
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::errors"}'
    row: 28
    col: 0
    width: 3
    height: 2
  - type: button
    name: button_667
    rich_content_json: '{"text":"Share your feedback","description":"","newTab":true,"alignment":"center","size":"large","style":"FILLED","color":"#b0ccfc","href":"https://forms.gle/FJs5Ymhsu5j8o9sC9"}'
    row: 28
    col: 5
    width: 14
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 15
    col: 9
    width: 3
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 13
    col: 0
    width: 24
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">6</span>
      </div>
    row: 15
    col: 12
    width: 2
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 26
    col: 0
    width: 24
    height: 2
  - title: Total Snapshots
    name: Total Snapshots
    model: gcs_storage_intelligence
    explore: events
    type: single_value
    fields: [events.total_snaphsots]
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
    defaults_version: 1
    listen:
      1 - Location: regions_information.location
      3 - Countries: regions_information.countries
      4 - Snapshot Date: events.manifest_snapshot_date
      5 - Location Type: regions_information.location_type
      2 - Geographic Area: regions_information.geographic_area
    row: 2
    col: 9
    width: 5
    height: 3
  - title: Total Events
    name: Total Events
    model: gcs_storage_intelligence
    explore: events
    type: single_value
    fields: [events.total_events]
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Location: regions_information.location
      3 - Countries: regions_information.countries
      4 - Snapshot Date: events.manifest_snapshot_date
      5 - Location Type: regions_information.location_type
      2 - Geographic Area: regions_information.geographic_area
    row: 2
    col: 14
    width: 5
    height: 3
  - title: Latest Snapshot
    name: Latest Snapshot
    model: gcs_storage_intelligence
    explore: events
    type: single_value
    fields: [events.manifest_snapshot_date]
    fill_fields: [events.manifest_snapshot_date]
    sorts: [events.manifest_snapshot_date desc]
    limit: 1
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Location: regions_information.location
      3 - Countries: regions_information.countries
      4 - Snapshot Date: events.manifest_snapshot_date
      5 - Location Type: regions_information.location_type
      2 - Geographic Area: regions_information.geographic_area
    row: 2
    col: 4
    width: 5
    height: 3
  - title: Countries or Region by Total Events
    name: Countries or Region by Total Events
    model: gcs_storage_intelligence
    explore: events
    type: looker_google_map
    fields: [regions_information.geographical_value, events.total_events]
    sorts: [events.total_events desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
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
    defaults_version: 0
    listen:
      1 - Location: regions_information.location
      3 - Countries: regions_information.countries
      4 - Snapshot Date: events.manifest_snapshot_date
      6 - Map Selection: regions_information.map_selection
      5 - Location Type: regions_information.location_type
      2 - Geographic Area: regions_information.geographic_area
    row: 18
    col: 0
    width: 24
    height: 8
  - title: Latest event logs
    name: Latest event logs
    model: gcs_storage_intelligence
    explore: events
    type: looker_grid
    fields: [events.manifest_snapshot_date, events.event_time, events.location, events.view_name]
    filters:
      regions_information.location: ''
      regions_information.countries: ''
    sorts: [events.manifest_snapshot_date desc, events.event_time desc]
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
    header_font_color: "#f9f2ff"
    header_background_color: "#689cf4"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Location: events.location
      4 - Snapshot Date: events.manifest_snapshot_date
      5 - Location Type: regions_information.location_type
      2 - Geographic Area: regions_information.geographic_area
    row: 5
    col: 0
    width: 24
    height: 8
  filters:
  - name: 1 - Location
    title: 1 - Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: [2 - Geographic Area, 3 - Countries, 4 - Snapshot Date]
    field: events.location
  - name: 2 - Geographic Area
    title: 2 - Geographic Area
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: [5 - Location Type, 1 - Location, 3 - Countries, 4 - Snapshot
        Date]
    field: regions_information.geographic_area
  - name: 3 - Countries
    title: 3 - Countries
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: [5 - Location Type, 1 - Location, 2 - Geographic Area, 4 -
        Snapshot Date]
    field: regions_information.countries
  - name: 4 - Snapshot Date
    title: 4 - Snapshot Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: []
    field: events.manifest_snapshot_date
  - name: 5 - Location Type
    title: 5 - Location Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: [1 - Location, 2 - Geographic Area, 3 - Countries, 4 - Snapshot
        Date]
    field: regions_information.location_type
  - name: 6 - Map Selection
    title: 6 - Map Selection
    type: field_filter
    default_value: countries^_map
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: []
    field: regions_information.map_selection
