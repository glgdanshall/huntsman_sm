- view: SLA_Monthly_Average
  sql_table_name: dbo.SLAMONTHLYAGM1
  fields:
  - dimension: id
    hidden: true
    primary_key: true
    type: string
    sql: ${TABLE}.AGREEMENT_ID
  
  - dimension: time_period
    hidden: true
    type: time
    timeframes: [month, year]
    sql: |
      DATE(
        CONCAT( to_date($TABLE).MONTH, '-', to_DATE(${TABLE}.YEAR), )
        )
    datatype: date
    
  - dimension: overall_avg
    type: number
    hidden: true
    value_format: '0.00\%'
    sql: ${TABLE}.OAVERAGE
    
    
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.sla_monthly_average
  #
  # # Define your dimensions and measures here, like this:
  # fields:
  #   - dimension: id
  #     description: "The unique ID for each order"
  #     type: number
  #     sql: ${TABLE}.id
  #
  #   - dimension_group: created
  #     description: "Transaction created date"
  #     type: time
  #     timeframes: [date, week, month, year]
  #     sql: ${TABLE}.created_at
  #
  #   - measure: count
  #     description: "Count of orders"
  #     type: count

# - view: sla_monthly_average
#   # Or, you could make this view a derived table, like this:
#   derived_table:
#     sql: |
#       SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#
#   # Define your dimensions and measures here, like this:
#   fields:
#     - dimension: user_id
#       description: "Unique ID for each user that has ordered"
#       type: number
#       sql: ${TABLE}.user_id
#
#     - dimension: lifetime_orders
#       description: "The total number of orders for each user"
#       type: number
#       sql: ${TABLE}.lifetime_orders
#
#     - dimension_group: most_recent_purchase
#       description: "The date when each user last ordered"
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.most_recent_purchase_at
#
#     - measure: total_lifetime_orders
#       description: "Use this for counting lifetime orders across many users"
#       type: sum
#       sql: ${lifetime_orders}
