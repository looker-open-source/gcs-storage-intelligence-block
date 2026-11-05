---
- dashboard: security_and_compliance
  title: GCS Storage Intelligence - Security & Compliance
  preferred_viewer: dashboards-next
  style: modern
  description: ''
  preferred_slug: sOhnu8RbzSYbmALfZMuvCd
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
      \   transition: background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::context_catalog\"\
      >Context Catalog</a>\n  </nav>\n\n  <nav style=\"\n      font-size: 16px; \n\
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
    width: 72
    height: 8
    tab_name: ''
  - type: button
    name: button_88
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::context_catalog"}'
    row: 229
    col: 63
    width: 9
    height: 4
    tab_name: ''
  - type: button
    name: button_99
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::cost_management"}'
    row: 229
    col: 0
    width: 9
    height: 4
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: ''
    row: 73
    col: 12
    width: 60
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
          Data residency
      </div>
    row: 8
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Storage breakdown by location
    name: Storage breakdown by location
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_google_map
    fields: [bucket_attributes.location, regions_information.coordinates, bucket_attributes.selected_measure]
    filters:
      bucket_attributes.location: ''
      project_attributes.project_name: ''
      bucket_attributes.bucket_name: ''
      bucket_attributes.storage_class: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
      regions_information.countries_union: ''
    sorts: [bucket_attributes.selected_measure desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    map_plot_mode: points
    elevation_scale: 1000
    hexagon_radius: 2000
    heatmap_intensity: 1
    heatmap_threshold: 0.05
    heatmap_gridlines: true
    heatmap_gridlines_empty: true
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light_no_labels
    map_position: custom
    map_pannable: true
    map_zoomable: true
    map_transit_layer: false
    map_bicycling_layer: false
    map_traffic_layer: false
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_radius_fixed: 200000
    map_marker_radius_min: 100000
    map_marker_radius_max: 300000
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    map_always_display_coordinates: false
    show_legend: true
    map_value_colors: ["#F3D1DE", "#E7A3BD", "#DB749D", "#CE467C", "#C2185B"]
    map_dual_axis: false
    map_dual_axis_opacity: 0.5
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Visualizes the physical locations of your objects and storage volume
      across the globe, helping you monitor regional compliance and data sovereignty.
    aria_description: A map visualization titled "Objects and storage size breakdown
      by location." It displays a world map with markers indicating the geographic
      regions where your Cloud Storage data is located. A legend indicates a gradient
      representing the varying volume of objects and storage size in each region.
    listen:
      Countries: regions_information.countries_union
      Geographic area: regions_information.geographic_area
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 16
    col: 0
    width: 72
    height: 17
    tab_name: ''
  - type: filter
    name: Geographic area
    row: 12
    col: 1
    width: 7
    height: 4
    tab_name: ''
  - title: Buckets by geographic location
    name: Buckets by geographic location
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
      regions_information.countries_union: ''
      bucket_attributes.storage_class: ''
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
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
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: looker_2026
      options:
        mirror: false
        reverse: false
        stepped: false
      palette_id: looker_2026_categorical_1
    modern2026: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      bucket_attributes.selected_measure:
        is_active: false
    table_show_footer: false
    table_enable_pagination: false
    table_page_size_options: 20, 50, 100
    table_column_hover_highlight_enable: false
    table_show_headers: true
    header_background_color: ''
    header_font_bold: false
    header_font_italic: false
    cell_font_weight: ''
    cell_font_style: ''
    cell_text_alignment: ''
    table_custom_border_enable: false
    table_custom_border_width:
    table_custom_border_style: solid
    conditional_formatting: [{type: along a scale..., value: '', background_color: "#1A73E8",
        font_color: '', color_application: {collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce,
          palette_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce-sequential-0}, bold: false,
        italic: false, strikethrough: false}]
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
    note_text: Highlights where your bucket data is physically located. Monitoring
      this information helps ensure you are meeting regional data sovereignty and
      compliance requirements.
    aria_description: 'A table titled "Bucket and countries information." The table
      contains three columns: Bucket Name, Countries, and the selected metric (such as Total Objects or Total Storage Size). It lists
      individual Cloud Storage buckets, the geographic countries associated with them,
      and the total count of objects stored within each bucket.'
    listen:
      Countries: regions_information.countries_union
      Geographic area: regions_information.geographic_area
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 33
    col: 0
    width: 72
    height: 13
    tab_name: ''
  - type: filter
    name: Countries
    row: 12
    col: 8
    width: 7
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
          Public access posture
      </div>
    row: 46
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Objects by public read access
    name: Objects by public read access
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.read_public_access, object_attributes.object_count]
    filters:
      object_attributes.storage_class: ''
      object_attributes.days_until_expiration: ''
      object_attributes.object_status: ''
      object_attributes.days_until_hard_deletion: ''
    sorts: [object_attributes.read_public_access]
    limit: 500
    column_limit: 50
    inner_radius: 50
    series_colors:
      NOT_PUBLIC: "#C8E6C9"
      PUBLIC: "#81C784"
    value_labels: legend
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Shows the proportional breakdown of stored objects by their public read accessibility status (Read Public Access).
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
    row: 50
    col: 5
    width: 31
    height: 12
    tab_name: ''
  - title: Objects by public write access
    name: Objects by public write access
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.object_count, object_attributes.write_public_access]
    filters:
      object_attributes.storage_class: ''
      object_attributes.days_until_expiration: ''
      object_attributes.object_status: ''
      object_attributes.days_until_hard_deletion: ''
    sorts: [object_attributes.object_count desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      NOT_PUBLIC: "#C5CAE9"
      PUBLIC: "#9FA8DA"
    defaults_version: 1
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Shows the proportional breakdown of stored objects by their public write accessibility status (Write Public Access).
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
    row: 50
    col: 36
    width: 31
    height: 12
    tab_name: ''
  - title: Buckets by uniform bucket level access status
    name: Buckets by uniform bucket level access status
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_bar
    fields: [bucket_attributes.total_row_label, bucket_attributes.bucket_count, bucket_attributes.uniform_bucket_level_access_status]
    pivots: [bucket_attributes.uniform_bucket_level_access_status]
    filters:
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.bucket_count desc 0, bucket_attributes.uniform_bucket_level_access_status
        desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
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
      Disabled: "#BDBDBD"
      Enabled: "#4285F4"
    defaults_version: 1
    hidden_pivots: {}
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Displays the distribution of buckets by Uniform Bucket-Level Access (UBLA) enablement status to audit IAM governance.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 62
    col: 0
    width: 36
    height: 11
    tab_name: ''
  - title: Buckets by public access prevention status
    name: Buckets by public access prevention status
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_bar
    fields: [bucket_attributes.total_row_label, bucket_attributes.public_access_prevention,
      bucket_attributes.bucket_count]
    pivots: [bucket_attributes.public_access_prevention]
    filters:
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.public_access_prevention, bucket_attributes.bucket_count
        desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ENFORCED - bucket_attributes.bucket_count,
            id: ENFORCED - bucket_attributes.bucket_count, name: ENFORCED}, {axisId: INHERITED
              - bucket_attributes.bucket_count, id: INHERITED - bucket_attributes.bucket_count,
            name: INHERITED}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      ENFORCED: "#4285F4"
      INHERITED: "#BDBDBD"
    defaults_version: 1
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Displays the distribution of buckets by their Public Access Prevention configuration (enforced vs. inherited).
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 62
    col: 36
    width: 36
    height: 11
    tab_name: ''
  - title: Publicly accessible objects by bucket
    name: Publicly accessible objects by bucket
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.bucket_name, object_attributes.selected_public_read_metric,
      object_attributes.selected_public_write_metric]
    filters:
      object_attributes.aggregate_function: total^_objects
      object_attributes.storage_class: ''
      object_attributes.days_until_expiration: ''
      object_attributes.object_status: ''
      object_attributes.days_until_hard_deletion: ''
    sorts: [object_attributes.selected_public_read_metric desc]
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
      object_attributes.selected_public_read_metric:
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
    table_custom_border_color: "#dde2eb"
    table_custom_border_style: solid
    cell_font_size: '12'
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Lists individual buckets alongside their public read and public write object metrics to pinpoint containers with public exposure.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Storage size unit: object_attributes.size_unit
      Access posture - metric selection: object_attributes.aggregate_function
    row: 77
    col: 0
    width: 36
    height: 14
    tab_name: ''
  - title: Buckets' public access / uniform access settings
    name: Buckets' public access / uniform access settings
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.bucket_name, bucket_attributes.public_access_prevention,
      bucket_attributes.uniform_bucket_level_access_status]
    sorts: [bucket_attributes.bucket_name]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
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
      bucket_attributes.uniform_bucket_level_access_status: UBLA status
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
    note_text: Lists each bucket's Public Access Prevention and Uniform Bucket-Level Access settings for configuration auditing.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 77
    col: 36
    width: 36
    height: 14
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 133
    col: 15
    width: 27
    height: 4
    tab_name: ''
  - type: filter
    name: Access posture - metric selection
    row: 73
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - name: " (6)"
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
          Encryption posture
      </div>
    row: 91
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Object encryption type
    name: Object encryption type
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.object_encryption_type_formatted, object_attributes.selected_measure]
    filters:
      object_attributes.aggregate_function: total^_objects
      object_attributes.storage_class: ''
      object_attributes.days_until_expiration: ''
      object_attributes.object_status: ''
      object_attributes.days_until_hard_deletion: ''
    sorts: [object_attributes.object_encryption_type_formatted desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Google-managed (GMEK): "#ffab91"
      Customer-supplied (CSEK): "#fbe9e7"
      Customer-managed (CMEK): "#ffccbc"
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Visualizes the distribution of objects across encryption key management types (GMEK, CMEK, and CSEK) based on the selected metric.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      Encryption posture - metric selection I: object_attributes.aggregate_function
      3 - Storage size unit: object_attributes.size_unit
    row: 99
    col: 4
    width: 31
    height: 12
    tab_name: ''
  - title: Bucket encryption type (default)
    name: Bucket encryption type (default)
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_pie
    fields: [bucket_attributes.bucket_default_encryption, bucket_attributes.selected_measure]
    filters:
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.bucket_default_encryption desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Customer-managed (CMEK): "#C8E6C9"
      Google-managed (GMEK): "#81C784"
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Visualizes the distribution of buckets by their default encryption configuration (GMEK vs. CMEK) based on the selected metric.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 99
    col: 35
    width: 31
    height: 12
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 95
    col: 26
    width: 26
    height: 4
    tab_name: ''
  - type: filter
    name: Encryption posture - metric selection I
    row: 95
    col: 0
    width: 13
    height: 4
    tab_name: ''
  - title: Objects by encryption type
    name: Objects by encryption type
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.bucket_name, object_attributes.selected_gmek_metric,
      object_attributes.selected_cmek_metric, object_attributes.selected_csek_metric]
    filters:
      object_attributes.aggregate_function: total^_objects
      object_attributes.storage_class: ''
      object_attributes.days_until_expiration: ''
      object_attributes.object_status: ''
      object_attributes.days_until_hard_deletion: ''
    sorts: [object_attributes.selected_gmek_metric desc]
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
      object_attributes.selected_gmek_metric:
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
    note_text: Provides a bucket-by-bucket breakdown of object metrics segmented across Google-managed (GMEK), customer-managed (CMEK), and customer-supplied (CSEK) encryption keys.
    listen:
      Encryption posture - metric selection II: object_attributes.aggregate_function
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Storage size unit: object_attributes.size_unit
    row: 115
    col: 0
    width: 35
    height: 14
    tab_name: ''
  - title: Allowed encryption types
    name: Allowed encryption types
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.bucket_name, bucket_attributes.default_encryption_type,
      bucket_attributes.bucket_allowed_encryptions]
    filters:
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.bucket_name]
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
      bucket_attributes.default_encryption_type: Default encryption
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
    note_text: Lists each bucket's Default Encryption Type alongside its Enforced Encryption Allowed Types policy.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 115
    col: 35
    width: 37
    height: 14
    tab_name: ''
  - type: filter
    name: Encryption posture - metric selection II
    row: 111
    col: 0
    width: 14
    height: 4
    tab_name: ''
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 111
    col: 16
    width: 35
    height: 4
    tab_name: ''
  - name: " (9)"
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
          Retention posture
      </div>
    row: 129
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Object retention breakdown
    name: Object retention breakdown
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.selected_measure, object_attributes.object_retention_profile]
    filters:
      object_attributes.aggregate_function: total^_objects
      object_attributes.storage_class: ''
      object_attributes.days_until_expiration: ''
      object_attributes.object_status: ''
      object_attributes.days_until_hard_deletion: ''
    sorts: [object_attributes.selected_measure desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Google-managed (GMEK): "#ffab91"
      Customer-supplied (CSEK): "#fbe9e7"
      Customer-managed (CMEK): "#ffccbc"
      Active retention: "#f06292"
      No retention: "#fbe9e7"
      Retention expired: "#f6a3bf"
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Shows the distribution of objects by their object-level retention profile (Active Retention, Expired Retention, or No Retention) based on the selected metric.
    listen:
      Retention posture - metric selection: object_attributes.aggregate_function
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Storage size unit: object_attributes.size_unit
    row: 137
    col: 4
    width: 31
    height: 12
    tab_name: ''
  - title: Object retention mode distribution
    name: Object retention mode distribution
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.selected_measure, object_attributes.retain_until_time_lock_status]
    filters:
      object_attributes.retain_until_time_lock_status: LOCKED,UNLOCKED
      object_attributes.aggregate_function: total^_objects
      object_attributes.storage_class: ''
      object_attributes.days_until_expiration: ''
      object_attributes.object_status: ''
      object_attributes.days_until_hard_deletion: ''
    sorts: [object_attributes.selected_measure desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 0
    series_colors:
      Google-managed (GMEK): "#ffab91"
      Customer-supplied (CSEK): "#fbe9e7"
      Customer-managed (CMEK): "#ffccbc"
      Active retention: "#f06292"
      No retention: "#fbe9e7"
      Retention expired: "#f6a3bf"
      Locked: "#4DD0E1"
      Unlocked: "#B2EBF2"
      UNLOCKED: "#B2EBF2"
      LOCKED: "#4DD0E1"
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
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Shows the breakdown of objects with retention policies by their lock status (Locked vs. Unlocked) based on the selected metric.
    listen:
      Retention posture - metric selection: object_attributes.aggregate_function
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Storage size unit: object_attributes.size_unit
    row: 137
    col: 35
    width: 31
    height: 12
    tab_name: ''
  - type: filter
    name: Retention posture - metric selection
    row: 133
    col: 0
    width: 15
    height: 4
    tab_name: ''
  - title: Bucket retention policy breakdown
    name: Bucket retention policy breakdown
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_pie
    fields: [bucket_attributes.bucket_retention_configuration, bucket_attributes.bucket_count]
    filters:
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.bucket_retention_configuration]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Bucket (uniform) & object allowed retentions: "#ffab91"
      Bucket retention (uniform): "#fec0ae"
      No retention: "#fbe9e7"
      Object retention allowed (granular): "#fcd4ca"
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Displays the proportion of buckets configured with a bucket-level retention policy versus those without one.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 149
    col: 4
    width: 31
    height: 12
    tab_name: ''
  - title: Bucket retention mode distribution (uniform bucket retention)
    name: Bucket retention mode distribution (uniform bucket retention)
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_pie
    fields: [bucket_attributes.bucket_count, bucket_attributes.retention_mode]
    filters:
      bucket_attributes.retention_mode: "-NULL"
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.bucket_count desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 0
    series_colors:
      Bucket (uniform) & object allowed retentions: "#ffab91"
      Bucket retention (uniform): "#fec0ae"
      No retention: "#fbe9e7"
      Object retention allowed (granular): "#fcd4ca"
      Unlocked: "#9FA8DA"
      Locked: "#C5CAE9"
      UNLOCKED: "#9FA8DA"
      LOCKED: "#C5CAE9"
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Displays the breakdown of bucket-level retention policies by retention mode (Locked vs. Unlocked).
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 149
    col: 35
    width: 31
    height: 12
    tab_name: ''
  - title: Object retention by bucket
    name: Object retention by bucket
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.bucket_name, object_attributes.selected_retention_active_metric,
      object_attributes.selected_retention_expired_metric, object_attributes.selected_no_retention_metric]
    filters:
      object_attributes.storage_class: ''
      object_attributes.days_until_expiration: ''
      object_attributes.object_status: ''
      object_attributes.days_until_hard_deletion: ''
    sorts: [object_attributes.selected_no_retention_metric desc, object_attributes.selected_retention_expired_metric
        desc, object_attributes.selected_retention_active_metric desc]
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
      object_attributes.selected_retention_active_metric:
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
    note_text: Lists buckets with their corresponding metrics for objects under Active Retention, Expired Retention, and No Retention.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      Object retention profile: object_attributes.object_retention_profile
    row: 165
    col: 0
    width: 35
    height: 16
    tab_name: ''
  - title: Bucket retention configurations
    name: Bucket retention configurations
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.bucket_name, bucket_attributes.bucket_retention_configuration,
      bucket_attributes.retention_duration_string]
    filters:
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.bucket_name]
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
      bucket_attributes.retention_duration_string: Retention duration
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Lists each bucket's retention policy status and formatted retention duration string for compliance verification.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      Bucket retention configuration: bucket_attributes.bucket_retention_configuration
    row: 165
    col: 35
    width: 37
    height: 16
    tab_name: ''
  - type: filter
    name: Object retention profile
    row: 161
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Bucket retention configuration
    row: 161
    col: 35
    width: 12
    height: 4
    tab_name: ''
  - name: " (10)"
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
          Soft-delete & versioning posture
      </div>
    row: 181
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Soft-delete status
    name: Soft-delete status
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_bar
    fields: [bucket_attributes.total_row_label, bucket_attributes.bucket_count, bucket_attributes.soft_delete_status]
    pivots: [bucket_attributes.soft_delete_status]
    filters:
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.soft_delete_status desc, bucket_attributes.bucket_count
        desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
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
      Disabled: "#BDBDBD"
      Enabled: "#4285F4"
    defaults_version: 1
    hidden_pivots: {}
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Displays the proportion of buckets with Soft Delete enabled versus disabled across the storage environment.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 185
    col: 1
    width: 35
    height: 11
    tab_name: ''
  - title: Versioning status
    name: Versioning status
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_bar
    fields: [bucket_attributes.total_row_label, bucket_attributes.bucket_count, bucket_attributes.versioning_status]
    pivots: [bucket_attributes.versioning_status]
    filters:
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.public_access_prevention: ''
      bucket_attributes.uniform_bucket_level_access: ''
      bucket_attributes.bucket_level_access_disabled: ''
    sorts: [bucket_attributes.versioning_status desc, bucket_attributes.bucket_count
        desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
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
      Disabled: "#BDBDBD"
      Enabled: "#4285F4"
    defaults_version: 1
    hidden_pivots: {}
    modern2026: true
    note_state: collapsed
    note_display: hover
    note_text: Displays the proportion of buckets with Object Versioning enabled versus disabled across the storage environment.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 185
    col: 36
    width: 35
    height: 11
    tab_name: ''
  - title: Objects in soft-deleted state by bucket
    name: Objects in soft-deleted state by bucket
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.bucket_name, object_attributes.object_count]
    filters:
      object_attributes.object_status: Soft-deleted
    sorts: [object_attributes.object_count desc 0]
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
      object_attributes.object_count:
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Lists buckets ranked by the count of objects currently held in a soft-deleted state awaiting recovery or permanent expiration.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
    row: 196
    col: 0
    width: 36
    height: 14
    tab_name: ''
  - title: Bucket's soft-delete and versioning configuration
    name: Bucket's soft-delete and versioning configuration
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.bucket_name, bucket_attributes.soft_delete_status,
      bucket_attributes.soft_delete_retention_duration_string, bucket_attributes.versioning_status]
    sorts: [bucket_attributes.bucket_name]
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
      bucket_attributes.is_soft_delete_enabled_status: Soft-delete status
      bucket_attributes.soft_delete_retention_duration_string: Soft-delete retention
        duration
      bucket_attributes.is_versioning_enabled_status: Versioning status
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Provides a tabular audit of each bucket's Soft Delete status, Soft Delete retention duration, and Object Versioning status.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
    row: 196
    col: 36
    width: 36
    height: 14
    tab_name: ''
  - title: Soft-deleted objects' remaining retention
    name: Soft-deleted objects' remaining retention
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.object_name, object_attributes.hard_delete_time, object_attributes.days_until_hard_deletion,
      object_attributes.size]
    filters:
      object_attributes.object_status: Soft-deleted
      object_attributes.size_unit: GiB
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
      object_attributes.size:
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
    note_state: collapsed
    note_display: hover
    note_text: Tracks the remaining retention period for your soft-deleted objects.
      Monitoring this countdown helps ensure you have adequate time to recover accidentally
      deleted data before irreversible loss.
    aria_description: 'A table titled "Soft-Deleted objects remaining retention."
      The table contains four columns: Object Name, Hard Delete Time, Days until hard
      deletion, and Object Size. It lists individual soft-deleted Cloud Storage objects,
      providing a countdown to their permanent deletion dates alongside their respective
      storage sizes.'
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Storage size unit: object_attributes.size_unit
      Days until hard deletion: object_attributes.days_until_hard_deletion
    row: 214
    col: 0
    width: 72
    height: 15
    tab_name: ''
  - type: filter
    name: Days until hard deletion
    row: 210
    col: 0
    width: 12
    height: 4
    tab_name: ''
  filters:
  - name: 1 - Project name
    title: 1 - Project name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [Geographic area, Countries, 2 - Bucket name]
    field: project_attributes.project_name
  - name: 2 - Bucket name
    title: 2 - Bucket name
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
      - "!null"
      - user_attribute
      - matchesAdvanced
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [Geographic area, Countries, 1 - Project name]
    field: bucket_attributes.bucket_name
  - name: Countries
    title: Countries
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [Geographic area]
    field: regions_information.countries_union
  - name: Geographic area
    title: Geographic area
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: [Countries]
    field: regions_information.geographic_area
  - name: Access posture - metric selection
    title: Access posture - metric selection
    type: field_filter
    default_value: total^_objects
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.aggregate_function
  - name: Encryption posture - metric selection I
    title: Encryption posture - metric selection I
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
  - name: Encryption posture - metric selection II
    title: Encryption posture - metric selection II
    type: field_filter
    default_value: total^_objects
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.aggregate_function
  - name: Retention posture - metric selection
    title: Retention posture - metric selection
    type: field_filter
    default_value: total^_objects
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.aggregate_function
  - name: Object retention profile
    title: Object retention profile
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
    field: object_attributes.object_retention_profile
  - name: Bucket retention configuration
    title: Bucket retention configuration
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
    field: bucket_attributes.bucket_retention_configuration
  - name: 3 - Storage size unit
    title: 3 - Storage size unit
    type: field_filter
    default_value: GiB
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.size_unit
  - name: Days until hard deletion
    title: Days until hard deletion
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.days_until_hard_deletion
