---
- dashboard: error_and_events
  title: GCS Storage Intelligence - Error & Events
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 4gWEvfPmg0qAdNVo1qpPJj
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
      >General Analysis</a>\n    \n    <a style=\"\n        padding: 18px 24px; \n\
      \        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500;\n        border-bottom: 3px solid transparent; \n        transition:\
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::cost_management\"\
      >Cost Management</a>\n    \n    <a style=\"\n        padding: 18px 24px; \n\
      \        text-decoration: none; \n        color: #5f6368; \n        font-weight:\
      \ 500;\n        border-bottom: 3px solid transparent; \n        transition:\
      \ background 0.2s;\n    \" href=\"/dashboards/gcs_storage_intelligence::security_and_compliance\"\
      >Security & Compliance</a>\n    \n    <a style=\"\n        padding: 10px 24px;\
      \ \n        text-decoration: none; \n        color: #1967d2; \n        background-color:\
      \ #e8f0fe; \n        font-weight: 700; \n        border-radius: 24px;\n    \
      \    letter-spacing: 0.2px;\n        transition: background 0.2s;\n    \" href=\"\
      #\">Error & Events</a>\n  </nav>\n\n  <nav style=\"\n      font-size: 16px;\
      \ \n      display: flex; \n      justify-content: center; \n      align-items:\
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
    name: button_248
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::bucket_activity"}'
    row: 70
    col: 21
    width: 3
    height: 2
    tab_name: ''
  - title: Total Ingestion Events
    name: Total Ingestion Events
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
    single_value_title: Total Ingestion Events
    smart_single_value_size: false
    defaults_version: 1
    listen:
      1 - Event Location: events.general_location
      2 - Event View Name: events.general_view_name
      3 - Code Label: events.code_label
      4 -Event Time: events.event_time
    row: 13
    col: 4
    width: 5
    height: 2
    tab_name: ''
  - title: Global Metadata Injection
    name: Global Metadata Injection
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
    single_value_title: Global Metadata Injection
    smart_single_value_size: false
    defaults_version: 1
    listen:
      1 - Event Location: events.general_location
      2 - Event View Name: events.general_view_name
      3 - Code Label: events.code_label
      4 -Event Time: events.event_time
    row: 13
    col: 9
    width: 5
    height: 2
    tab_name: ''
  - title: Total Single Region Events
    name: Total Single Region Events
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
    single_value_title: Global Activity Injection
    smart_single_value_size: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Event Location: events.general_location
      2 - Event View Name: events.general_view_name
      3 - Code Label: events.code_label
      4 -Event Time: events.event_time
    row: 13
    col: 14
    width: 5
    height: 2
    tab_name: ''
  - title: Last Event Time
    name: Last Event Time
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
    single_value_title: Last Event Time
    smart_single_value_size: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      1 - Event Location: events.general_location
      2 - Event View Name: events.general_view_name
      3 - Code Label: events.code_label
      4 -Event Time: events.event_time
    row: 15
    col: 9
    width: 5
    height: 2
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      1 - Event Location: events.general_location
      2 - Event View Name: events.general_view_name
      3 - Code Label: events.code_label
      4 -Event Time: events.event_time
    row: 18
    col: 0
    width: 24
    height: 6
    tab_name: ''
  - title: Metadata & Activity Events over time
    name: Metadata & Activity Events over time
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
    listen:
      1 - Event Location: events.general_location
      2 - Event View Name: events.general_view_name
      3 - Code Label: events.code_label
      4 -Event Time: events.event_time
    row: 26
    col: 0
    width: 24
    height: 9
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
    listen:
      6 - Error Location: error_attributes.source_gcs_location
      5 - Error Type: error_attributes.error_case
      7 - Error Date: error_attributes.error_date
    row: 40
    col: 0
    width: 16
    height: 8
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
    listen:
      6 - Error Location: error_attributes.source_gcs_location
      5 - Error Type: error_attributes.error_case
      7 - Error Date: error_attributes.error_date
    row: 43
    col: 16
    width: 8
    height: 2
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: ''
    row: 40
    col: 16
    width: 8
    height: 3
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: ''
    row: 45
    col: 16
    width: 8
    height: 1
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
    listen:
      6 - Error Location: error_attributes.source_gcs_location
      5 - Error Type: error_attributes.error_case
      7 - Error Date: error_attributes.error_date
    row: 48
    col: 0
    width: 24
    height: 10
    tab_name: ''
  - title: Latest errors and troubleshooting suggestions
    name: Latest errors and troubleshooting suggestions
    model: gcs_storage_intelligence
    explore: error_attributes
    type: looker_grid
    fields: [error_attributes.error_date, error_attributes.error_message, error_attributes.troubleshooting]
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
    table_theme: gray
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
    listen:
      6 - Error Location: error_attributes.source_gcs_location
      5 - Error Type: error_attributes.error_case
      7 - Error Date: error_attributes.error_date
    row: 60
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - type: button
    name: button_261
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","color":"#828487","href":"/dashboards/gcs_storage_intelligence::security_and_compliance"}'
    row: 70
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
      \ center; gap: 16px; width: 280px;\">\n      <span style=\"flex-shrink: 0; background:\
      \ #e8f0fe; color: #1967d2; font-weight: 700; font-size: 16px; height: 40px;\
      \ width: 40px; border-radius: 50%; display: flex; align-items: center; justify-content:\
      \ center;\">1</span>\n      <span style=\"font-size: 16px;\">Event Location</span>\n\
      \    </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #fce8e6;\
      \ color: #c5221f; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >2</span>\n      <span style=\"font-size: 16px;\">Event View Name</span>\n \
      \   </div>\n\n    <div style=\"display: flex; align-items: center; gap: 16px;\
      \ width: 280px;\">\n      <span style=\"flex-shrink: 0; background: #fef7e0;\
      \ color: #f09d00; font-weight: 700; font-size: 16px; height: 40px; width: 40px;\
      \ border-radius: 50%; display: flex; align-items: center; justify-content: center;\"\
      >3</span>\n      <span style=\"font-size: 16px;\">Code Label</span>\n    </div>\n\
      \n    <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #e6f4ea; color: #137333;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">4</span>\n\
      \      <span style=\"font-size: 16px;\">Event Time</span>\n    </div>\n\n  \
      \  <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #e8f0fe; color: #1967d2;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">5</span>\n\
      \      <span style=\"font-size: 16px;\">Error Type</span>\n    </div>\n\n  \
      \  <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fce8e6; color: #c5221f;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">6</span>\n\
      \      <span style=\"font-size: 16px;\">Error Location</span>\n    </div>\n\n\
      \    <div style=\"display: flex; align-items: center; gap: 16px; width: 280px;\"\
      >\n      <span style=\"flex-shrink: 0; background: #fef7e0; color: #f09d00;\
      \ font-weight: 700; font-size: 16px; height: 40px; width: 40px; border-radius:\
      \ 50%; display: flex; align-items: center; justify-content: center;\">7</span>\n\
      \      <span style=\"font-size: 16px;\">Error Date</span>\n    </div>\n\n  </div>\n\
      </div>"
    row: 4
    col: 0
    width: 24
    height: 6
    tab_name: ''
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 13
    col: 19
    width: 5
    height: 3
    tab_name: ''
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    display: flex; \n    align-items: center; \n    padding: 24px 0 16px 0;\
      \ \n    color: #202124;\n\">\n  <svg style=\"color: #1a73e8; width: 32px; height:\
      \ 32px; margin-right: 24px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n\
      \     <path d=\"M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2\
      \ 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z\"/>\n  </svg>\n\n  <span style=\"font-size:\
      \ 24px; font-weight: 400;\">Events</span>\n</div>"
    row: 10
    col: 0
    width: 24
    height: 3
    tab_name: ''
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
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
    row: 16
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
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
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
    row: 35
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
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
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
    row: 24
    col: 19
    width: 5
    height: 2
    tab_name: ''
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    display: flex; \n    align-items: center; \n    padding: 24px 0 16px 0;\
      \ \n    color: #202124;\n\">\n  <svg style=\"color: #1a73e8; width: 32px; height:\
      \ 32px; margin-right: 24px;\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\n\
      \     <path d=\"M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2\
      \ 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z\"/>\n  </svg>\n\n  <span style=\"font-size:\
      \ 24px; font-weight: 400;\">Errors</span>\n</div>"
    row: 37
    col: 0
    width: 24
    height: 3
    tab_name: ''
  - name: " (11)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 46
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
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 68
    col: 20
    width: 4
    height: 2
    tab_name: ''
  - name: " (13)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 68
    col: 0
    width: 20
    height: 2
    tab_name: ''
  - name: " (14)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n    width: 100%;\n    display: flex;\n    align-items:\
      \ center;\n    gap: 12px; \n    font-family: 'Google Sans', Roboto, Arial, sans-serif;\n\
      \    padding: 8px 0 16px 0;\n    flex-wrap: wrap;\n\">\n  \n  <span style=\"\
      font-size: 13px; color: #5f6368; margin-right: 8px;\">Applicable Filters:</span>\n\
      \n  <div style=\"\n    background: #e8f0fe; \n    color: #1967d2; \n    font-weight:\
      \ 700; \n    font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">5</div>\n\n  <div style=\"\n    background: #fce8e6; \n    color:\
      \ #c5221f; \n    font-weight: 700; \n    font-size: 14px; \n    height: 32px;\
      \ \n    width: 32px; \n    border-radius: 50%; \n    display: flex; \n    align-items:\
      \ center; \n    justify-content: center;\n  \">6</div>\n\n  <div style=\"\n\
      \    background: #fef7e0; \n    color: #f09d00; \n    font-weight: 700; \n \
      \   font-size: 14px; \n    height: 32px; \n    width: 32px; \n    border-radius:\
      \ 50%; \n    display: flex; \n    align-items: center; \n    justify-content:\
      \ center;\n  \">7</div>\n\n</div>"
    row: 58
    col: 20
    width: 4
    height: 2
    tab_name: ''
  filters:
  - name: 1 - Event Location
    title: 1 - Event Location
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
  - name: 2 - Event View Name
    title: 2 - Event View Name
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
  - name: 3 - Code Label
    title: 3 - Code Label
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
  - name: 4 -Event Time
    title: 4 -Event Time
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: events
    listens_to_filters: []
    field: events.event_time
  - name: 5 - Error Type
    title: 5 - Error Type
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
  - name: 6 - Error Location
    title: 6 - Error Location
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
  - name: 7 - Error Date
    title: 7 - Error Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcs_storage_intelligence
    explore: error_attributes
    listens_to_filters: []
    field: error_attributes.error_date
