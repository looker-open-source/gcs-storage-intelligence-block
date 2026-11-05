---
- dashboard: context_catalog
  title: GCS Storage Intelligence - Context Catalog
  preferred_viewer: dashboards-next
  style: modern
  description: ''
  preferred_slug: I6VNZW5MZ1oo8rGmEbt7WM
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Total contexts
    name: Total contexts
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: single_value
    fields: [object_contexts_catalog__contexts.total_contexts]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Displays the total count of object context annotations attached to objects within the currently selected scope.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 8
    col: 1
    width: 14
    height: 5
    tab_name: ''
  - title: Total buckets with contexts
    name: Total buckets with contexts
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: single_value
    fields: [object_contexts_catalog.bucket_count]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    global_tooltip_options:
      custom_tooltips_enabled: false
      style:
        font_size: 12
        font_family: Roboto, 'Noto Sans', 'Noto Sans JP', 'Noto Sans CJK KR', 'Noto
          Sans Arabic UI', 'Noto Sans Devanagari UI', 'Noto Sans Hebrew', 'Noto Sans
          Thai UI', Helvetica, Arial, sans-serif
        font_color: "#FFFFFF"
        background_color: "#262D33"
        border_radius: 4
        border_color: transparent
        box_shadow: none
        align: left
      template: |2-

        <div class="section">
          <div class="header">Total buckets</div>
          <div class="value">{{ object_contexts_catalog.bucket_count }}</div>
        </div>
    smart_single_value_size: true
    conditional_formatting: [{apply_formatting_to_row: false, cell_format: {background_color: "#1A73E8",
          color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
            options: {mirror: false, reverse: false, stepped: false}, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
          font_color: !!null '', font_style: {bold: false, italic: false, strikethrough: false}},
        fields: !!null '', id: 35ba99a1-f916-4dff-8ffd-0e96d81279c3, row_format: {
          background_color: "#1A73E8", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
            options: {mirror: false, reverse: false, stepped: false}, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
          font_color: !!null '', font_style: {bold: false, italic: false, strikethrough: false}},
        type: equal to, value: !!null ''}]
    table_theme: modern
    modern2026: true
    defaults_version: 1
    hidden_pivots: {}
    primary_row: first
    show_chart_component: false
    enable_custom_tooltip: false
    note_state: collapsed
    note_display: hover
    note_text: Displays the count of unique storage buckets that contain at least one object with attached context metadata.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 8
    col: 16
    width: 12
    height: 5
    tab_name: ''
  - title: Total objects with contexts
    name: Total objects with contexts
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: single_value
    fields: [object_contexts_catalog.object_count]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    table_theme: modern
    modern2026: true
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the total count of unique storage objects that have one or more context key-value annotations attached.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 8
    col: 29
    width: 12
    height: 5
    tab_name: ''
  - title: Total context keys
    name: Total context keys
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: single_value
    fields: [object_contexts_catalog__contexts.total_contexts_with_keys]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    table_theme: modern
    modern2026: true
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Displays the count of distinct context keys in use across the selected buckets and objects.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 8
    col: 42
    width: 12
    height: 5
    tab_name: ''
  - title: Total objects with extended data
    name: Total objects with extended data
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: single_value
    fields: [object_contexts_catalog__contexts.total_objects_with_extended_data]
    filters:
      project_attributes.project_name: "-NULL"
    limit: 500
    column_limit: 50
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Displays the count of objects whose context entries include structured JSON extended data payloads.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 8
    col: 55
    width: 15
    height: 5
    tab_name: ''
  - title: Object context & extended data summary
    name: Object context & extended data summary
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: looker_grid
    fields: [object_contexts_catalog.bucket_name, object_contexts_catalog.object_name,
      object_contexts_catalog__contexts.total_contexts, object_contexts_catalog__contexts.total_extended_data_entries]
    sorts: [object_contexts_catalog__contexts.total_contexts desc, object_contexts_catalog__contexts.total_extended_data_entries
        desc]
    limit: 500
    column_limit: 50
    query_timezone: UTC
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
      object_contexts_catalog__contexts.total_contexts:
        is_active: false
    table_show_footer: false
    table_enable_pagination: true
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
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Lists individual objects alongside their parent bucket, total attached context count, and total extended data entries to help audit metadata enrichment at the object level.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 70
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Objects and contexts
    name: Objects and contexts
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: looker_grid
    fields: [object_contexts_catalog.object_name, object_contexts_catalog__contexts.key,
      object_contexts_catalog__contexts.value, object_contexts_catalog__contexts.context_creation_time]
    sorts: [object_contexts_catalog.object_name desc]
    limit: 500
    column_limit: 50
    query_timezone: UTC
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
      object_contexts_catalog__contexts.total_contexts:
        is_active: false
    table_show_footer: false
    table_enable_pagination: true
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
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Provides a detailed catalog of objects with their attached Context Key, Context Value, and Context Creation Time for granular metadata inspection.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 160
    col: 0
    width: 72
    height: 17
    tab_name: ''
  - title: Total created contexts over time
    name: Total created contexts over time
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: looker_line
    fields: [object_contexts_catalog__contexts.context_creation_date, object_contexts_catalog__contexts.total_contexts]
    fill_fields: [object_contexts_catalog__contexts.context_creation_date]
    sorts: [object_contexts_catalog__contexts.context_creation_date]
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
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      object_contexts_catalog__contexts.total_contexts: "#AD7FE6"
    table_theme: modern
    modern2026: true
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Tracks the daily volume of newly created object context entries over time to monitor metadata tagging adoption and batch annotation runs.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 13
    col: 0
    width: 72
    height: 19
    tab_name: ''
  - title: Top buckets by number of contexts
    name: Top buckets by number of contexts
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: looker_bar
    fields: [object_contexts_catalog.bucket_name, object_contexts_catalog__contexts.total_contexts]
    sorts: [object_contexts_catalog__contexts.total_contexts desc 0]
    limit: 10
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      object_contexts_catalog.total_contexts: "#E574B1"
      object_contexts_catalog__contexts.total_contexts: "#E574B1"
    table_theme: modern
    modern2026: true
    hidden_pivots: {}
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    value_labels: legend
    label_type: labPer
    note_state: collapsed
    note_display: hover
    note_text: Ranks storage buckets in descending order by their total count of attached object contexts, highlighting where metadata tagging is most concentrated.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 50
    col: 0
    width: 72
    height: 20
    tab_name: ''
  - title: Top context keys by number of objects
    name: Top context keys by number of objects
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: looker_column
    fields: [object_contexts_catalog.object_count, object_contexts_catalog__contexts.key]
    sorts: [object_contexts_catalog.object_count desc 0]
    limit: 10
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      object_contexts_catalog.total_contexts: "#E574B1"
      object_contexts_catalog.object_count: "#2BB8CA"
    table_theme: modern
    modern2026: true
    hidden_pivots: {}
    defaults_version: 1
    up_color: false
    down_color: false
    total_color: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    value_labels: legend
    label_type: labPer
    note_state: collapsed
    note_display: hover
    note_text: Ranks context keys by the number of distinct objects tagged with each key, revealing the most widely adopted classification attributes.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 142
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Bucket context coverage
    name: Bucket context coverage
    model: gcs_storage_intelligence
    explore: bucket_attributes
    type: looker_grid
    fields: [bucket_attributes.bucket_name, bucket_attributes.object_sum, object_contexts_catalog__filtered_contexts.total_filtered_objects,
      bucket_attributes.context_coverage]
    sorts: [bucket_attributes.context_coverage desc]
    limit: 5000
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
      bucket_attributes.object_sum:
        is_active: true
        palette:
          palette_id: custom
          collection_id: custom
          custom_colors:
          - "#E8F0FE"
          - "#8AB4F8"
      object_contexts_catalog__filtered_contexts.total_filtered_objects:
        is_active: true
        palette:
          palette_id: custom
          collection_id: custom
          custom_colors:
          - "#E0F7FA"
          - "#4DD0E1"
      bucket_attributes.context_coverage:
        is_active: true
        palette:
          palette_id: custom
          collection_id: custom
          custom_colors:
          - "#F3E8FD"
          - "#D482D1"
    table_show_footer: false
    table_enable_pagination: true
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
    note_text: Compares each bucket's total object count against the count of objects matching the active context filters, calculating the Context Coverage percentage per bucket.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: bucket_attributes.bucket_name
      3 - Location: bucket_attributes.location
      4 - Context key: bucket_attributes.filter_context_key
      5 - Context value: bucket_attributes.filter_context_value
    row: 32
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Total objects by context key:value
    name: Total objects by context key:value
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: looker_grid
    fields: [object_contexts_catalog__contexts.key_value, object_contexts_catalog.object_count]
    sorts: [object_contexts_catalog.object_count desc 0]
    limit: 5000
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
      object_contexts_catalog.object_count:
        is_active: true
        palette:
          palette_id: custom
          collection_id: custom
          custom_colors:
          - "#E8F0FE"
          - "#1A73E8"
    table_show_footer: false
    table_enable_pagination: true
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
    note_text: Aggregates the total number of objects associated with each unique Context Key:Value pair to audit tag distribution.
    listen:
      1 - Project ID: project_attributes.project_id
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 88
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - title: Context flow by total objects
    name: Context flow by total objects
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [object_contexts_catalog__contexts.key, object_contexts_catalog__contexts.value,
      object_contexts_catalog.object_count]
    sorts: [object_contexts_catalog.object_count desc]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#E8F0FE", "#1A73E8"]
    defaults_version: 0
    label_type: name
    show_null_points: true
    note_state: collapsed
    note_display: hover
    note_text: A Sankey diagram illustrating how object counts flow from Context Keys to their corresponding Context Values.
    listen:
      2 - Bucket name: object_contexts_catalog.bucket_name
      3 - Location: object_contexts_catalog.location
      4 - Context key: object_contexts_catalog__contexts.key
      5 - Context value: object_contexts_catalog__contexts.value
    row: 106
    col: 0
    width: 72
    height: 36
    tab_name: ''
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
      #\">Context Catalog</a>\n  </nav>\n\n  <nav style=\"\n      font-size: 16px;\
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
    width: 72
    height: 8
    tab_name: ''
  - type: button
    name: button_550
    rich_content_json: '{"text":"Previous","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","href":"/dashboards/gcs_storage_intelligence::security_and_compliance","color":"#828487"}'
    row: 177
    col: 0
    width: 7
    height: 3
    tab_name: ''
  - type: button
    name: button_551
    rich_content_json: '{"text":"Next","description":"","newTab":false,"alignment":"center","size":"large","style":"OUTLINED","href":"/dashboards/gcs_storage_intelligence::bucket_activity","color":"#828487"}'
    row: 177
    col: 64
    width: 7
    height: 3
    tab_name: ''
  filters:
  - name: 1 - Project ID
    title: 1 - Project ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    listens_to_filters: [2 - Bucket name, 3 - Location, 5 - Context value]
    field: project_attributes.project_id
  - name: 2 - Bucket name
    title: 2 - Bucket name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    listens_to_filters: [1 - Project ID, 3 - Location, 5 - Context value]
    field: object_contexts_catalog.bucket_name
  - name: 3 - Location
    title: 3 - Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: object_contexts_catalog
    listens_to_filters: [1 - Project ID, 2 - Bucket name, 5 - Context value]
    field: object_contexts_catalog.location
  - name: 4 - Context key
    title: 4 - Context key
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcs_storage_intelligence
    explore: lightweight_context_suggestions_dt
    listens_to_filters: []
    field: lightweight_context_suggestions_dt.context_key
  - name: 5 - Context value
    title: 5 - Context value
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcs_storage_intelligence
    explore: lightweight_context_suggestions_dt
    listens_to_filters: []
    field: lightweight_context_suggestions_dt.context_value
