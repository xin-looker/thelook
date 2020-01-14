- dashboard: sort_merge_result_on_table_calc_lookml_dashboard
  title: sort merge result on table calc lookml dashboard
  layout: newspaper
  elements:
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [history.created_month, history.count]
      fill_fields: [history.created_month]
      filters:
        history.created_month: 5 months
      sorts: [history.created_month desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: testing_520
      explore: orders
      type: table
      fields: [orders.created_month, orders.count]
      fill_fields: [orders.created_month]
      filters:
        orders.created_month: 5 months
      sorts: [orders.created_month desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: orders.created_month
        source_field_name: history.created_month
    type: table
    sorts: [calculation_1 desc]
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'coalesce(${orders.count},0)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    row: 0
    col: 0
    width: 8
    height: 6
