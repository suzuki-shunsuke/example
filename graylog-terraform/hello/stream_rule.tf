resource "graylog_stream_rule" "tag" {
  field       = "tag"
  stream_id   = "${var.stream_id}"
  description = ""
  type        = 1
  value       = "hello.app.${var.env}"
}
