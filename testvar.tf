variable "condition_absent" {
  description = "The condition_absent block"
  type = object({
    aggregations = object({
      per_series_aligner   = string
      group_by_fields      = list(string)
      alignment_period     = string
      cross_series_reducer = string
    })
    trigger = object({
      percent = number
      count   = number
    })
    duration = string
    filter   = string
  })
  default = null
}

variable "condition_threshold" {
  description = "The condition_threshold block"
  type = object({
    threshold_value    = number
    denominator_filter = string
    denominator_aggregations = object({
      per_series_aligner   = string
      group_by_fields      = list(string)
      alignment_period     = string
      cross_series_reducer = string
    })
    duration     = string
    forecast_options = object({
      forecast_horizon = string
    })
    comparison   = string
    trigger      = object({
      percent = number
      count   = number
    })
    aggregations = object({
      per_series_aligner   = string
      group_by_fields      = list(string)
      alignment_period     = string
      cross_series_reducer = string
    })
    filter                  = string
    evaluation_missing_data = string
  })
  default = null
}

variable "condition_monitoring_query_language" {
  description = "The condition_monitoring_query_language block"
  type = object({
    query                      = string
    duration                   = string
    trigger                    = object({
      percent = number
      count   = number
    })
    evaluation_missing_data = string
  })
  default = null
}

# Add more blocks similarly...

variable "enabled" {
  description = "Whether the alert policy is enabled"
  type        = bool
  default     = true
}

variable "notification_channels" {
  description = "The notification channels to use"
  type        = list(string)
  default     = []
}

variable "alert_strategy_notification_rate_limit_period" {
  description = "The time period for rate limiting notifications"
  type        = string
  default     = null
}

variable "alert_strategy_auto_close" {
  description = "The time period for automatically closing incidents"
  type        = string
  default     = null
}

variable "notification_channel_names" {
  description = "The names of the notification channels"
  type        = list(string)
  default     = []
}

variable "renotify_interval" {
  description = "The interval at which to re-notify"
  type        = string
  default     = null
}

variable "user_labels" {
  description = "A set of user labels"
  type        = map(string)
  default     = {}
}

variable "severity" {
  description = "The severity of the alert"
  type        = string
  default     = null
}

variable "documentation_content" {
  description = "The content of the documentation"
  type        = string
  default     = null
}

variable "documentation_mime_type" {
  description = "The MIME type of the documentation"
  type        = string
  default     = null
}

variable "documentation_subject" {
  description = "The subject of the documentation"
  type        = string
  default     = null
}
