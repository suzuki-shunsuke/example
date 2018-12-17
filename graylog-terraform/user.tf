resource "graylog_user" "mike" {
  username  = "mike"
  email     = "mike@example.com"
  full_name = "mike"

  roles = [
    "regular_employee",
    "Reader",
    "${module.hello-prod-base.admin}",
  ]
}

resource "graylog_user" "terraform" {
  username  = "terraform"
  email     = "terraform@example.com"
  full_name = "terraform"

  roles = [
    "terraform",
    "Reader",
  ]
}
