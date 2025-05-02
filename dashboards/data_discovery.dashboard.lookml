---
- dashboard: data_discovery
  title: GCS Intelligence - Data discovery
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  preferred_slug: ZT1U2rWZN8efeXjlFqv4js
  elements:
  - title: Objects size information
    name: Objects size information
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [bucket_attributes.bucket_name, object_attributes.object_name, object_attributes.total_storage_size,
      object_attributes.generation]
    sorts: [object_attributes.total_storage_size desc]
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
    hidden_fields: [object_attributes.generation]
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      3 - Storage Class: bucket_attributes.storage_class
      4 - Geographic Area: regions_information.geographic_area
      5 - Countries: regions_information.countries
      6 - Storage Size Unit: object_attributes.size_unit
      7 - Created Date: bucket_attributes.created_date
      8 - Size: object_attributes.size
      9 - Object size unit: object_attributes.object_size_unit
      1 - Project Name: project_attributes.project_name
    row: 7
    col: 0
    width: 24
    height: 10
  - title: Distribution of Object sizes within the bucket
    name: Distribution of Object sizes within the bucket
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [bucket_attributes.bucket_name, object_attributes.object_count, object_attributes.total_storage_size]
    sorts: [object_attributes.object_count desc 0]
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
      3 - Storage Class: bucket_attributes.storage_class
      4 - Geographic Area: regions_information.geographic_area
      5 - Countries: regions_information.countries
      6 - Storage Size Unit: object_attributes.size_unit
      7 - Created Date: bucket_attributes.created_date
      8 - Size: object_attributes.size
      9 - Object size unit: object_attributes.object_size_unit
      1 - Project Name: project_attributes.project_name
    row: 17
    col: 0
    width: 12
    height: 10
  - title: Object size unit by Total objects
    name: Object size unit by Total objects
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.total_storage_size, object_attributes.object_size_unit]
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
      3 - Storage Class: bucket_attributes.storage_class
      4 - Geographic Area: regions_information.geographic_area
      5 - Countries: regions_information.countries
      6 - Storage Size Unit: object_attributes.size_unit
      7 - Created Date: bucket_attributes.created_date
      8 - Size: object_attributes.size
      9 - Object size unit: object_attributes.object_size_unit
      1 - Project Name: project_attributes.project_name
    row: 17
    col: 12
    width: 12
    height: 10
  - title: Top Buckets by size unit
    name: Top Buckets by size unit
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_column
    fields: [bucket_attributes.bucket_name, object_attributes.object_size_unit, object_attributes.total_storage_size]
    pivots: [object_attributes.object_size_unit]
    sorts: [object_attributes.object_size_unit, object_attributes.total_storage_size
        desc 1]
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
    stacking: normal
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
      MiB - object_attributes.total_storage_size: "#b0ccfc"
      GiB - object_attributes.total_storage_size: "#689cf4"
      " KiB - object_attributes.object_count": "#dcdcec"
      " KiB - object_attributes.total_storage_size": "#dcdcec"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      3 - Storage Class: bucket_attributes.storage_class
      4 - Geographic Area: regions_information.geographic_area
      5 - Countries: regions_information.countries
      6 - Storage Size Unit: object_attributes.size_unit
      7 - Created Date: bucket_attributes.created_date
      8 - Size: object_attributes.size
      9 - Object size unit: object_attributes.object_size_unit
      1 - Project Name: project_attributes.project_name
    row: 27
    col: 0
    width: 24
    height: 10
  - title: Buckets with the highest number of files
    name: Buckets with the highest number of files
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [bucket_attributes.bucket_name, object_attributes.folder, object_attributes.object_count]
    filters:
      object_attributes.size: "<=30"
      object_attributes.object_size_unit: ''
    sorts: [object_attributes.object_count desc 0]
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
    hidden_fields: []
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      3 - Storage Class: bucket_attributes.storage_class
      4 - Geographic Area: regions_information.geographic_area
      5 - Countries: regions_information.countries
      6 - Storage Size Unit: object_attributes.size_unit
      7 - Created Date: bucket_attributes.created_date
      10 - File extension: object_attributes.file_extension
      '11 - Object Inside a folder ': object_attributes.inside_a_folder
      1 - Project Name: project_attributes.project_name
    row: 42
    col: 0
    width: 24
    height: 8
  - title: Content Type suffix breakdown by Total objects
    name: Content Type suffix breakdown by Total objects
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.content_type_suffix, object_attributes.object_count]
    sorts: [object_attributes.object_count desc 0]
    limit: 30
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius:
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
      3 - Storage Class: bucket_attributes.storage_class
      4 - Geographic Area: regions_information.geographic_area
      5 - Countries: regions_information.countries
      6 - Storage Size Unit: object_attributes.size_unit
      7 - Created Date: bucket_attributes.created_date
      1 - Project Name: project_attributes.project_name
    row: 55
    col: 0
    width: 13
    height: 18
  - title: Objects General Information
    name: Objects General Information
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [project_attributes.project_id, bucket_attributes.bucket_name, object_attributes.object_name]
    sorts: [project_attributes.project_id]
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
    hidden_fields: []
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      3 - Storage Class: bucket_attributes.storage_class
      4 - Geographic Area: regions_information.geographic_area
      5 - Countries: regions_information.countries
      6 - Storage Size Unit: object_attributes.size_unit
      7 - Created Date: bucket_attributes.created_date
      12 - Object Name: object_attributes.object_name
      1 - Project Name: project_attributes.project_name
    row: 60
    col: 13
    width: 11
    height: 11
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

      <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black; font-weight: bold;" href="#">Data Discovery</a>

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
    name: button_616
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::geographical_analysis"}'
    row: 73
    col: 22
    width: 2
    height: 2
  - type: button
    name: button_617
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::security_and_compliance"}'
    row: 73
    col: 0
    width: 3
    height: 2
  - type: button
    name: button_618
    rich_content_json: '{"text":"Share your feedback","description":"","newTab":true,"alignment":"center","size":"large","style":"FILLED","color":"#b0ccfc","href":"https://forms.gle/FJs5Ymhsu5j8o9sC9"}'
    row: 73
    col: 5
    width: 14
    height: 2
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
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 37
    col: 0
    width: 24
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">8</span>
      </div>
    row: 4
    col: 12
    width: 2
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 4
    col: 9
    width: 3
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 55
    col: 13
    width: 11
    height: 2
  - name: " (7)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">9</span>
      </div>
    row: 4
    col: 14
    width: 2
    height: 3
  - name: " (8)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 39
    col: 9
    width: 3
    height: 3
  - name: " (9)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">10</span>
      </div>
    row: 39
    col: 12
    width: 2
    height: 3
  - name: " (10)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 53
    col: 0
    width: 24
    height: 2
  - name: " (11)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 57
    col: 16
    width: 3
    height: 3
  - name: " (12)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">In Google Cloud Storage, a <span style="font-weight: bold;">folder</span> is essentially the first part of an object's path. For example, in the path folder1/folder2/object.suffix, folder1 is the folder. If an object doesn't have a folder in its path, it is stored directly in the bucket.
      </div>
    row: 50
    col: 5
    width: 14
    height: 3
  - name: " (13)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">11</span>
      </div>
    row: 39
    col: 14
    width: 2
    height: 3
  - name: " (14)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">12</span>
      </div>
    row: 57
    col: 19
    width: 2
    height: 3
  - name: " (15)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 71
    col: 13
    width: 11
    height: 2
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
    listens_to_filters: [2 - Bucket Name, 3 - Storage Class, 5 - Countries]
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
    listens_to_filters: [1 - Project Name, 3 - Location, 9 - Object size unit, 10
        - File extension, 12 - Object Name, 3 - Storage Class, 5 - Countries]
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
    listens_to_filters: [1 - Project Name, 9 - Object size unit, 10 - File extension,
      12 - Object Name, 2 - Bucket Name, 3 - Storage Class, 5 - Countries]
    field: regions_information.location
  - name: 3 - Storage Class
    title: 3 - Storage Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [1 - Project Name, 3 - Location, 9 - Object size unit, 10
        - File extension, 12 - Object Name, 2 - Bucket Name, 5 - Countries]
    field: bucket_attributes.storage_class
  - name: 4 - Geographic Area
    title: 4 - Geographic Area
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [1 - Project Name, 3 - Location, 9 - Object size unit, 10
        - File extension, 12 - Object Name, 2 - Bucket Name, 3 - Storage Class, 5
        - Countries]
    field: regions_information.geographic_area
  - name: 5 - Countries
    title: 5 - Countries
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [1 - Project Name, 3 - Location, 9 - Object size unit, 10
        - File extension, 12 - Object Name, 2 - Bucket Name, 3 - Storage Class]
    field: regions_information.countries
  - name: 6 - Storage Size Unit
    title: 6 - Storage Size Unit
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
  - name: 7 - Created Date
    title: 7 - Created Date
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
  - name: 8 - Size
    title: 8 - Size
    type: field_filter
    default_value: "<=30"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.size
  - name: 9 - Object size unit
    title: 9 - Object size unit
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.object_size_unit
  - name: 10 - File extension
    title: 10 - File extension
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.file_extension
  - name: '11 - Object Inside a folder '
    title: '11 - Object Inside a folder '
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - 'Yes'
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.inside_a_folder
  - name: 12 - Object Name
    title: 12 - Object Name
    type: field_filter
    default_value: "%test%"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.object_name
