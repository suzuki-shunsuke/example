resource "graylog_role" "regular_employee" {
  name = "regular_employee"
  description = "regular employee"
  permissions = [
    "dashboards:read",
    "indexsets:read",
    "indices:read",
    "inputs:read",
    "indexercluster:read",
  ]
}
