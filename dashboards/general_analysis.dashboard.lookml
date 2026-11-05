---
- dashboard: general_analysis
  title: GCS Storage Intelligence - General Analysis
  preferred_viewer: dashboards-next
  style: modern
  description: ''
  preferred_slug: xipdgnkWBY6KDrZrC36Hue
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
      \        padding: 10px 24px; \n        text-decoration: none; \n        color:\
      \ #1967d2; \n        background-color: #e8f0fe; \n        font-weight: 700;\
      \ \n        border-radius: 24px;\n        letter-spacing: 0.2px;\n        transition:\
      \ background 0.2s;\n    \" href=\"#\">General Analysis</a>\n    \n    <a style=\"\
      \n        padding: 18px 24px; \n        text-decoration: none; \n        color:\
      \ #5f6368; \n        font-weight: 500;\n        border-bottom: 3px solid transparent;\
      \ \n        transition: background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::cost_management\"\
      >Cost Management</a>\n    \n    <a style=\"\n        padding: 18px 24px; \n\
      \        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500;\n        border-bottom: 3px solid transparent; \n        transition:\
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::security_and_compliance\"\
      >Security & Compliance</a>\n    \n    <a style=\"\n        padding: 18px 24px;\
      \ \n        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500;\n        border-bottom: 3px solid transparent; \n        transition:\
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::context_catalog\"\
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
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        Content-Type is metadata assigned to objects in GCS. It helps identify the object's format, which allows applications to render the object properly:  <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/metadata#content-type"><span style="font-style: italic;" target="_blank">Content-Type</span></a>
      </div>
    row: 37
    col: 47
    width: 23
    height: 6
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        The location value specifies the geographic region where your Google Cloud Storage (GCS) bucket is stored: <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/compute/docs/regions-zones#available" target="_blank"><span style="font-style: italic;">Regions and zones</span></a>
      </div>
    row: 37
    col: 0
    width: 23
    height: 6
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        Storage Class metadata is an element that determines the storage tier for your objects, influencing factors such as cost, performance, and durability: <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/storage-classes/#classes"><span style="font-style: italic;" target="_blank">Storage Class</span></a>
      </div>
    row: 37
    col: 24
    width: 22
    height: 6
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
        Geographic Area is determined by the bucket's location, as specified in the official documentation for Single-Region locations. The available zones are categorized into these regions: North America, South America, Europe, Asia, India, Indonesia, the Middle East, Australia, and Africa: <br> <a style="padding: 5px 15px; text-decoration: none; color: #434343; border-
      bottom: solid 3px black;" href="https://cloud.google.com/storage/docs/locations#location-r"><span style="font-style: italic;" target="_blank">Regions</span></a>
      </div>
    row: 84
    col: 0
    width: 72
    height: 6
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "<div style=\"border-radius: 10px; background-color: #f0f0f0; padding:\
      \ 20px; height: 100%; width: 100%; text-align: justify;\">\n\_ An object's status\
      \ reflects its current state. It can be live, meaning it's the most recent version\
      \ or there's no versioning. If a newer version exists, the object becomes noncurrent.\
      \ Finally, if the object has been soft-deleted, it's temporarily removed but\
      \ can be restored before permanent deletion. For more information:\_\n    <br>\
      \ \n    <a style=\"padding: 5px 15px; text-decoration: none; color: #434343;\"\
      \ href=\"https://cloud.google.com/storage/docs/object-versioning\" target=\"\
      _blank\"> Object Versioning </a> \n    <a style=\"padding: 5px 15px; text-decoration:\
      \ none; color: #434343;\" href=\"https://cloud.google.com/storage/docs/soft-delete\"\
      \ target=\"_blank\"> Soft Delete </a>\n</div>"
    row: 140
    col: 3
    width: 31
    height: 7
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    body_text: ''
    row: 140
    col: 36
    width: 35
    height: 11
    tab_name: ''
  - type: button
    name: button_215
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::cost_management"}'
    row: 163
    col: 63
    width: 9
    height: 4
    tab_name: ''
  - name: " (8)"
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
          Storage overview
      </div>
    row: 8
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Total storage size
    name: Total storage size
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: single_value
    fields: [bucket_attributes.total_storage_size]
    sorts: [bucket_attributes.total_storage_size desc]
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
    single_value_title: Total storage size
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
    note_state: collapsed
    note_display: hover
    note_text: The Total storage size metric represents the cumulative size of all
      objects within the currently selected scope (filtered by Project, Bucket, Location,
      etc.).
    aria_description: A summary scorecard labeled "Total storage size." It displays
      a large key metric representing the total volume of data stored in the current
      selection, followed by its unit of measurement.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      4 - Storage size unit: bucket_attributes.size_unit
    row: 12
    col: 5
    width: 15
    height: 5
    tab_name: ''
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Total buckets
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
    note_state: collapsed
    note_display: hover
    note_text: The Total buckets metric represents the count of unique storage buckets
      identified within the currently selected scope.
    aria_description: A summary scorecard labeled "Total buckets." It displays a large
      numeric value indicating the total count of buckets.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
    row: 12
    col: 20
    width: 15
    height: 5
    tab_name: ''
  - title: Total objects
    name: Total objects
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: single_value
    fields: [bucket_attributes.object_sum]
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
    single_value_title: Total objects
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
    note_state: collapsed
    note_display: hover
    note_text: The Total objects metric represents the aggregate count of individual
      objects (files) stored within the currently selected scope.
    aria_description: A summary scorecard labeled "Total objects." It displays a large
      numeric value indicating the total count of individual storage objects.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
    row: 12
    col: 35
    width: 15
    height: 5
    tab_name: ''
  - title: Average storage size
    name: Average storage size
    model: gcs_storage_intelligence
    explore: object_attributes
    type: single_value
    fields: [object_attributes.average_storage_size]
    filters:
      project_attributes.project_name: ''
      object_attributes.location: ''
      object_attributes.size_unit: GiB
      object_attributes.bucket_name: ''
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
    single_value_title: Average Storage Size
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
    note_state: collapsed
    note_display: hover
    note_text: The Average Storage Size metric represents the mean size of individual
      objects stored within the currently selected scope.
    aria_description: A summary scorecard labeled "Average Storage Size." It displays
      a large numeric value indicating the mean size of the stored objects, followed
      by its unit of measurement.
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      4 - Storage size unit: object_attributes.size_unit
    row: 12
    col: 50
    width: 16
    height: 5
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
          Distribution analysis
      </div>
    row: 17
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Location distribution
    name: Location distribution
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_pie
    fields: [bucket_attributes.selected_measure, bucket_attributes.location]
    filters:
      bucket_attributes.aggregate_function: total^_objects
      bucket_attributes.size_unit: GiB
    sorts: [bucket_attributes.selected_measure desc 0]
    limit: 15
    column_limit: 50
    query_timezone: Asia/Calcutta
    value_labels: legend
    label_type: labPer
    inner_radius: 49
    color_application:
      collection_id: testing
      custom:
        id: fd336274-182a-3411-6913-bd1895fc5bc9
        label: Custom
        type: continuous
        stops:
        - color: "#CE93D8"
          offset: 0
        - color: "#FFFFFF"
          offset: 100
      options:
        steps: 5
    series_colors: {}
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
    note_state: collapsed
    note_display: hover
    note_text: The Location distribution chart visualizes the geographic placement
      of your storage resources. It displays the percentage breakdown of your data
      across different Google Cloud regions (e.g., africa-south1, asia-southeast2)
      based on your active filters.
    aria_description: A donut chart titled "Location distribution." It graphically
      represents the proportional breakdown of storage resources across various geographic
      regions, accompanied by a legend that lists each region and its corresponding
      percentage.
    modern2026: true
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      4 - Storage size unit: bucket_attributes.size_unit
      Distribution analysis - metric selection: bucket_attributes.aggregate_function
    row: 25
    col: 1
    width: 22
    height: 12
    tab_name: ''
  - title: Storage class distribution
    name: Storage class distribution
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.storage_class, object_attributes.selected_measure]
    filters:
      object_attributes.aggregate_function: total^_objects
      project_attributes.project_name: ''
      object_attributes.location: ''
      object_attributes.size_unit: GiB
      object_attributes.bucket_name: ''
    sorts: [object_attributes.selected_measure desc 0]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Calcutta
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
      custom:
        id: 3527739f-62ce-a8d3-986d-f99f0173c7f7
        label: Custom
        type: continuous
        stops:
        - color: "#4DD0E1"
          offset: 0
        - color: "#FFFFFF"
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
    note_state: collapsed
    note_display: hover
    note_text: The Storage Class distribution chart displays the percentage breakdown
      of your stored objects according to their assigned storage class (e.g., Standard,
      Nearline, Coldline, Archive). This visualization helps you understand the tiering
      profile of your data within the selected scope, which is critical for cost optimization.
    modern2026: true
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      4 - Storage size unit: object_attributes.size_unit
      Distribution analysis - metric selection: object_attributes.aggregate_function
    row: 25
    col: 24
    width: 22
    height: 12
    tab_name: ''
  - title: Content-type distribution
    name: Content-type distribution
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.selected_measure, object_attributes.content_type_prefix]
    filters:
      object_attributes.aggregate_function: total^_objects
      project_attributes.project_name: ''
      object_attributes.location: ''
      object_attributes.size_unit: GiB
      object_attributes.bucket_name: ''
    sorts: [object_attributes.selected_measure desc 0]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Calcutta
    value_labels: legend
    label_type: labPer
    inner_radius: 49
    color_application:
      collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
      custom:
        id: fff50226-8e77-6c43-dd11-2f59a4682dee
        label: Custom
        type: continuous
        stops:
        - color: "#FFAB91"
          offset: 0
        - color: "#FFFFFF"
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
    note_state: expanded
    note_display: hover
    note_text: The Content-Type distribution chart visualizes the makeup of your stored
      objects based on their format category (e.g., application, image, text, audio).
      It displays the percentage breakdown of these formats within your current selection,
      helping you understand the nature of the data you are storing.
    aria_description: A donut chart titled "Content-Type distribution." It visually
      represents the proportional breakdown of storage objects categorized by their
      file format. A legend accompanies the chart, listing each content category alongside
      its corresponding percentage.
    modern2026: true
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      4 - Storage size unit: object_attributes.size_unit
      Distribution analysis - metric selection: object_attributes.aggregate_function
    row: 25
    col: 47
    width: 23
    height: 12
    tab_name: ''
  - type: filter
    name: Distribution analysis - metric selection
    row: 21
    col: 1
    width: 12
    height: 4
    tab_name: ''
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 21
    col: 23
    width: 49
    height: 4
    tab_name: ''
  - name: " (11)"
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
          Storage over time
      </div>
    row: 43
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Total objects and total storage size over time
    name: Total objects and total storage size over time
    model: gcs_storage_intelligence
    explore: bucket_attributes_history
    type: looker_line
    fields: [bucket_attributes_history.snapshot_date, bucket_attributes_history.total_storage_size,
      bucket_attributes_history.object_sum]
    fill_fields: [bucket_attributes_history.snapshot_date]
    filters:
      project_attributes.project_name: ''
      bucket_attributes_history.location: ''
      bucket_attributes_history.size_unit: GiB
      bucket_attributes_history.bucket_name: ''
    sorts: [bucket_attributes_history.snapshot_date desc]
    limit: 500
    column_limit: 50
    query_timezone: UTC
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
    advanced_vis_config: |-
      {
        "chart": {
          "backgroundColor": "rgba(0, 0, 0, 0)",
          "inverted": false,
          "style": {
            "fontFamily": "inherit",
            "fontSize": "12px"
          },
          "type": "line"
        },
        "series": [
          {
            "name": "Total Objects",
            "color": "#CE93D8",
            "id": "bucket_attributes_history.object_sum",
            "type": "line",
            "visible": true,
            "yAxis": 0
          },
          {
            "name": "Total Storage Size",
            "color": "#4DD0E1",
            "id": "bucket_attributes_history.total_storage_size",
            "type": "line",
            "visible": true,
            "yAxis": 1
          }
        ],
        "xAxis": {
          "type": "datetime"
        },
        "yAxis": [
          {
            "type": "linear",
            "min": 0,
            "title": {
              "text": "Total Objects"
            }
          },
          {
            "type": "linear",
            "opposite": true,
            "min": 0,
            "title": {
              "text": "Total Storage Size"
            }
          }
        ]
      }
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The Total objects and total storage size over time chart tracks the
      historical trends of your storage usage. It plots two key metrics—the count
      of objects and the total storage size—over a specific date range, allowing you
      to visualize growth patterns and correlations between the number of files and
      their aggregate size.
    aria_description: A line chart titled "Total objects and total storage size over
      time." It displays historical trends with dates on the horizontal axis. Two
      distinct lines are plotted to represent the total object count and total storage
      size respectively, allowing for a visual comparison of growth over the selected
      period.
    modern2026: true
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes_history.bucket_name
      3 - Location: bucket_attributes_history.location
      4 - Storage size unit: bucket_attributes_history.size_unit
    row: 47
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Objects and storage size breakdown by geographic area
    name: Objects and storage size breakdown by geographic area
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_google_map
    fields: [regions_information.geographic_area, object_attributes.object_count,
      object_attributes.total_storage_size]
    filters:
      project_attributes.project_name: ''
      object_attributes.bucket_name: ''
      object_attributes.size_unit: GiB
      object_attributes.location: ''
    sorts: [object_attributes.object_count desc, object_attributes.total_storage_size
        desc]
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
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light_no_labels
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_transit_layer: false
    map_bicycling_layer: false
    map_traffic_layer: false
    map_street_view: false
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    map_always_display_coordinates: false
    show_legend: true
    map_value_colors: ["#FFFFFF", "#1A73E8"]
    map_dual_axis: false
    map_dual_axis_opacity: 0.5
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: The Objects and storage size breakdown by geographic area map provides
      a global view of your data's physical location. It highlights the specific Google
      Cloud regions where your buckets are hosted, using visual indicators to represent
      the concentration of objects or storage volume in each area. This helps in assessing
      data sovereignty and regional usage.
    aria_description: A world map visualization titled "Objects and storage size breakdown
      by geographic area." It highlights specific geographic regions to indicate where
      storage data is physically located. A legend or scale bar is provided to denote
      the intensity or magnitude of the data stored in each highlighted region.
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      4 - Storage size unit: object_attributes.size_unit
    row: 69
    col: 0
    width: 72
    height: 15
    tab_name: ''
  - name: " (12)"
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
          Storage landscape
      </div>
    row: 65
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Top regions by number of buckets
    name: Top regions by number of buckets
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_column
    fields: [bucket_attributes.bucket_count, bucket_attributes.location]
    filters:
      project_attributes.project_name: ''
      bucket_attributes.location: ''
      bucket_attributes.bucket_name: ''
    sorts: [bucket_attributes.bucket_count desc 0]
    limit: 20
    column_limit: 50
    query_timezone: Asia/Calcutta
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
    point_style: circle_outline
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
      collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
      palette_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      bucket_attributes.bucket_count: "#C2185B"
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0.2
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Total Buckets',
          borderRadius: 5
        }]
      }
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The Top regions by number of buckets chart ranks your Google Cloud
      regions based on the count of storage buckets they contain. It displays the
      regions with the highest bucket counts in descending order, allowing you to
      quickly identify where your storage infrastructure is most concentrated.
    aria_description: A bar chart titled "Top regions by number of buckets." It displays
      a ranked list of geographic regions on the horizontal axis, with vertical bars
      indicating the total number of buckets in each region, sorted from highest to
      lowest.
    modern2026: true
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
    row: 90
    col: 0
    width: 72
    height: 19
    tab_name: ''
  - title: Top projects by storage size and total objects
    name: Top projects by storage size and total objects
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [project_attributes.project_name, bucket_attributes.total_storage_size,
      bucket_attributes.object_sum]
    filters:
      project_attributes.project_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
      bucket_attributes.bucket_name: ''
    sorts: [bucket_attributes.total_storage_size desc 0, bucket_attributes.object_sum
        desc]
    limit: 10
    column_limit: 50
    query_timezone: Asia/Calcutta
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
      bucket_attributes.total_storage_size:
        is_active: true
        value_display: true
        palette:
          palette_id: 6e5de87f-8c92-9559-dc3a-3a7d5c501019
          collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
          custom_colors:
          - "#FFFFFF"
          - "#FFAB91"
      bucket_attributes.object_sum:
        is_active: true
        palette:
          palette_id: 38d3ffa1-d535-9cd9-50a7-577ac95a8499
          collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
          custom_colors:
          - "#FFFFFF"
          - "#CE93D8"
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
    note_text: The Top projects by storage size and total objects chart ranks your
      Google Cloud projects based on their storage consumption. It displays two side-by-side
      metrics for each project—the total storage size and the total number of objects—allowing
      you to identify the largest consumers of space and correlate data volume with
      file count.
    aria_description: 'A dual-metric horizontal bar chart titled "Top projects by
      storage size and total objects." It lists project names vertically. For each
      project, two distinct bars are displayed side-by-side: one representing the
      total storage size and the other representing the total count of objects. This
      allows for a direct visual comparison of storage footprint versus file count
      across different projects.'
    listen:
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      4 - Storage size unit: bucket_attributes.size_unit
    row: 109
    col: 0
    width: 72
    height: 14
    tab_name: ''
  - title: Object status
    name: Object status
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.object_status, object_attributes.selected_measure]
    filters:
      object_attributes.aggregate_function: total^_objects
      project_attributes.project_name: ''
      object_attributes.location: ''
      object_attributes.size_unit: GiB
      object_attributes.bucket_name: ''
    sorts: [object_attributes.selected_measure desc 0]
    limit: 30
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 49
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: efe2a072-2019-65f7-9486-08b6eba2aabe
        label: Custom
        type: continuous
        stops:
        - color: "#9FA8DA"
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
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: The Object status chart categorizes your stored objects based on their
      lifecycle state (e.g., Live, Noncurrent, Soft-deleted).
    aria_description: A donut chart titled "Object status." It visually represents
      the proportional distribution of objects across different lifecycle states.
      A legend is provided to identify each status category and its associated percentage.
    modern2026: true
    listen:
      Storage landscape - metric selection: object_attributes.aggregate_function
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      4 - Storage size unit: object_attributes.size_unit
    row: 127
    col: 3
    width: 31
    height: 13
    tab_name: ''
  - title: Content-Type suffix breakdown
    name: Content-Type suffix breakdown
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_pie
    fields: [object_attributes.selected_measure, object_attributes.content_type_suffix]
    filters:
      object_attributes.aggregate_function: total^_objects
      project_attributes.project_name: ''
      object_attributes.bucket_name: ''
      object_attributes.size_unit: GiB
      object_attributes.location: ''
    sorts: [object_attributes.selected_measure desc 0]
    limit: 15
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 49
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: f705dd99-bbbf-a240-1111-e6bb0cec954c
        label: Custom
        type: continuous
        stops:
        - color: "#81C784"
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
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: The Content-Type suffix breakdown chart provides a granular view of
      your stored data by identifying specific file extensions (e.g., JPEG, HTML,
      CSV). Unlike the broader category view, this allows you to see exactly which
      specific file formats consume the most space or appear most frequently within
      your selection.
    aria_description: A donut chart titled "Content-Type suffix breakdown." It displays
      the proportional distribution of objects based on their specific file extensions.
      A detailed legend lists each file suffix (such as OCTET-STREAM or JPEG) alongside
      its percentage contribution to the total.
    modern2026: true
    listen:
      Storage landscape - metric selection: object_attributes.aggregate_function
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      4 - Storage size unit: object_attributes.size_unit
    row: 127
    col: 34
    width: 31
    height: 13
    tab_name: ''
  - type: filter
    name: Storage landscape - metric selection
    row: 123
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - name: " (13)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 123
    col: 12
    width: 60
    height: 4
    tab_name: ''
  - title: Object size information
    name: Object size information
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.bucket_name, object_attributes.object_name, object_attributes.size]
    filters:
      object_attributes.size: ">=50"
      object_attributes.object_age: ">0"
      project_attributes.project_name: ''
      object_attributes.location: ''
      object_attributes.size_unit: GiB
      object_attributes.bucket_name: ''
    sorts: [object_attributes.size desc]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Calcutta
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
    note_text: The Object size information table provides a granular list of individual
      files that meet specific criteria, such as a minimum file size or object age.
      By default, this list is sorted by Object Size, allowing you to instantly identify
      and audit the largest individual files that match your filtered parameters.
    aria_description: A detailed data table titled "Object size information." It displays
      columns for "Bucket Name," "Object Name," and "Object Size." The rows are sorted
      by the "Object Size" column in descending order, listing individual files to
      highlight the largest storage consumers first.
    listen:
      Object storage size: object_attributes.size
      Object age (days): object_attributes.object_age
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      4 - Storage size unit: object_attributes.size_unit
    row: 151
    col: 0
    width: 34
    height: 12
    tab_name: ''
  - type: filter
    name: Object storage size
    row: 147
    col: 0
    width: 9
    height: 4
    tab_name: ''
  - type: filter
    name: Object age (days)
    row: 147
    col: 9
    width: 9
    height: 4
    tab_name: ''
  - title: Bucket aggregate based on object filters
    name: Bucket aggregate based on object filters
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.bucket_name, object_attributes.object_count, object_attributes.total_storage_size]
    filters:
      object_attributes.size: ">=50"
      object_attributes.object_age: ">0"
      project_attributes.project_name: ''
      object_attributes.location: ''
      object_attributes.size_unit: GiB
      object_attributes.bucket_name: ''
    sorts: [object_attributes.object_count desc 0]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Calcutta
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
    note_text: The Bucket aggregate based on object filters table groups the specific
      objects identified by your filters (such as object size and age) into their
      parent buckets. This view allows you to pinpoint exactly which buckets are holding
      the most data that matches your criteria—for example, identifying which specific
      buckets contain the highest concentration of large, aged files.
    aria_description: A data table titled "Bucket aggregate based on object filters."
      It displays columns for "Bucket Name," "Total Objects," and "Total Storage Size."
      The rows are typically sorted by the "Total Objects" count in descending order,
      showing which buckets contain the most files matching the active filters.
    listen:
      Object storage size: object_attributes.size
      Object age (days): object_attributes.object_age
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      4 - Storage size unit: object_attributes.size_unit
    row: 151
    col: 34
    width: 38
    height: 12
    tab_name: ''
  - name: " (14)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    border: 3px solid #70757a;\n    border-radius: 12px;\n    padding: 30px\
      \ 40px;\n    display: flex;\n    justify-content: space-between;\n    align-items:\
      \ center;\n    background-color: #ffffff;\n\">\n\n  <!-- Left: Info Box -->\n\
      \  <div style=\"\n      width: 45%; \n      margin-left: 10px;\n  \">\n    \n\
      \    <!-- Text Box -->\n    <div style=\"\n        background-color: #dbdbdb;\n\
      \        padding: 20px;\n        border-radius: 8px;\n        color: #000000;\n\
      \        font-size: 16px;\n        line-height: 1.5;\n    \">\n      Track the\
      \ Storage Intelligence errors and ingestion process:\n    </div>\n  </div>\n\
      \n  <!-- Right: Button -->\n  <div style=\"width: 48%;\">\n    <a href=\"/dashboards/gcs_storage_intelligence::dataset_status\"\
      \ style=\"\n        background-color: #4db652; \n        color: #ffffff; \n\
      \        text-decoration: none; \n        padding: 20px 20px; \n        border-radius:\
      \ 50px; \n        font-size: 20px; \n        font-weight: 700;\n        box-shadow:\
      \ 0px 4px 6px rgba(0,0,0,0.15);\n        display: block;\n        text-align:\
      \ center;\n        width: 100%;\n        box-sizing: border-box;\n    \">\n\
      \      Storage Intelligence - Dataset status\n    </a>\n  </div>\n\n</div>"
    row: 163
    col: 0
    width: 63
    height: 7
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
    listens_to_filters: [2 - Bucket name, 3 - Location]
    field: project_attributes.project_name
  - name: 2 - Bucket name
    title: 2 - Bucket name
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
    listens_to_filters: [1 - Project name, 2 - Bucket name]
    field: bucket_attributes.location
  - name: 4 - Storage size unit
    title: 4 - Storage size unit
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
  - name: Distribution analysis - metric selection
    title: Distribution analysis - metric selection
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
  - name: Storage landscape - metric selection
    title: Storage landscape - metric selection
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
  - name: Object storage size
    title: Object storage size
    type: field_filter
    default_value: ">=50"
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - "="
      - "!="
      - ">"
      - ">="
      - "<"
      - "<="
      - between
      - "!between"
      - 'null'
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.size
  - name: Object age (days)
    title: Object age (days)
    type: field_filter
    default_value: ">0"
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - "="
      - "!="
      - ">"
      - ">="
      - "<"
      - "<="
      - between
      - "!between"
      - 'null'
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.object_age
