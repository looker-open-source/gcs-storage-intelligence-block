---
- dashboard: usage_and_saving_opportunity
  title: GCS Intelligence - Usage and saving opportunity
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  preferred_slug: wVo3SXJPhoZ747XgypQXc3
  elements:
  - title: Top 5 fast-growing buckets by storage size
    name: Top 5 fast-growing buckets by storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_column
    fields: [object_attributes.bucket_name, object_attributes.total_storage_size]
    sorts: [object_attributes.total_storage_size desc 0]
    limit: 5
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
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 2
    col: 0
    width: 12
    height: 20
  - title: Top buckets by Lifecycle & Autoclass
    name: Top buckets by Lifecycle & Autoclass
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.total_storage_size, object_attributes.bucket_name]
    filters: {}
    sorts: [object_attributes.total_storage_size desc 0]
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
    enable_conditional_formatting: false
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
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      9 - Lifecycle: bucket_attributes.lifecycle
      10 - Autoclass: bucket_attributes.enabled
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: bucket_attributes.storage_class
    row: 7
    col: 12
    width: 12
    height: 11
  - title: Total objects and Storage size broken down by prefix
    name: Total objects and Storage size broken down by prefix
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.total_storage_size, object_attributes.object_count,
      object_attributes.prefix]
    sorts: [object_attributes.object_count desc]
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
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      11 - Prefix Depth: object_attributes.prefix_depth
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 28
    col: 0
    width: 24
    height: 10
  - title: Objects Non-Live status breakdown
    name: Objects Non-Live status breakdown
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.object_status, object_attributes.object_name, object_attributes.total_storage_size]
    filters:
      object_attributes.live_objects: 'No'
    sorts: [object_attributes.object_status, object_attributes.total_storage_size
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
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      12 - Object Status: object_attributes.object_status
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 46
    col: 0
    width: 24
    height: 9
  - title: Total Objects and Storage size over hard deletion
    name: Total Objects and Storage size over hard deletion
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_line
    fields: [object_attributes.object_count, object_attributes.total_storage_size,
      object_attributes.hard_delete_date]
    fill_fields: [object_attributes.hard_delete_date]
    filters:
      bucket_attributes.storage_class: ''
      object_attributes.soft_deleted_objects: 'Yes'
    sorts: [object_attributes.hard_delete_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: running_total(${object_attributes.object_count})
      label: Total Objects
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: total_objects
      _type_hint: number
    - category: table_calculation
      expression: sum(offset_list(${object_attributes.total_storage_size},0, 500))
      label: Total Storage Size
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: total_storage_size
      _type_hint: number
    - category: table_calculation
      expression: "${object_attributes.object_count}"
      label: test
      value_format:
      value_format_name: ''
      _kind_hint: measure
      table_calculation: test
      _type_hint: number
      is_disabled: true
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: total_objects, id: total_objects,
            name: Total Objects}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: total_storage_size, id: total_storage_size,
            name: Total Storage Size}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      total_objects: "#689cf4"
      total_storage_size: "#b0ccfc"
    hidden_fields: [object_attributes.object_count, object_attributes.total_storage_size]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      12 - Object Status: object_attributes.object_status
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 55
    col: 0
    width: 20
    height: 9
  - title: Total Storage Size
    name: Total Storage Size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.total_storage_size]
    filters:
      bucket_attributes.storage_class: ''
      object_attributes.live_objects: 'No'
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
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      12 - Object Status: object_attributes.object_status
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 55
    col: 20
    width: 4
    height: 3
  - title: Total Objects
    name: Total Objects
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.object_count]
    filters:
      bucket_attributes.storage_class: ''
      object_attributes.live_objects: 'No'
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
    single_value_title: Total Objects
    defaults_version: 1
    hidden_pivots: {}
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      12 - Object Status: object_attributes.object_status
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 58
    col: 20
    width: 4
    height: 3
  - title: Average storage size
    name: Average storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.average_storage_size]
    filters:
      bucket_attributes.storage_class: ''
      object_attributes.live_objects: 'No'
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
    single_value_title: Average storage size
    defaults_version: 1
    hidden_pivots: {}
    listen:
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: regions_information.location
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      12 - Object Status: object_attributes.object_status
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 61
    col: 20
    width: 4
    height: 3
  - title: Top 100 objects with Soft-Deleted policy enabled
    name: Top 100 objects with Soft-Deleted policy enabled
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.object_name, object_attributes.total_storage_size,
      object_attributes.hard_delete_time, object_attributes.days_until_hard_deletion]
    filters:
      object_attributes.live_objects: 'No'
      object_attributes.soft_deleted_objects: 'Yes'
    sorts: [object_attributes.days_until_hard_deletion desc, object_attributes.total_storage_size
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
      5 - Geographic Area: regions_information.geographic_area
      6 - Countries: regions_information.countries
      7 - Storage Size Unit: object_attributes.size_unit
      8 - Created Date: bucket_attributes.created_date
      13 - Days until Hard-Deletion: object_attributes.days_until_hard_deletion
      1 - Project Name: project_attributes.project_name
      4 - Storage Class: object_attributes.storage_class
    row: 69
    col: 0
    width: 24
    height: 10
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #ccc;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 40px; display:
      flex; justify-content: center; gap: 20px;">

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::general_analysis">General Analysis</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black; font-weight: bold;" href="#">Usage and saving opportunity</a>

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::security_and_compliance">Security and compliance</a>

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
    name: button_558
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::security_and_compliance"}'
    row: 79
    col: 22
    width: 2
    height: 2
  - type: button
    name: button_559
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::general_analysis"}'
    row: 79
    col: 0
    width: 3
    height: 2
  - type: button
    name: button_560
    rich_content_json: '{"text":"Share your feedback","description":"","newTab":true,"alignment":"center","size":"large","style":"FILLED","color":"#b0ccfc","href":"https://forms.gle/FJs5Ymhsu5j8o9sC9"}'
    row: 79
    col: 5
    width: 14
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        <span style="font-weight: bold;">Object Lifecycle Management</span> is a set of rules that automate the management of object data over time, while Autoclass is a specific feature that automatically transitions objects between different storage classes based on their access patterns. 
      </div>
    row: 18
    col: 12
    width: 12
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">9</span>
      </div>
    row: 4
    col: 17
    width: 2
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">

      '
    row: 2
    col: 12
    width: 12
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">10</span>
      </div>
    row: 4
    col: 19
    width: 2
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">'
    row: 21
    col: 12
    width: 12
    height: 2
  - name: " (7)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 4
    col: 14
    width: 3
    height: 3
  - name: " (8)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        A <span style="font-weight: bold;">Prefix</span>  in Google Cloud Storage is a string of characters that can be used to organize objects within a bucket by creating a virtual directory structure. For instance, an object named 'folder1/folder2/object.suffix' would have the prefix 'folder1/folder2/'. <br>
      To set the prefix depth, select an option from the dashboard filters. If you choose "First," the output will be a single folder level, like 'folder1/'.
      </div>
    row: 38
    col: 0
    width: 24
    height: 3
  - name: " (9)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">

      '
    row: 41
    col: 0
    width: 24
    height: 2
  - name: " (10)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">11</span>
      </div>
    row: 25
    col: 12
    width: 2
    height: 3
  - name: " (11)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">

      '
    row: 23
    col: 0
    width: 24
    height: 2
  - name: " (12)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">12</span>
      </div>
    row: 43
    col: 12
    width: 2
    height: 3
  - name: " (13)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 25
    col: 9
    width: 3
    height: 3
  - name: " (14)"
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
  - name: " (15)"
    type: text
    title_text: ''
    body_text: '<hr style="border: 2px solid #b0ccfc; border-radius: 10px; margin-top:
      10px; margin-bottom: 10px;">

      '
    row: 64
    col: 0
    width: 24
    height: 2
  - name: " (16)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border: 2px solid #b0ccfc; border-radius: 10px; background-color: white; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 1vw; color: #b0ccfc;">Filters: </span>
      </div>
    row: 66
    col: 9
    width: 3
    height: 3
  - name: " (17)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #b0ccfc; padding: 20px; height: 100%; width: 100%; text-align: center;">
          <span style="font-weight: bold; font-size: 17px; color: white;">13</span>
      </div>
    row: 66
    col: 12
    width: 2
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
        Area, 8 - Created Date, 9 - Lifecycle, 10 - Autoclass, 12 - Object Status,
      13 - Days until Hard-Deletion]
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
    listens_to_filters: [1 - Project Name, 6 - Countries, 3 - Location, 4 - Storage
        Class, 5 - Geographic Area, 8 - Created Date, 9 - Lifecycle, 10 - Autoclass,
      12 - Object Status, 13 - Days until Hard-Deletion]
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
    listens_to_filters: [1 - Project Name, 6 - Countries, 2 - Bucket Name, 4 - Storage
        Class, 5 - Geographic Area, 8 - Created Date, 9 - Lifecycle, 10 - Autoclass,
      12 - Object Status, 13 - Days until Hard-Deletion]
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
      5 - Geographic Area, 8 - Created Date, 9 - Lifecycle, 10 - Autoclass, 12 - Object
        Status, 13 - Days until Hard-Deletion]
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
    listens_to_filters: [1 - Project Name, 6 - Countries, 2 - Bucket Name, 3 - Location,
      4 - Storage Class, 8 - Created Date, 9 - Lifecycle, 10 - Autoclass, 12 - Object
        Status, 13 - Days until Hard-Deletion]
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
    listens_to_filters: [1 - Project Name, 2 - Bucket Name, 3 - Location, 4 - Storage
        Class, 5 - Geographic Area, 8 - Created Date, 9 - Lifecycle, 10 - Autoclass,
      13 - Days until Hard-Deletion]
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
  - name: 9 - Lifecycle
    title: 9 - Lifecycle
    type: field_filter
    default_value: Yes,No
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: bucket_attributes.lifecycle
  - name: 10 - Autoclass
    title: 10 - Autoclass
    type: field_filter
    default_value: Yes,No
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.enabled
  - name: 11 - Prefix Depth
    title: 11 - Prefix Depth
    type: field_filter
    default_value: Full
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.prefix_depth
  - name: 12 - Object Status
    title: 12 - Object Status
    type: field_filter
    default_value: Noncurrent,Soft-deleted
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
  - name: 13 - Days until Hard-Deletion
    title: 13 - Days until Hard-Deletion
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - '1'
      - '2'
      - '3'
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.days_until_hard_deletion
