- connection: huntsman_sm

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# EXPLORES #

- explore: incidents

- explore: interactions
  joins:
    - join: interactions_a1
      foreign_key: interactions.id
      
- explore: requests
