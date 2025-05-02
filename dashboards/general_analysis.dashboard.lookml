---
- dashboard: general_analysis
  title: GCS Intelligence - General Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: ''
  preferred_slug: arq4NdVjuF9Vh48LPqQLlP
  elements:
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 2
    col: 2
    width: 4
    height: 2
  - title: Total Buckets
    name: Total Buckets
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Project Name: project_attributes.project_name
    row: 2
    col: 6
    width: 4
    height: 2
  - title: Total buckets with objects
    name: Total buckets with objects
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.bucket_count]
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
    single_value_title: Total buckets with objects
    defaults_version: 1
    listen:
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 2
    col: 10
    width: 4
    height: 2
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 2
    col: 14
    width: 4
    height: 2
  - title: Average object size
    name: Average object size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.average_storage_size]
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
    single_value_title: Average object size
    defaults_version: 1
    listen:
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 2
    col: 18
    width: 4
    height: 2
  - title: Top Locations by Storage size
    name: Top Locations by Storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.location, object_attributes.total_storage_size]
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 4
    col: 0
    width: 8
    height: 6
  - title: Content-Type breakdown by Storage size
    name: Content-Type breakdown by Storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.total_storage_size, object_attributes.content_type_prefix]
    sorts: [object_attributes.total_storage_size desc 0]
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 4
    col: 8
    width: 8
    height: 6
  - title: Storage Class breakdown by Storage size
    name: Storage Class breakdown by Storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.total_storage_size, object_attributes.storage_class]
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 4
    col: 16
    width: 8
    height: 6
  - title: Top Locations by Object count
    name: Top Locations by Object count
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.location, object_attributes.object_count]
    sorts: [object_attributes.object_count desc 0]
    limit: 30
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius:
    start_angle: 21
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 23
    col: 0
    width: 8
    height: 6
  - title: Content-Type breakdown by Object count
    name: Content-Type breakdown by Object count
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.object_count, object_attributes.content_type_prefix]
    sorts: [object_attributes.object_count desc 0]
    limit: 30
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius:
    start_angle: 21
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 23
    col: 8
    width: 8
    height: 6
  - title: Storage Class breakdown by Object count
    name: Storage Class breakdown by Object count
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.object_count, object_attributes.storage_class]
    sorts: [object_attributes.object_count desc 0]
    limit: 30
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius:
    start_angle: 21
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 23
    col: 16
    width: 8
    height: 6
  - title: Total objects and Storage size breakdown by Geographic area
    name: Total objects and Storage size breakdown by Geographic area
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_google_map
    fields: [regions_information.geographic_area, object_attributes.object_count,
      object_attributes.total_storage_size]
    sorts: [object_attributes.object_count desc, object_attributes.total_storage_size
        desc]
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 29
    col: 0
    width: 24
    height: 9
  - title: Cumulative Total Objects and Storage Size over time
    name: Cumulative Total Objects and Storage Size over time
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_line
    fields: [object_attributes.created_date, object_attributes.object_count, object_attributes.total_storage_size]
    fill_fields: [object_attributes.created_date]
    sorts: [object_attributes.created_date desc]
    limit: 1095
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(offset_list(${object_attributes.object_count},0, 1095))
      label: Total Objects
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: total_objects
      _type_hint: number
    - category: table_calculation
      expression: sum(offset_list(${object_attributes.total_storage_size},0, 1095))
      label: Total Storage Size
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: total_storage_size
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
    listen:
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 13
    col: 0
    width: 24
    height: 10
  - title: Top regions by number of buckets
    name: Top regions by number of buckets
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_column
    fields: [bucket_attributes.bucket_count, bucket_attributes.location]
    sorts: [bucket_attributes.bucket_count desc]
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
    x_axis_label: Region
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      bucket_attributes.bucket_count: "#b0ccfc"
    defaults_version: 1
    listen:
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Project Name: project_attributes.project_name
    row: 41
    col: 0
    width: 24
    height: 12
  - title: Top Projects by Storage size and Total objects
    name: Top Projects by Storage size and Total objects
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [project_attributes.project_name, object_attributes.total_storage_size,
      object_attributes.object_count]
    sorts: [object_attributes.object_count desc]
    limit: 10
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 53
    col: 0
    width: 24
    height: 6
  - title: Object Status breakdown by Storage size
    name: Object Status breakdown by Storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.total_storage_size, object_attributes.object_status]
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 59
    col: 12
    width: 12
    height: 9
  - title: Object Status breakdown by Storage size
    name: Object Status breakdown by Storage size (2)
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.object_status, object_attributes.object_count]
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
      Bucket Name: bucket_attributes.bucket_name
      Location: regions_information.location
      Storage Class: bucket_attributes.storage_class
      Geographic Area: regions_information.geographic_area
      Countries: regions_information.countries
      Created Date: bucket_attributes.created_date
      Storage Size Unit: object_attributes.size_unit
      Project Name: project_attributes.project_name
    row: 59
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

      <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black; font-weight: bold;" href="#">General Analysis</a>

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

      <a style="padding: 5px 15px; text-decoration: none; color: #999999;" href="/
      dashboards/gcs_storage_intelligence::events">Events</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - type: button
    name: button_541
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#b0ccfc","href":"/dashboards/gcs_storage_intelligence::usage_and_saving_opportunity"}'
    row: 71
    col: 22
    width: 2
    height: 2
  - type: button
    name: button_542
    rich_content_json: '{"text":"Share your feedback","description":"","newTab":true,"alignment":"center","size":"large","style":"FILLED","color":"#b0ccfc","href":"https://forms.gle/FJs5Ymhsu5j8o9sC9"}'
    row: 71
    col: 5
    width: 14
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        The location value specifies the geographic region where your Google Cloud Storage (GCS) bucket is stored: <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/compute/docs/regions-zones#available" target="_blank"><span style="font-style: italic;">Regions and zones</span></a>
      </div>
    row: 10
    col: 0
    width: 8
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        Content-Type is a metadata assigned to objects in GCS. It helps identify the object's format, which allows applications to render the object properly:  <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/metadata#content-type"><span style="font-style: italic;" target="_blank">Content-Type</span></a>
      </div>
    row: 10
    col: 8
    width: 8
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        Storage Class metadata is an element that determines the storage tier for your objects, influencing factors such as cost, performance, and durability: <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/storage-classes/#classes"><span style="font-style: italic;" target="_blank">Storage Class</span></a>
      </div>
    row: 10
    col: 16
    width: 8
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        Geographic Area is determined by the bucket's location, as specified in the official documentation for Single-Region locations. The available zones are categorized into these regions: North America, South America, Europe, Asia, India, Indonesia, the Middle East, Australia, and Africa: <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/locations#location-r"><span style="font-style: italic;" target="_blank">Regions</span></a>
      </div>
    row: 38
    col: 0
    width: 24
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        An object's status reflects its current state. It can be live, meaning it's the most recent version or there's no versioning. If a newer version exists, the object becomes noncurrent. Finally, if the object has been soft-deleted, it's temporarily removed but can be restored before permanent deletion. For more information:<br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/object-versioning"><span style="font-style: italic;" target="_blank">Object Versioning </span></a> <br>
      <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/soft-delete"><span style="font-style: italic;" target="_blank">Soft Delete </span></a>
      </div>
    row: 68
    col: 0
    width: 24
    height: 3
  filters:
  - name: Project Name
    title: Project Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [Bucket Name, Location, Storage Class, Geographic Area, Created
        Date]
    field: project_attributes.project_name
  - name: Bucket Name
    title: Bucket Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [Project Name, Countries, Location, Storage Class, Geographic
        Area, Created Date]
    field: bucket_attributes.bucket_name
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [Project Name, Countries, Bucket Name, Storage Class, Geographic
        Area, Created Date]
    field: regions_information.location
  - name: Storage Class
    title: Storage Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [Project Name, Countries, Bucket Name, Location, Geographic
        Area, Created Date]
    field: bucket_attributes.storage_class
  - name: Geographic Area
    title: Geographic Area
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [Project Name, Countries, Bucket Name, Location, Storage Class,
      Created Date]
    field: regions_information.geographic_area
  - name: Countries
    title: Countries
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: [Project Name, Bucket Name, Location, Storage Class, Geographic
        Area, Created Date]
    field: regions_information.countries
  - name: Storage Size Unit
    title: Storage Size Unit
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
  - name: Created Date
    title: Created Date
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
