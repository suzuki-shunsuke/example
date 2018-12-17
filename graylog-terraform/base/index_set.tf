resource "graylog_index_set" "main" {
  description                         = "${var.index_set_description == "" ? var.name : var.index_set_description}"
  index_analyzer                      = "standard"
  index_optimization_disabled         = false
  index_optimization_max_num_segments = 1
  index_prefix                        = "${var.index_set_prefix}"
  index_prefix                        = "${var.index_set_prefix == "" ? var.name : var.index_set_prefix}"
  shards                              = 4
  rotation_strategy_class             = "${var.index_set_rotation_strategy_class}"
  retention_strategy_class            = "org.graylog2.indexer.retention.strategies.DeletionRetentionStrategy"

  retention_strategy = {
    max_number_of_indices = "${var.index_set_retention_size}"
    type                  = "org.graylog2.indexer.retention.strategies.DeletionRetentionStrategyConfig"
  }

  rotation_strategy = "${var.index_set_rotation_strategy}"

  title    = "${var.name}"
  writable = true
}
