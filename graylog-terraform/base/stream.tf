resource "graylog_stream" "main" {
  description                        = "${var.name}"
  title                              = "${var.name}"
  index_set_id                       = "${graylog_index_set.main.id}"
  disabled                           = false
  is_default                         = false
  matching_type                      = "AND"
  remove_matches_from_default_stream = true
}
