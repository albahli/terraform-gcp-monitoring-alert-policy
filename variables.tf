variable "project" {
  type = string
}

variable "combiner" {
  type    = string
  default = "OR"
}

variable "display_name" {
  type = string
}

variable "condition_absent" {
  type = object({
    aggregations = optional(object({
      per_series_aligner   = optional(string, null)
      group_by_fields      = optional(list(string), [])
      alignment_period     = optional(string, null)
      cross_series_reducer = optional(string, null)
    }), null)
    trigger = optional(object({
      count = optional(number, null)
    }), null)
    duration = string
    filter   = optional(string, null)
  })
  default = null
}

variable "condition_monitoring_query_language" {
  type = object({

    query    = string
    duration = string
    trigger = optional(object({
      count = optional(number, null)
    }), null)
    evaluation_missing_data = optional(string, null)
  })
  default = null
}

variable "condition_threshold" {
  type = object({

    threshold_value    = optional(number, null)
    denominator_filter = optional(string, null)
    denominator_aggregations = optional(object({
      per_series_aligner   = optional(string, null)
      group_by_fields      = optional(list(string))
      alignment_period     = optional(string, null)
      cross_series_reducer = optional(string, null)
    }), null)
    duration                = string
    comparison              = string
    filter                  = optional(string, null)
    evaluation_missing_data = optional(string, null)
    aggregations = optional(object({
      per_series_aligner   = optional(string, null)
      group_by_fields      = optional(list(string))
      alignment_period     = optional(string, null)
      cross_series_reducer = optional(string, null)
    }), null)
    trigger = optional(object({
      count = optional(number, null)
    }), null)
  })
  default = null
}

variable "condition_matched_log" {
  type = object({
    filter           = string
    label_extractors = optional(map(string), null)
  })
  default = null
}

variable "condition_prometheus_query_language" {
  type = object({
    query               = string
    duration            = optional(string, null)
    evaluation_interval = optional(number, 30)
    labels              = optional(map(string), null)
    rule_group          = optional(string, null)
    alert_rule          = optional(string, null)
  })
  default = null
}

variable "alert_settings" {
  type = object({
    enabled               = optional(bool, true)
    notification_channels = optional(list(string))
    alert_strategy = optional(object({
      notification_rate_limit = optional(object({
        period = optional(string, null)
      }), null)
      auto_close = optional(string, null)
      notification_channel_strategy = optional(object({
        notification_channel_names = optional(list(string))
        renotify_interval          = optional(string, null)
      }), null)
    }), null)
    user_labels = optional(map(string), null)
    severity    = optional(string, "WARNING")
    documentation = optional(object({
      content   = optional(string, null)
      mime_type = optional(string, null)
      subject   = optional(string, null)
    }), null)
  })
  default = {
    enabled               = true,
    notification_channels = [],
    user_labels           = {},
    severity              = null,
    alert_strategy        = null,
    documentation         = null
  }
}
