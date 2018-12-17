variable "name" {
  type = "string"
}

variable "index_set_retention_size" {
  type    = "string"
  default = "365"
}

variable "index_set_description" {
  type    = "string"
  default = ""
}

variable "index_set_prefix" {
  type    = "string"
  default = ""
}

variable "index_set_rotation_strategy_class" {
  type    = "string"
  default = "org.graylog2.indexer.rotation.strategies.TimeBasedRotationStrategy"
}

variable "index_set_rotation_strategy" {
  type = "list"

  default = [{
    type            = "org.graylog2.indexer.rotation.strategies.TimeBasedRotationStrategyConfig"
    rotation_period = "P1D"
  }]
}
