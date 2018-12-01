resource "graylog_stream" "hello-dev" {
  description = "hello dev"
  title = "${local.name}-dev"
  index_set_id = "${graylog_index_set.hello-dev.id}"
  disabled = false
  is_default = false
  matching_type = "AND"
  remove_matches_from_default_stream = true
}
