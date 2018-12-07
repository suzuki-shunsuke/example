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

resource "graylog_role" "terraform" {
  name        = "terraform"
  description = "terraform"

  permissions = [
    "dashboards:*",
    "indexsets:*",
    "inputs:*",
    "roles:*",
    "streams:*",
    "users:*",
  ]
}
