- view: incidents
  sql_table_name: dbo.PROBSUMMARYM1
  fields:
  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.NUMBER
    
  - dimension: category
    type: string
    sql: ${TABLE}.CATEGORY
    
  - dimension: open_time
    type: time
    timeframes: [time, date, week, month, year]
    sql: ${TABLE}.OPEN_TIME
    
  - dimension: opened_by
    type: string
    sql: ${TABLE}.OPENED_BY
    
  - dimension: priority
    type: number
    sql: ${TABLE}.PRIORITY_CODE
    
  - dimension: priority_text
    sql_case:
      Low: ${TABLE}.PRIORITY_CODE=4
      Average: ${TABLE}.PRIORITY_CODE=3
      High: ${TABLE}.PRIORITY_CODE=2
      Critical: ${TABLE}.PRIORITY_CODE=1
    
  - dimension: urgency
    type: number
    sql: ${TABLE}.SEVERITY
    
  - dimension: impact
    type: number
    sql: ${TABLE}.INITIAL_IMPACT
  
  - dimension: assignment
    type: string
    sql: ${TABLE}.ASSIGNMENT
  
  - dimension: affected_ci
    type: string
    sql: ${TABLE}.LOGICAL_NAME
  
  - dimension: hpe_affected_ci
    sql_case:
      SM: ${TABLE}.LOGICAL_NAME="HP SERVICE MANAGER CLIENT 9"
      AM: ${TABLE}.LOGICAL_NAME="HP ASSET MANAGER 9"
      OO: ${TABLE}.LOGICAL_NAME="HP OPERATIONS ORCHESTRATION RAS 9"
      UCMDB: ${TABLE}.LOGICAL_NAME="HP UNIVERSAL CMDB SERVER 10 X64"
      else: Other
    
  - measure: count
    type: count
  
    
# # You can specify the table name if it's different from the view name:
#   sql_table_name: my_schema_name.incidents
#
#   fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: id
#       description: "The unique ID for each order"
#       type: number
#       sql: ${TABLE}.id
#
#     - dimension_group: created
#       description: "Transaction created date"
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.created_at
#
#     - measure: count
#       description: "Count of orders"
#       type: count
#
#
# # Or, you could make this view a derived table, like this:
#   derived_table:
#     sql: |
#       SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#
#   fields:
# #     Define your dimensions and measures here, like this:
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
