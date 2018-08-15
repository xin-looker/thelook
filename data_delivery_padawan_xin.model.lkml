connection: "thelook_bigquery"

# include all the views
include: "*.view"

datagroup: new_order_datagroup {
  sql_trigger: SELECT MAX(id) FROM orders;;
  max_cache_age: "24 hour"
}

persist_with: new_order_datagroup

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.22
# NOTE: for BigQuery specific considerations

explore: all_types {}

explore: another_test_table {}

explore: nested_and_repeated {}

explore: order_items {
  join: orders {
    #_each
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    #_each
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    #_each
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
