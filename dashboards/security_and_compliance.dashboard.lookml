---
- dashboard: security_and_compliance
  title: GCS Intelligence - Security and compliance
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  preferred_slug: cdCzppmeFVqFWDubbpWhGQ
  elements:
  - title: Top Buckets by Public Access type & Versioning
    name: Top Buckets by Public Access type & Versioning
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_bar
    fields: [object_attributes.bucket_name, object_attributes.total_storage_size]
    sorts: [object_attributes.total_storage_size desc 0]
    limit: 30
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
      object_attributes.total_storage_size: "#b0ccfc"
    defaults_version: 1
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      9 - Public Access Prevention: bucket_attributes.public_access_prevention
      10 - Versioning (Yes / No): bucket_attributes.versioning
      1 - Project Name: project_attributes.project_name
    row: 10
    col: 0
    width: 24
    height: 11
  - title: Total storage size
    name: Total storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.total_storage_size]
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
    single_value_title: Total storage size
    defaults_version: 1
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      9 - Public Access Prevention: bucket_attributes.public_access_prevention
      10 - Versioning (Yes / No): bucket_attributes.versioning
      1 - Project Name: project_attributes.project_name
    row: 7
    col: 9
    width: 6
    height: 3
  - title: Total objects
    name: Total objects
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.object_count]
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
    single_value_title: Total objects
    defaults_version: 1
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      9 - Public Access Prevention: bucket_attributes.public_access_prevention
      10 - Versioning (Yes / No): bucket_attributes.versioning
      1 - Project Name: project_attributes.project_name
    row: 7
    col: 15
    width: 6
    height: 3
  - title: Total buckets
    name: Total buckets
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: single_value
    fields: [bucket_attributes.bucket_count]
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
    single_value_title: Total buckets
    defaults_version: 1
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      8 - Created Date: bucket_attributes.created_date
      9 - Public Access Prevention: bucket_attributes.public_access_prevention
      10 - Versioning (Yes / No): bucket_attributes.versioning
      1 - Project Name: project_attributes.project_name
    row: 7
    col: 3
    width: 6
    height: 3
  - title: Buckets general information
    name: Buckets general information
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [bucket_attributes.project, bucket_attributes.bucket_name, regions_information.countries,
      regions_information.location]
    sorts: [regions_information.countries, regions_information.location, bucket_attributes.project
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: d4870d04-7ec9-870d-414d-77d614578c57
        label: Custom
        type: continuous
        stops:
        - color: "#689cf4"
          offset: 0
        - color: "#e2ecfd"
          offset: 100
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_attributes.total_storage_size:
        is_active: true
        palette:
          palette_id: e05b4b16-98ba-5d33-e1e7-053225dc0cb9
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#e2ecfd"
          - "#689cf4"
      object_attributes.object_count:
        is_active: true
        palette:
          palette_id: a0ba452d-3462-2fd1-0b4c-0d3fa245b53a
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#e2ecfd"
          - "#689cf4"
    series_text_format:
      bucket_attributes.project:
        align: left
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_font_color: "#FFFF"
    header_background_color: "#b0ccfc"
    conditional_formatting: []
    value_labels: legend
    label_type: labPer
    inner_radius:
    start_angle: 21
    series_colors: {}
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
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      11 - Outside USA (Yes / No): regions_information.outside_usa
      12 - Outside EU (Yes / No): regions_information.outside_eu
      1 - Project Name: project_attributes.project_name
    row: 29
    col: 0
    width: 24
    height: 9
  - title: Top 100 objects with retention expiration time
    name: Top 100 objects with retention expiration time
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.object_name, object_attributes.retention_expiration_time,
      object_attributes.total_storage_size, object_attributes.days_until_expiration]
    filters:
      object_attributes.retention_expiration_time: NOT NULL
    sorts: [object_attributes.days_until_expiration desc, object_attributes.total_storage_size
        desc]
    limit: 100
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: d4870d04-7ec9-870d-414d-77d614578c57
        label: Custom
        type: continuous
        stops:
        - color: "#689cf4"
          offset: 0
        - color: "#e2ecfd"
          offset: 100
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_attributes.total_storage_size:
        is_active: true
        palette:
          palette_id: e05b4b16-98ba-5d33-e1e7-053225dc0cb9
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#e2ecfd"
          - "#689cf4"
      object_attributes.object_count:
        is_active: true
        palette:
          palette_id: a0ba452d-3462-2fd1-0b4c-0d3fa245b53a
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#e2ecfd"
          - "#689cf4"
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_font_color: "#FFFF"
    header_background_color: "#b0ccfc"
    conditional_formatting: []
    value_labels: legend
    label_type: labPer
    inner_radius:
    start_angle: 21
    series_colors: {}
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
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      13 - Days until expiration: object_attributes.days_until_expiration
      1 - Project Name: project_attributes.project_name
    row: 46
    col: 0
    width: 24
    height: 9
  - title: Location Type by Storage size
    name: Location Type by Storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.total_storage_size, regions_information.location_type]
    sorts: [object_attributes.total_storage_size desc 0]
    limit: 30
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: d4870d04-7ec9-870d-414d-77d614578c57
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      1 - Project Name: project_attributes.project_name
    row: 60
    col: 12
    width: 12
    height: 9
  - title: Location Type by Total buckets
    name: Location Type by Total buckets
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_pie
    fields: [regions_information.location_type, bucket_attributes.bucket_count]
    sorts: [bucket_attributes.bucket_count desc 0]
    limit: 30
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: d4870d04-7ec9-870d-414d-77d614578c57
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      4 - Storage Class: bucket_attributes.storage_class
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      8 - Created Date: bucket_attributes.created_date
      1 - Project Name: project_attributes.project_name
    row: 60
    col: 0
    width: 12
    height: 9
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

      <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black; font-weight: bold;" href="#">Security and compliance</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::data_discovery">Data Discovery</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::geographical_analysis">Geographical Analysis</a>

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
    name: button_586
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::data_discovery"}'
    row: 72
    col: 22
    width: 2
    height: 2
  - type: button
    name: button_587
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::usage_and_saving_opportunity"}'
    row: 72
    col: 0
    width: 3
    height: 2
  - type: button
    name: button_588
    rich_content_json: '{"text":"Share your feedback","description":"","newTab":true,"alignment":"center","size":"large","style":"FILLED","color":"#b0ccfc","href":"https://forms.gle/FJs5Ymhsu5j8o9sC9"}'
    row: 72
    col: 5
    width: 14
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 24
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 2
    col: 0
    width: 24
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    body_text: ''
    row: 4
    col: 0
    width: 8
    height: 3
  - name: " (5)"
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
  - name: " (6)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">9</span>
      </div>
    row: 4
    col: 11
    width: 2
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    body_text: ''
    row: 4
    col: 16
    width: 8
    height: 3
  - name: " (8)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">10</span>
      </div>
    row: 4
    col: 13
    width: 2
    height: 3
  - name: " (9)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        <span style="font-weight: bold;">Public Access Prevention</span> can be either inherited or enforced. If inherited, the settings are determined by the organization policy constraint at the project level. If enforced, it is explicitly set for the bucket:  <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/public-access-prevention#inheritance" target="_blank"><span style="font-style: italic;">Public Access Prevention</span></a>
      </div>
    row: 21
    col: 0
    width: 12
    height: 3
  - name: " (10)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        <span style="font-weight: bold;">Object versioning</span> enables the tracking of object modifications, providing a historical record of recent changes for potential future reference. These previous versions are referred to as noncurrent objects:  <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/object-versioning" target="_blank"><span style="font-style: italic;">Object versioning</span></a>
      </div>
    row: 21
    col: 12
    width: 12
    height: 3
  - name: " (11)"
    type: text
    title_text: ''
    body_text: "<div style=\"border-radius: 10px; background-color: #f0f0f0; padding:\
      \ 20px; height: 100%; width: 100%; text-align: justify;\">\nTo filter buckets\
      \ by location, use the following options: Outside EU, Outside the USA. You can\
      \ select both buttons to view buckets in regions that are neither in the EU\
      \ nor the USA. \n</div>"
    row: 38
    col: 7
    width: 12
    height: 3
  - name: " (12)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 41
    col: 0
    width: 24
    height: 2
  - name: " (13)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">11</span>
      </div>
    row: 26
    col: 11
    width: 2
    height: 3
  - name: " (14)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 26
    col: 8
    width: 3
    height: 3
  - name: " (15)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">12</span>
      </div>
    row: 26
    col: 13
    width: 2
    height: 3
  - name: " (16)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">13</span>
      </div>
    row: 43
    col: 12
    width: 2
    height: 3
  - name: " (17)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 58
    col: 0
    width: 24
    height: 2
  - name: " (18)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 43
    col: 9
    width: 3
    height: 3
  - name: " (19)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">In GCS, you can choose from three location types: <span style="font-weight: bold;">Region</span>, a single geographic area with a single zone; <span style="font-weight: bold;">Dual-Region</span>, a specific pair of regions for improved availability; and <span style="font-weight: bold;">Multi-Region</span>, a large geographic area with multiple regions, providing high durability and global accessibility.
      </div>
    row: 69
    col: 0
    width: 24
    height: 3
  - name: " (20)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        An object's <span style="font-weight: bold;">expiration time</span> indicates the time at which the object becomes (or became) eligible for deletion by Object Lifecycle Management. The expiration time might change as the bucket's lifecycle configuration or retention policy change:  <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/lifecycle#expirationtime" target="_blank"><span style="font-style: italic;">Expiration time metadata</span></a>
      </div>
    row: 55
    col: 0
    width: 24
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
    explore: object_attributes
    listens_to_filters: [2 - Bucket Name, 3 - Location, 5 - Geographic Area]
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
    listens_to_filters: [1 - Project Name, 6 - Countries, 3 - Location, 5 - Geographic
        Area]
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
    listens_to_filters: [1 - Project Name, 6 - Countries, 2 - Bucket Name, 5 - Geographic
        Area]
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
    listens_to_filters: [1 - Project Name, 6 - Countries, 2 - Bucket Name, 3 - Location,
      5 - Geographic Area]
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
    listens_to_filters: [1 - Project Name, 6 - Countries, 2 - Bucket Name, 3 - Location]
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
    listens_to_filters: [1 - Project Name, 2 - Bucket Name, 3 - Location, 5 - Geographic
        Area]
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
  - name: 9 - Public Access Prevention
    title: 9 - Public Access Prevention
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
    field: bucket_attributes.public_access_prevention
  - name: 10 - Versioning (Yes / No)
    title: 10 - Versioning (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.versioning
  - name: 11 - Outside USA (Yes / No)
    title: 11 - Outside USA (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
      options:
      - 'Yes'
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: regions_information.outside_usa
  - name: 12 - Outside EU (Yes / No)
    title: 12 - Outside EU (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
      options:
      - 'Yes'
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: regions_information.outside_eu
  - name: 13 - Days until expiration
    title: 13 - Days until expiration
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
