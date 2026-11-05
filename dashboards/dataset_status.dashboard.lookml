---
- dashboard: dataset_status
  title: GCS Storage Intelligence - Dataset Status
  preferred_viewer: dashboards-next
  style: modern
  description: ''
  preferred_slug: ZVB8FZpW76kTEhHMgZIHKd
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
  - type: button
    name: button_304
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::bucket_activity"}'
    row: 112
    col: 63
    width: 9
    height: 4
    tab_name: ''
  - title: Total ingestion events
    name: Total ingestion events
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
    single_value_title: Total ingestion events
    smart_single_value_size: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Tracks the frequency of data ingestion into Storage Intelligence. Monitoring
      these events helps you ensure your dashboard metrics reflect the most up-to-date
      bucket data.
    aria_description: A scorecard titled "Total Ingestion Events." It displays a single
      dynamic number representing the total count of successful data ingestion events
      into the Storage Intelligence Metadata and Activity tables.
    listen:
      Event location: events.general_location
      Event view name: events.general_view_name
      Code label: events.code_label
      Event time: events.event_time
    row: 16
    col: 12
    width: 15
    height: 4
    tab_name: ''
  - title: Global metadata injection
    name: Global metadata injection
    model: gcs_storage_intelligence
    explore: events
    type: single_value
    fields: [events.total_events]
    filters:
      events.event_code: ''
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
    single_value_title: Global metadata injection
    smart_single_value_size: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Tracks the frequency of global metadata ingestion events. Monitoring
      this ensures your dashboard consistently reflects the most up-to-date state
      of your storage environment.
    aria_description: A scorecard titled "Global Metadata Injection." It displays
      a single dynamic number representing the total count of successful metadata
      ingestion events into the Storage Intelligence system.
    listen:
      Event location: events.general_location
      Event view name: events.general_view_name
      Code label: events.code_label
      Event time: events.event_time
    row: 16
    col: 27
    width: 15
    height: 4
    tab_name: ''
  - title: Global activity injection
    name: Global activity injection
    model: gcs_storage_intelligence
    explore: events
    type: single_value
    fields: [events.total_single_region_activity_events]
    filters:
      events.event_code: ''
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
    single_value_title: Global activity injection
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Tracks the frequency of global activity ingestion events. Monitoring
      this ensures your dashboard accurately reflects the latest usage and access
      patterns across your storage environment.
    aria_description: A scorecard titled "Global Activity Injection." It displays
      a single dynamic number representing the total count of successful activity
      log ingestion events into the Storage Intelligence system.
    listen:
      Event location: events.general_location
      Event view name: events.general_view_name
      Code label: events.code_label
      Event time: events.event_time
    row: 16
    col: 42
    width: 15
    height: 4
    tab_name: ''
  - title: Last event time
    name: Last event time
    model: gcs_storage_intelligence
    explore: events
    type: single_value
    fields: [events.event_time]
    sorts: [events.event_time desc]
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
    single_value_title: Last event time
    smart_single_value_size: true
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Tracks the most recent ingestion timestamp. Use this metric to quickly
      verify the freshness of your Storage Intelligence data.
    listen:
      Event location: events.general_location
      Event view name: events.general_view_name
      Code label: events.code_label
      Event time: events.event_time
    row: 20
    col: 27
    width: 15
    height: 4
    tab_name: ''
  - title: Latest events logs
    name: Latest events logs
    model: gcs_storage_intelligence
    explore: events
    type: looker_grid
    fields: [events.general_display_time, events.event_time, events.general_location,
      events.code_label, events.view_name]
    sorts: [events.event_time desc]
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
    note_text: Tracks the detailed log of recent system updates. Monitoring these
      logs helps you ensure specific metadata and activity tables are actively syncing
      with your storage environment.
    aria_description: 'A table titled "Latest events logs." The table contains five
      columns: General Display Time, Event Time, General Location, Code Label, and
      View Name. It lists recent data ingestion events, detailing exactly when the
      update occurred, the associated geographic regions, the type of event, and the
      specific dataset view that was updated.'
    listen:
      Event location: events.general_location
      Event view name: events.general_view_name
      Code label: events.code_label
      Event time: events.event_time
    row: 24
    col: 0
    width: 72
    height: 12
    tab_name: ''
  - title: Metadata & activity events over time
    name: Metadata & activity events over time
    model: gcs_storage_intelligence
    explore: events
    type: looker_line
    fields: [events.general_display_time_date_hour, events.total_single_region_activity_events,
      events.total_single_region_metadata_events]
    sorts: [events.general_display_time_date_hour]
    limit: 500
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Visualizes the historical flow of system updates over time. Monitoring
      these trends ensures your Storage Intelligence dashboard is reliably receiving
      continuous data feeds.
    aria_description: A line chart titled "Metadata & Activity Events over time."
      The horizontal x-axis represents the date and hour, and the vertical y-axis
      represents the event count. The chart features two distinct lines tracking the
      daily volume of "Total Single Region Activity Events" and "Total Single Region
      Metadata Events" successfully ingested into the Storage Intelligence system
      over the selected timeframe.
    modern2026: true
    listen:
      Event location: events.general_location
      Event view name: events.general_view_name
      Code label: events.code_label
      Event time: events.event_time
    row: 36
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Error code by total appearances
    name: Error code by total appearances
    model: gcs_storage_intelligence
    explore: error_attributes
    type: looker_pie
    fields: [error_attributes.error_case, error_attributes.total_errors]
    sorts: [error_attributes.error_case]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce
      custom:
        id: 99f46073-ba3a-31c2-4f76-d4d9b0a7e48b
        label: Custom
        type: continuous
        stops:
        - color: "#AD1457"
          offset: 0
        - color: "#F8BBD0"
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
    note_text: Shows the percentage distribution of configuration errors by type.
      Use this chart to identify the most common setup blockers, such as authorization
      failures or organization boundary issues.
    aria_description: A pie chart titled "Error code by total appearances." It displays
      the percentage distribution of different error types encountered while configuring
      Storage Intelligence. The legend lists common configuration errors—such as bucket
      authorization issues, missing Storage Intelligence configurations, and project
      organization mismatches—alongside their respective percentage of total occurrences.
    modern2026: true
    listen:
      Error type: error_attributes.error_case
      Error location: error_attributes.source_gcs_location
      Error date: error_attributes.error_date
    row: 62
    col: 0
    width: 48
    height: 16
    tab_name: ''
  - title: Total errors
    name: Total errors
    model: gcs_storage_intelligence
    explore: error_attributes
    type: single_value
    fields: [error_attributes.total_errors]
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
    single_value_title: Total errors
    smart_single_value_size: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce,
          palette_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce-sequential-0, options: {
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Shows the overall count of setup and configuration errors. Use this
      high-level metric to gauge the general health of your Storage Intelligence deployment.
    aria_description: A scorecard titled "Total errors." It displays a single dynamic
      number representing the total cumulative count of errors encountered while configuring
      the Storage Intelligence feature.
    listen:
      Error type: error_attributes.error_case
      Error location: error_attributes.source_gcs_location
      Error date: error_attributes.error_date
    row: 68
    col: 48
    width: 24
    height: 4
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: ''
    row: 58
    col: 48
    width: 24
    height: 10
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: ''
    row: 72
    col: 48
    width: 24
    height: 6
    tab_name: ''
  - title: Total errors over time
    name: Total errors over time
    model: gcs_storage_intelligence
    explore: error_attributes
    type: looker_line
    fields: [error_attributes.total_errors, error_attributes.error_date]
    fill_fields: [error_attributes.error_date]
    sorts: [error_attributes.error_date desc]
    limit: 500
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
    show_null_points: true
    interpolation: monotone
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      error_attributes.total_errors: "#AB47BC"
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Total errors
    smart_single_value_size: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce,
          palette_id: f0b1d291-b612-4b2e-80d3-f2a5e41eafce-sequential-0, options: {
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Tracks the daily volume of configuration errors. Use this chart to
      identify sudden spikes, recurring patterns, or trends in setup failures over
      time.
    modern2026: true
    listen:
      Error type: error_attributes.error_case
      Error location: error_attributes.source_gcs_location
      Error date: error_attributes.error_date
    row: 78
    col: 0
    width: 72
    height: 20
    tab_name: ''
  - type: button
    name: button_316
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::security_and_compliance"}'
    row: 112
    col: 0
    width: 9
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
          Events
      </div>
    row: 8
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - name: " (5)"
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
          Errors
      </div>
    row: 54
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Latest errors and troubleshooting suggestions
    name: Latest errors and troubleshooting suggestions
    model: gcs_storage_intelligence
    explore: error_attributes
    type: looker_grid
    fields: [error_attributes.error_date, error_attributes.error_message, error_attributes.troubleshooting]
    filters:
      error_attributes.source_gcs_location: ''
      error_attributes.error_case: ''
      error_attributes.error_date: ''
    sorts: [error_attributes.error_date desc]
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
    series_column_widths:
      error_attributes.error_date: 195
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
    note_text: Provides specific error messages and actionable solutions for recent
      setup failures. Use this table to quickly identify and fix configuration blockers.
    aria_description: 'A table titled "Latest errors and troubleshooting suggestions."
      The table contains three columns: Error Date, Error message, and Troubleshooting.
      It lists recent configuration failures, detailing exactly when each error occurred,
      a specific description of the issue, and actionable steps to resolve the problem.'
    listen:
      Error type: error_attributes.error_case
      Error location: error_attributes.source_gcs_location
      Error date: error_attributes.error_date
    row: 98
    col: 0
    width: 72
    height: 14
    tab_name: ''
  - type: filter
    name: Event view name
    row: 12
    col: 9
    width: 9
    height: 4
    tab_name: ''
  - type: filter
    name: Event time
    row: 12
    col: 27
    width: 9
    height: 4
    tab_name: ''
  - type: filter
    name: Event location
    row: 12
    col: 0
    width: 9
    height: 4
    tab_name: ''
  - type: filter
    name: Code label
    row: 12
    col: 18
    width: 9
    height: 4
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 12
    col: 37
    width: 35
    height: 4
    tab_name: ''
  - type: filter
    name: Error location
    row: 58
    col: 9
    width: 9
    height: 4
    tab_name: ''
  - type: filter
    name: Error date
    row: 58
    col: 18
    width: 9
    height: 4
    tab_name: ''
  - type: filter
    name: Error type
    row: 58
    col: 0
    width: 9
    height: 4
    tab_name: ''
  filters:
  - name: Event location
    title: Event location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: []
    field: events.general_location
  - name: Event view name
    title: Event view name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: []
    field: events.general_view_name
  - name: Code label
    title: Code label
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: []
    field: events.code_label
  - name: Event time
    title: Event time
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: []
    field: events.event_time
  - name: Error type
    title: Error type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: error_attributes
    listens_to_filters: []
    field: error_attributes.error_case
  - name: Error location
    title: Error location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: error_attributes
    listens_to_filters: []
    field: error_attributes.source_gcs_location
  - name: Error date
    title: Error date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: error_attributes
    listens_to_filters: []
    field: error_attributes.error_date
