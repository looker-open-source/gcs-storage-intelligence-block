---
- dashboard: cost_management
  title: GCS Storage Intelligence - Cost Management
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: PzGrz33xUIiUi7nhbmHqz0
  theme_name: ''
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
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::error_and_events\"\
      >Error & Events</a>\n  </nav>\n\n  <nav style=\"\n      font-size: 16px; \n\
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
    width: 24
    height: 4
    tab_name: ''
  - type: button
    name: button_200
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::security_and_compliance"}'
    row: 89
    col: 21
    width: 3
    height: 2
    tab_name: ''
  - title: Bucket Distribution by Lifecycle Management
    name: Bucket Distribution by Lifecycle Management
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.selected_measure, bucket_attributes.bucket_name]
    filters:
      bucket_attributes.aggregate_function: total^_objects
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
      5 - Metadata Metric Selection: bucket_attributes.aggregate_function
      6 - Lifecycle: bucket_attributes.lifecycle
      7 - Autoclass: bucket_attributes.enabled
      4 - Storage Size Unit: bucket_attributes.size_unit
      1 - Project Name: project_attributes.project_name
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
    row: 10
    col: 0
    width: 24
    height: 6
    tab_name: ''
  - title: Prefix Distribution
    name: Prefix Distribution
    model: gcs_storage_intelligence
    explore: object_attributes
    type: looker_grid
    fields: [object_attributes.selected_measure, object_attributes.prefix]
    filters:
      object_attributes.prefix_depth: full^_prefix
      object_attributes.aggregate_function: total^_objects
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_attributes.selected_measure:
        is_active: false
    header_background_color: "#F0F0F0"
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
      5 - Metadata Metric Selection: object_attributes.aggregate_function
      4 - Storage Size Unit: object_attributes.size_unit
      1 - Project Name: project_attributes.project_name
      2 - Bucket Name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      8 - Prefix Depth: object_attributes.prefix_depth
    row: 19
    col: 0
    width: 24
    height: 7
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
    row: 16
    col: 0
    width: 13
    height: 3
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-radius: 10px; background-color: #f0f0f0; padding: 20px; height: 100%; width: 100%; text-align: justify;">
      A <b>Prefix</b> in Google Cloud Storage is a string of characters, separated by slashes (/), that creates a virtual directory structure. For example, an object named folder1/folder2/object.suffix has two prefix levels (folder1/ and folder2/), so we can say its Prefix Depth is 2. If you were to select a prefix depth of 3 for this object, the SQL regular expression would fail to find a third level and return NULL. The IFNULL(..., "-") function in the query catches this NULL and converts it to a hyphen ("-"). This is why all objects that don't match the selected depth are aggregated together, allowing you to see the total metrics for all other items under a single "-" category.
    row: 28
    col: 0
    width: 24
    height: 3
    tab_name: ''
  - title: Buckets with the Least Activity
    name: Buckets with the Least Activity
    model: gcs_storage_intelligence
    explore: bucket_activity
    type: looker_grid
    fields: [bucket_activity.bucket_name, bucket_activity.selected_measure, bucket_activity.location]
    filters:
      bucket_activity.aggregate_function: total^_requests
      bucket_activity.throughput_size_unit: GiB
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
      bucket_activity.selected_measure:
        is_active: false
    header_background_color: "#F0F0F0"
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
      9 - Throughput Size Unit: bucket_activity.throughput_size_unit
      10 - Activity Metric Selection: bucket_activity.aggregate_function
      1 - Project Name: project_attributes.project_name
      2 - Bucket Name: bucket_activity.bucket_name
      3 - Location: bucket_activity.location
    row: 31
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Buckets with the Least Information
    name: Buckets with the Least Information
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
      5 - Metadata Metric Selection: bucket_attributes.aggregate_function
      4 - Storage Size Unit: bucket_attributes.size_unit
      1 - Project Name: project_attributes.project_name
      2 - Bucket Name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
    row: 40
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Object Name Search
    name: Object Name Search
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_attributes.selected_measure:
        is_active: false
    header_background_color: "#F0F0F0"
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
      4 - Storage Size Unit: object_attributes.size_unit
      1 - Project Name: project_attributes.project_name
      2 - Bucket Name: object_attributes.bucket_name
      3 - Location: object_attributes.location
      11 - Object Name: object_attributes.object_name
    row: 49
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Class A Ops on Coldline or Archive Objects
    name: Class A Ops on Coldline or Archive Objects
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_grid
    fields: [object_events.object_name, object_events.storage_class, object_events.request_operation]
    filters:
      object_events.storage_class: ARCHIVE,COLDLINE
      object_events.request_http_method: "-DELETE"
    sorts: [object_events.object_name]
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
    header_background_color: "#F0F0F0"
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
      1 - Project Name: project_attributes.project_name
      2 - Bucket Name: object_events.bucket_name
      3 - Location: object_events.location
    row: 58
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - title: Class A Ops on Coldline or Archive - Top Buckets Distribution
    name: Class A Ops on Coldline or Archive - Top Buckets Distribution
    model: gcs_storage_intelligence
    explore: object_events
    type: looker_column
    fields: [object_events.bucket_name, object_events.total_requests]
    filters:
      object_events.request_http_method: "-DELETE"
      object_events.storage_class: ARCHIVE,COLDLINE
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
    listen:
      1 - Project Name: project_attributes.project_name
      2 - Bucket Name: object_events.bucket_name
      3 - Location: object_events.location
    row: 67
    col: 0
    width: 24
    height: 11
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      object_attributes.selected_measure:
        is_active: false
    header_background_color: "#F0F0F0"
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
      by listing files where the Object Name, Object Size, and Md5 Hash are all identical.
      Unlike content-only de-duplication, this view specifically highlights instances
      where the exact same file (with the same name and content) exists in multiple
      locations—such as different buckets or folders—helping you consolidate scattered
      data and reduce storage costs.
    aria_description: A data table titled "Duplicate objects." It lists files that
      have been identified as exact copies based on matching names, sizes, and cryptographic
      hashes. The columns include "Object Name," "Object Size," "Md5 Hash," and "Total
      Objects" (indicating the number of identical copies found), helping users identify
      and remove redundant files.
    listen:
      1 - Project Name: project_attributes.project_name
      2 - Bucket Name: object_attributes.bucket_name
      3 - Location: object_attributes.location
    row: 80
    col: 0
    width: 24
    height: 7
    tab_name: ''
  - type: button
    name: button_211
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::general_analysis"}'
    row: 89
    col: 0
    width: 3
    height: 2
    tab_name: ''
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\
      \ \n    background-color: #ffffff; \n    border: 1px solid #dadce0; \n    border-radius:\
      \ 8px; \n    padding: 24px; \n    box-shadow: 0 1px 2px 0 rgba(60,64,67,0.3),\
      \ 0 1px 3px 1px rgba(60,64,67,0.15);\n    margin-bottom: 20px;\n\">\n\n  <div\
      \ style=\"\n      display: flex; \n      align-items: center; \n      gap: 32px;\
      \ \n      margin-bottom: 30px; \n      border-bottom: 1px solid #f1f3f4; \n\
      \      padding-bottom: 20px;\n  \">\n    <svg style=\"color: #1a73e8; width:\
      \ 32px; height: 32px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n     \
      \   <path d=\"M10 18h4v-2h-4v2zM3 6v2h18V6H3zm3 7h12v-2H6v2z\"/>\n    </svg>\n\
      \    \n    <span style=\"font-size: 22px; font-weight: 500; color: #202124;\"\
      >Filter Applicability Guide</span>\n    \n    <span style=\"font-size: 13px;\
      \ color: #5f6368; margin-left: auto;\">Refer to the numbers on each chart to\
      \ see which filters apply</span>\n  </div>\n\n  <div style=\"\n      display:\
      \ flex; \n      flex-wrap: wrap; \n      gap: 24px; \n      font-size: 14px;\
      \ \n      color: #3c4043;\n  \">\n\n    <div style=\"display: flex; align-items:\
      \ center; gap: 16px; width: 260px;\">\n      <span style=\"flex-shrink: 0; background:\
      \ #e8f0fe; color: #1967d2; font-weight: 700; font-size: 16px; height: 40px;\
      \ width: 40px; border-radius: 50%; display: flex; align-items: center; justify-content:\
      \ center;\">1</span>\n      <span style=\"font-size: 16px;\">Project Name</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 260px;\">\n      <span style=\"flex-shrink: 0; background: #fce8e6;\
      \ color: #c5221f; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >2</span>\n      <span style=\"font-size: 16px;\">Bucket Name</span>\n    </div>\n\
      \n    <div style=\"display: flex; align-items: center; gap: 16px; width: 260px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fef7e0; color: #f09d00;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">3</span>\n\
      \      <span style=\"font-size: 16px;\">Location</span>\n    </div>\n\n    <div\
      \ style=\"display: flex; align-items: center; gap: 16px; width: 260px;\">\n\
      \      <span style=\"flex-shrink: 0; background: #e6f4ea; color: #137333; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">4</span>\n      <span\
      \ style=\"font-size: 16px;\">Storage Size Unit</span>\n    </div>\n\n    <div\
      \ style=\"display: flex; align-items: center; gap: 16px; width: 260px;\">\n\
      \      <span style=\"flex-shrink: 0; background: #e8f0fe; color: #1967d2; font-weight:\
      \ 700; font-size: 16px; height: 40px; width: 40px; border-radius: 50%; display:\
      \ flex; align-items: center; justify-content: center;\">5</span>\n      <span\
      \ style=\"font-size: 16px;\">Metadata Metric Selection</span>\n    </div>\n\n\
      \    <div style=\"display: flex; align-items: center; gap: 16px; width: 260px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fce8e6; color: #c5221f;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">6</span>\n\
      \      <span style=\"font-size: 16px;\">Lifecycle</span>\n    </div>\n\n   \
      \ <div style=\"display: flex; align-items: center; gap: 16px; width: 260px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fef7e0; color: #f09d00;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">7</span>\n\
      \      <span style=\"font-size: 16px;\">Autoclass</span>\n    </div>\n\n   \
      \ <div style=\"display: flex; align-items: center; gap: 16px; width: 260px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #e6f4ea; color: #137333;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">8</span>\n\
      \      <span style=\"font-size: 16px;\">Prefix Depth</span>\n    </div>\n\n\
      \    <div style=\"display: flex; align-items: center; gap: 16px; width: 260px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #e8f0fe; color: #1967d2;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">9</span>\n\
      \      <span style=\"font-size: 16px;\">Throughput Size Unit</span>\n    </div>\n\
      \n    <div style=\"display: flex; align-items: center; gap: 16px; width: 260px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fce8e6; color: #c5221f;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">10</span>\n\
      \      <span style=\"font-size: 16px;\">Activity Metric Selection</span>\n \
      \   </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 260px;\">\n      <span style=\"flex-shrink: 0; background: #fef7e0;\
      \ color: #f09d00; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >11</span>\n      <span style=\"font-size: 16px;\">Object Name</span>\n    </div>\n\
      \n  </div>\n</div>"
    row: 4
    col: 0
    width: 24
    height: 6
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 16
    col: 18
    width: 6
    height: 2
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">8</div>\n\n</div>"
    row: 26
    col: 19
    width: 5
    height: 2
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e8f0fe; \n    color:\
      \ #1967d2; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">9</div>\n\n  <div style=\"\n\
      \    background: #fce8e6; \n    color: #c5221f; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">10</div>\n\n</div>"
    row: 38
    col: 19
    width: 5
    height: 2
    tab_name: ''
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">11</div>\n\n</div>"
    row: 56
    col: 19
    width: 5
    height: 2
    tab_name: ''
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n  <div style=\"\n\
      \    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n</div>"
    row: 47
    col: 19
    width: 5
    height: 2
    tab_name: ''
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n</div>"
    row: 65
    col: 20
    width: 4
    height: 2
    tab_name: ''
  - name: " (11)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n</div>"
    row: 78
    col: 20
    width: 4
    height: 2
    tab_name: ''
  - name: " (12)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n\">\n  \n  <span style=\"font-size: 13px; color:\
      \ #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\n  <div style=\"\
      \n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight: 700; \n\
      \    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">1</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">2</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">3</div>\n\n  <div style=\"\n    background: #e6f4ea; \n    color:\
      \ #137333; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">4</div>\n\n</div>"
    row: 87
    col: 19
    width: 5
    height: 2
    tab_name: ''
  - name: " (13)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 87
    col: 0
    width: 19
    height: 2
    tab_name: ''
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
    listens_to_filters: [2 - Bucket Name, 3 - Location, Object Name]
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
    listens_to_filters: [1 - Project Name, 3 - Location, Has lifecycle policies (Yes
        / No), Autoclass, Object Name]
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
    listens_to_filters: [1 - Project Name, 2 - Bucket Name, Object Name]
    field: bucket_attributes.location
  - name: 4 - Storage Size Unit
    title: 4 - Storage Size Unit
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
  - name: 5 - Metadata Metric Selection
    title: 5 - Metadata Metric Selection
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
  - name: 6 - Lifecycle
    title: 6 - Lifecycle
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - 'Yes'
      - 'No'
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.lifecycle
  - name: 7 - Autoclass
    title: 7 - Autoclass
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_attributes
    listens_to_filters: []
    field: bucket_attributes.enabled
  - name: 8 - Prefix Depth
    title: 8 - Prefix Depth
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
  - name: 9 - Throughput Size Unit
    title: 9 - Throughput Size Unit
    type: field_filter
    default_value: GiB
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: bucket_activity
    listens_to_filters: []
    field: bucket_activity.throughput_size_unit
  - name: 10 - Activity Metric Selection
    title: 10 - Activity Metric Selection
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
  - name: 11 - Object Name
    title: 11 - Object Name
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
