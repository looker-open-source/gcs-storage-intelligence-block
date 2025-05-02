---
- dashboard: geographical_analysis
  title: GCS Intelligence - Geographical Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  preferred_slug: fvlFmpQIhpkf31Cx83cI02
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

      <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black; font-weight: bold;" href="#">Geographical Analysis</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::errors">Errors</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::events">Events</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - type: button
    name: button_634
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::errors"}'
    row: 28
    col: 22
    width: 2
    height: 2
  - type: button
    name: button_635
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::data_discovery"}'
    row: 28
    col: 0
    width: 3
    height: 2
  - type: button
    name: button_636
    rich_content_json: '{"text":"Share your feedback","description":"","newTab":true,"alignment":"center","size":"large","style":"FILLED","color":"#b0ccfc","href":"https://forms.gle/FJs5Ymhsu5j8o9sC9"}'
    row: 28
    col: 5
    width: 14
    height: 2
  - title: Countries or Region by Selected Aggregate Function
    name: Countries or Region by Selected Aggregate Function
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_google_map
    fields: [object_attributes.selected_measure, regions_information.geographical_value]
    sorts: [regions_information.geographical_value]
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
    hidden_pivots: {}
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      9 - Aggregate Function: object_attributes.aggregate_function
      10 - Map Selection: regions_information.map_selection
      11 - Location Type: regions_information.location_type
      1 - Project Name: project_attributes.project_name
    row: 7
    col: 0
    width: 24
    height: 8
  - title: Selected Country Map
    name: Selected Country Map
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_google_map
    fields: [regions_information.selected_country]
    filters:
      regions_information.selected_country: "-NULL"
    sorts: [regions_information.selected_country]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    map_marker_color: ["#e2ecfd"]
    show_legend: true
    map_value_colors: ["#689cf4", "#689cf4"]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    hidden_pivots: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      7 - Storage Size Unit: object_attributes.size_unit
      9 - Aggregate Function: object_attributes.aggregate_function
      12 - Country Options: regions_information.country_options
    row: 20
    col: 0
    width: 18
    height: 8
  - title: Total aggregated measure
    name: Total aggregated measure
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [regions_information.selected_country, object_attributes.selected_measure]
    filters:
      regions_information.selected_country: "-NULL"
    sorts: [object_attributes.selected_measure desc]
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
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: so5, palette_id: so5-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    map_marker_color: ["#e2ecfd"]
    show_legend: true
    map_value_colors: ["#689cf4", "#689cf4"]
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      7 - Storage Size Unit: object_attributes.size_unit
      9 - Aggregate Function: object_attributes.aggregate_function
      12 - Country Options: regions_information.country_options
    row: 20
    col: 18
    width: 6
    height: 8
  - name: " (2)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 2
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">11</span>
      </div>
    row: 4
    col: 13
    width: 2
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 15
    col: 0
    width: 24
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">10</span>
      </div>
    row: 4
    col: 11
    width: 2
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 4
    col: 8
    width: 3
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 17
    col: 9
    width: 3
    height: 3
  - name: " (8)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">12</span>
      </div>
    row: 17
    col: 12
    width: 2
    height: 3
  - name: " (9)"
    type: text
    title_text: ''
    body_text: ''
    row: 17
    col: 16
    width: 8
    height: 3
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
    listens_to_filters: [2 - Bucket Name, 3 - Location, 4 - Storage Class, 5 - Geographic
        Area, 6 - Countries, 11 - Location Type]
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
    listens_to_filters: [12 - Country Options, 1 - Project Name, 3 - Location, 4 -
        Storage Class, 5 - Geographic Area, 6 - Countries, 11 - Location Type]
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
    explore: object_attributes
    listens_to_filters: [12 - Country Options, 2 - Bucket Name, 1 - Project Name,
      4 - Storage Class, 5 - Geographic Area, 6 - Countries, 11 - Location Type]
    field: regions_information.location
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
    explore: bucket_attributes
    listens_to_filters: [12 - Country Options, 2 - Bucket Name, 1 - Project Name,
      3 - Location, 5 - Geographic Area, 6 - Countries, 11 - Location Type]
    field: bucket_attributes.storage_class
  - name: 5 - Geographic Area
    title: 5 - Geographic Area
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [12 - Country Options, 2 - Bucket Name, 1 - Project Name,
      3 - Location, 4 - Storage Class, 6 - Countries, 11 - Location Type]
    field: regions_information.geographic_area
  - name: 6 - Countries
    title: 6 - Countries
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [12 - Country Options, 2 - Bucket Name, 1 - Project Name,
      3 - Location, 4 - Storage Class, 5 - Geographic Area, 11 - Location Type]
    field: regions_information.countries
  - name: 7 - Storage Size Unit
    title: 7 - Storage Size Unit
    type: field_filter
    default_value: GiB
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.size_unit
  - name: 8 - Created Date
    title: 8 - Created Date
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
    field: bucket_attributes.created_date
  - name: 9 - Aggregate Function
    title: 9 - Aggregate Function
    type: field_filter
    default_value: total^_storage^_size
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.aggregate_function
  - name: 10 - Map Selection
    title: 10 - Map Selection
    type: field_filter
    default_value: countries^_map
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: regions_information.map_selection
  - name: 11 - Location Type
    title: 11 - Location Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [12 - Country Options, 2 - Bucket Name, 1 - Project Name,
      3 - Location, 4 - Storage Class, 5 - Geographic Area, 6 - Countries]
    field: regions_information.location_type
  - name: 12 - Country Options
    title: 12 - Country Options
    type: field_filter
    default_value: select
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: regions_information.country_options
