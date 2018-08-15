# If necessary, uncomment the line below to include explore_source.
# include: "data_delivery_padawan_xin.model.lkml"

view: new_orders {
  derived_table: {
    datagroup_trigger: new_order_datagroup
    explore_source: orders {
      column: user_id {}
      column: name { field: users.name }
      column: created_time {}
      column: count {}
      filters: {
        field: orders.created_date
        value: "2 days"
      }
    }
  }
  dimension: user_id {
    type: number
  }
  dimension: name {}
  dimension: created_time {
    type: date_time
  }
  measure: count {
    type: number
  }
}
