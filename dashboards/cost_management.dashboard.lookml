---
- dashboard: cost_management
  title: GCS Storage Intelligence - Cost Management
  preferred_viewer: dashboards-next
  style: modern
  description: ''
  preferred_slug: PzGrz33xUIiUi7nhbmHqz0
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
      >General Analysis</a>\n    \n    <a style=\"\n        padding: 10px 24px; \n\
      \        text-decoration: none; \n        color: #1967d2; \n        background-color:\
      \ #e8f0fe; \n        font-weight: 700; \n        border-radius: 24px;\n    \
      \    letter-spacing: 0.2px;\n        transition: background 0.2s;\n    \" href=\"\
      #\">Cost Management</a>\n    \n    <a style=\"\n        padding: 18px 24px;\
      \ \n        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
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
  - type: button
    name: button_261
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::security_and_compliance"}'
    row: 160
    col: 63
    width: 9
    height: 4
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style=\"border-radius: 10px; background-color: #f0f0f0; padding:\
      \ 20px; height: 100%; width: 100%; text-align: justify;\">\n<b>Object Lifecycle\
      \ Management</b> is a set of rules that automate the management of object data\
      \ over time, while Autoclass is a specific feature that automatically transitions\
      \ objects between different storage classes based on their access patterns.\
      \ For more information:\_\n    <br> \n    <a style=\"padding: 5px 15px; text-decoration:\
      \ none; color: #434343;\" href=\"https://docs.cloud.google.com/storage/docs/lifecycle\"\
      \ target=\"_blank\"> Object Lifecycle Management </a> "
    row: 27
    col: 0
    width: 44
    height: 7
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
      A <b>Prefix</b> in Google Cloud Storage is a string of characters, separated by slashes (/), that creates a virtual directory structure. For example, an object named folder1/folder2/object.suffix has two prefix levels (folder1/ and folder2/), so we can say its Prefix Depth is 2. If you were to select a prefix depth of 3 for this object, the SQL regular expression would fail to find a third level and return NULL. The IFNULL(..., "-") function in the query catches this NULL and converts it to a hyphen ("-"). This is why all objects that don't match the selected depth are aggregated together, allowing you to see the total metrics for all other items under a single "-" category.
    row: 54
    col: 0
    width: 72
    height: 6
    tab_name: ''
  - type: button
    name: button_272
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::general_analysis"}'
    row: 160
    col: 0
    width: 9
    height: 4
    tab_name: ''
  - title: Bucket distribution by lifecycle management
    name: Bucket distribution by lifecycle management
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.selected_measure, bucket_attributes.bucket_name]
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
    note_state: collapsed
    note_display: hover
    note_text: The Bucket Distribution by Lifecycle Management table is a configuration
      audit tool that lists buckets based on their automation settings. By filtering
      for Lifecycle (Enabled/Disabled) or Autoclass (Enabled/Disabled), you can quickly
      identify which buckets are missing cost-optimization policies or verify which
      ones are successfully managed by automatic storage class transitions.
    aria_description: A data table titled "Bucket Distribution by Lifecycle Management."
      It displays a list of buckets that match specific configuration states, such
      as having Lifecycle rules or Autoclass enabled or disabled. The table includes
      columns for "Bucket Name" and a selectable metric (such as "Total Objects" or
      "Total Storage Size"), allowing users to assess the volume of data affected
      by these settings.
    listen:
      Metric selection - metadata: bucket_attributes.aggregate_function
      5 - Storage class: bucket_attributes.storage_class
      Lifecycle: bucket_attributes.lifecycle
      Autoclass: bucket_attributes.enabled
      4 - Size unit: bucket_attributes.size_unit
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
    row: 12
    col: 0
    width: 72
    height: 15
    tab_name: ''
  - type: filter
    name: Metric selection - metadata
    row: 8
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Lifecycle
    row: 8
    col: 14
    width: 9
    height: 4
    tab_name: ''
  - type: filter
    name: Autoclass
    row: 8
    col: 26
    width: 10
    height: 4
    tab_name: ''
  - title: Prefix distribution
    name: Prefix distribution
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.selected_measure, object_attributes.prefix]
    filters:
      object_attributes.prefix_depth: full^_prefix
      object_attributes.aggregate_function: total^_objects
      project_attributes.project_name: ''
      object_attributes.bucket_name: ''
      object_attributes.location: ''
      object_attributes.size_unit: GiB
    sorts: [object_attributes.selected_measure desc]
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
      object_attributes.selected_measure:
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
    note_state: collapsed
    note_display: hover
    note_text: The Prefix Distribution table analyzes your storage hierarchy by grouping
      data according to its virtual folder structure (prefixes). By adjusting the
      Prefix Depth filter, you can control the directory level being analyzed. The
      table then aggregates usage based on your selected metric—Total Objects or Total
      Storage Size—allowing you to identify which specific folders or directory levels
      are consuming the most resources.
    aria_description: 'A data table titled "Prefix Distribution" followed by a descriptive
      text block explaining Google Cloud Storage prefixes. The table contains two
      columns: "Object Prefix" and a selectable metric column (such as "Total Objects"
      or "Total Storage Size"). The rows list directory paths sorted by the metric
      value in descending order. The first row often contains a hyphen (-), representing
      aggregated data for objects that do not match the selected directory depth.'
    listen:
      5 - Storage class: object_attributes.storage_class
      4 - Size unit: object_attributes.size_unit
      Prefix depth: object_attributes.prefix_depth
      Metric selection - metadata I: object_attributes.aggregate_function
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
    row: 38
    col: 0
    width: 72
    height: 16
    tab_name: ''
  - type: filter
    name: Prefix depth
    row: 34
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - type: filter
    name: Metric selection - metadata I
    row: 34
    col: 14
    width: 12
    height: 4
    tab_name: ''
  - title: Buckets with the least activity
    name: Buckets with the least activity
    model: gcs_storage_intelligence
    explore: bucket_activity
    type: looker_grid
    fields: [bucket_activity.bucket_name, bucket_activity.selected_measure, bucket_activity.location]
    filters:
      bucket_activity.aggregate_function: total^_requests
      bucket_activity.throughput_size_unit: GiB
      project_attributes.project_name: ''
      bucket_activity.bucket_name: ''
      bucket_activity.location: ''
    sorts: [bucket_activity.selected_measure]
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
      bucket_activity.selected_measure:
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
    note_text: The Buckets with the Least Activity table identifies the storage buckets
      with the lowest operational volume based on your chosen metric. By using the
      Activity Metric Selection filter, you can rank buckets by a wide range of interaction
      types—including Total Requests, Data Ingress/Egress, or specific error codes
      like Total 400 Error Responses. This view is essential for finding dormant or
      underutilized buckets (lowest traffic) or determining which buckets are least
      affected by specific error patterns.
    aria_description: 'A data table titled "Buckets with the Least Activity." It displays
      three columns: "Bucket Name," "Location," and a dynamic third column reflecting
      the selected activity metric (e.g., "Total 400 Error Responses" or "Total Read
      Requests"). The rows are sorted in ascending order, listing the buckets with
      the lowest counts or throughput values first.'
    listen:
      Selected metric - activity: bucket_activity.aggregate_function
      4 - Size unit: bucket_activity.throughput_size_unit
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_activity.bucket_name
      3 - Location: bucket_activity.location
    row: 64
    col: 0
    width: 72
    height: 13
    tab_name: ''
  - type: filter
    name: Selected metric - activity
    row: 60
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - title: Buckets with the least information
    name: Buckets with the least information
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.selected_measure, bucket_attributes.bucket_name]
    filters:
      bucket_attributes.aggregate_function: total^_objects
      project_attributes.project_name: ''
      bucket_attributes.bucket_name: ''
      bucket_attributes.location: ''
      bucket_attributes.size_unit: GiB
    sorts: [bucket_attributes.selected_measure]
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
    note_state: collapsed
    note_display: hover
    note_text: The Buckets with the Least Information table highlights storage containers
      with the smallest footprint. You can toggle the view between Total Objects (to
      find empty or near-empty buckets) or Total Storage Size (to identify buckets
      consuming minimal space). This is particularly useful for identifying cleanup
      candidates or validating that certain buckets are successfully archiving data.
    aria_description: 'A data table titled "Buckets with the Least Information." It
      displays two columns: "Bucket Name" and a selectable metric column (currently
      showing "Total Objects"). The rows are sorted in ascending order (lowest values
      first), listing buckets with zero or very few items to help identify empty or
      underutilized resources.'
    listen:
      Selected metric - metadata II: bucket_attributes.aggregate_function
      5 - Storage class: bucket_attributes.storage_class
      4 - Size unit: bucket_attributes.size_unit
      1 - Project name: project_attributes.project_name
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
    row: 81
    col: 0
    width: 72
    height: 14
    tab_name: ''
  - type: filter
    name: Selected metric - metadata II
    row: 77
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - title: Object name search
    name: Object name search
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [project_attributes.project_name, object_attributes.object_name, object_attributes.size]
    filters:
      object_attributes.aggregate_function: total^_objects
      project_attributes.project_name: ''
      object_attributes.bucket_name: ''
      object_attributes.size_unit: GiB
      object_attributes.object_name: "%temp%"
      object_attributes.location: ''
    sorts: [object_attributes.size desc]
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
      object_attributes.selected_measure:
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
    note_state: collapsed
    note_display: hover
    note_text: The Object Name Search table helps you perform ad-hoc audits by listing
      specific files that match a text pattern you define. By using the Object Name
      filter (e.g., "contains temp", "starts with backup"), you can instantly locate
      groups of files based on their naming conventions and verify their size. This
      is particularly useful for identifying and cleaning up temporary files, logs,
      or other specific datasets across your projects.
    aria_description: A data table listing individual storage objects that match the
      active text filter. It displays columns for "Project Name," "Object Name," and
      "Object Size." The rows are sorted by "Object Size" in descending order, allowing
      you to quickly assess the storage footprint of files with similar names (such
      as those containing the word "temp").
    listen:
      5 - Storage class: object_attributes.storage_class
      4 - Size unit: object_attributes.size_unit
      Object name: object_attributes.object_name
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
    row: 99
    col: 0
    width: 72
    height: 14
    tab_name: ''
  - type: filter
    name: Object name
    row: 95
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - title: Class A ops on coldline or archive objects
    name: Class A ops on coldline or archive objects
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_grid
    fields: [object_events.object_name, object_events.storage_class, object_events.request_operation]
    filters:
      object_events.storage_class: ARCHIVE,COLDLINE
      object_events.request_http_method: "-DELETE"
      project_attributes.project_name: ''
      object_events.bucket_name: ''
      object_events.location: ''
    sorts: [object_events.object_name]
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
    note_text: The Class A Ops on Coldline or Archive Objects table details specific
      high-cost operations performed on your archival data. Since "Class A" requests
      (such as inserts, updates, or rewrites) incur significantly higher fees when
      executed on Coldline or Archive storage classes, this view is critical for auditing
      usage patterns. It helps you identify processes that may be inadvertently triggering
      expensive operations on long-term storage data.
    aria_description: 'A data table titled "Class A Ops on Coldline or Archive Objects."
      It displays three columns: "Object Name," "Storage Class" (specifically filtering
      for Coldline or Archive), and "Request Operation" (such as storage.objects.insert
      or storage.objects.update). The table lists individual operations to highlight
      specific instances where high-cost requests were made against archival storage.'
    listen:
      Request completion time: object_events.request_completion_time
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_events.bucket_name
      3 - Location: object_events.location
    row: 117
    col: 0
    width: 72
    height: 13
    tab_name: ''
  - type: filter
    name: Request completion time
    row: 113
    col: 0
    width: 12
    height: 4
    tab_name: ''
  - title: Class A ops on coldline or archive objects - top buckets distribution
    name: Class A ops on coldline or archive objects - top buckets distribution
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_column
    fields: [object_events.bucket_name, object_events.total_requests]
    filters:
      object_events.request_http_method: "-DELETE"
      object_events.storage_class: ARCHIVE,COLDLINE
      project_attributes.project_name: ''
      object_events.bucket_name: ''
      object_events.location: ''
    sorts: [object_events.total_requests desc 0]
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
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      object_events.total_requests: "#FFAB91"
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Total Requests',
          borderRadius: 5
        }]
      }
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The Class A Ops on Coldline or Archive - Top Buckets Distribution chart
      identifies the specific buckets responsible for the highest volume of expensive
      operations on archival data. By ranking buckets based on their "Class A" request
      counts (such as overwrites or immediate retrievals on Coldline/Archive storage),
      this visualization helps you target cost-optimization efforts toward the specific
      containers driving up your retrieval or operation fees.
    aria_description: A vertical bar chart titled "Class A Ops on Coldline or Archive
      - Top Buckets Distribution." It displays "Bucket Name" on the horizontal axis
      and "Total Requests" on the vertical axis. The bars are sorted in descending
      order from left to right, visually highlighting which buckets are incurring
      the most high-cost operations on cold or archive storage classes.
    modern2026: true
    listen:
      Request completion time: object_events.request_completion_time
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_events.bucket_name
      3 - Location: object_events.location
    row: 130
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Duplicate objects
    name: Duplicate objects
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.object_name, object_attributes.size, object_attributes.md5_hash,
      object_attributes.object_count]
    filters:
      object_attributes.aggregate_function: total^_objects
      object_attributes.size_unit: GiB
      object_attributes.object_count: ">=2"
      project_attributes.project_name: ''
      object_attributes.bucket_name: ''
      object_attributes.location: ''
    sorts: [object_attributes.object_count desc]
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
      object_attributes.selected_measure:
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
    note_state: expanded
    note_display: hover
    note_text: The Duplicate objects table identifies exact redundancy in your storage
      by listing files where the Object Name, Object Size, and MD5 Hash are all identical.
      Unlike content-only de-duplication, this view specifically highlights instances
      where the exact same file (with the same name and content) exists in multiple
      locations—such as different buckets or folders—helping you consolidate scattered
      data and reduce storage costs.
    aria_description: A data table titled "Duplicate objects." It lists files that
      have been identified as exact copies based on matching names, sizes, and cryptographic
      hashes. The columns include "Object Name," "Object Size," "MD5 Hash," and "Total
      Objects" (indicating the number of identical copies found), helping users identify
      and remove redundant files.
    listen:
      5 - Storage class: object_attributes.storage_class
      1 - Project name: project_attributes.project_name
      2 - Bucket name: object_attributes.bucket_name
      3 - Location: object_attributes.location
    row: 148
    col: 0
    width: 72
    height: 12
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
    listens_to_filters: [2 - Bucket name, 3 - Location, Object Name]
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
    listens_to_filters: [3 - Location, Has lifecycle policies (Yes / No), Autoclass,
      Object Name, 1 - Project name]
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
    listens_to_filters: [2 - Bucket name, Object Name, 1 - Project name]
    field: bucket_attributes.location
  - name: 4 - Size unit
    title: 4 - Size unit
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
  - name: 5 - Storage class
    title: 5 - Storage class
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
  - name: Metric selection - metadata
    title: Metric selection - metadata
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
  - name: Lifecycle
    title: Lifecycle
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.lifecycle
  - name: Autoclass
    title: Autoclass
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options:
      - 'Yes'
      - 'No'
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.enabled
  - name: Prefix depth
    title: Prefix depth
    type: field_filter
    default_value: full^_prefix
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.prefix_depth
  - name: Metric selection - metadata I
    title: Metric selection - metadata I
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
  - name: Selected metric - activity
    title: Selected metric - activity
    type: field_filter
    default_value: total^_requests
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: gcs_storage_intelligence
    explore: bucket_activity
    listens_to_filters: []
    field: bucket_activity.aggregate_function
  - name: Selected metric - metadata II
    title: Selected metric - metadata II
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
  - name: Object name
    title: Object name
    type: field_filter
    default_value: "%temp%"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_attributes
    listens_to_filters: []
    field: object_attributes.object_name
  - name: Request completion time
    title: Request completion time
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_events
    listens_to_filters: []
    field: object_events.request_completion_time
