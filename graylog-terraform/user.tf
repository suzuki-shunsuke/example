resource "graylog_user" "mike" {
  username = "mike"
  email = "mike@example.com"
  full_name = "mike"
  roles = [
    "regular_employee",
    "Reader",
    "${module.hello.regular_employee_name}",
  ]
}
