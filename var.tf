variable "project" {
  description = "The ID of the project in which to create the alert policy."
  type        = string
}

variable "region" {
  description = "The region in which to create the alert policy."
  type        = string
}

variable "display_name" {
  description = "The display name for the alert policy"
  type        = string
}

variable "combiner" {
  description = "How to combine the results of multiple conditions to determine if an incident should be opened."
  type        = string
}

variable "condition_display_name" {
  description = "The display name for the condition"
  type        = string
}

variable "condition_absent_aggs_per_series_aligner" {
  description = "The alignment of the time series"
  type        = string
  default     = null
}

variable "condition_absent_aggs_group_by_fields" {
  description = "The fields by which to group the time series"
  type        = list(string)
  default     = null
}

variable "condition_absent_aggs_alignment_period" {
  description = "The alignment period for the time series"
  type        = string
  default     = null
}

variable "condition_absent_aggs_cross_series_reducer" {
  description = "The reducer to apply to the time series"
  type        = string
  default     = null
}

variable "condition_absent_trigger_percent" {
  description = "The percentage of time series for which the condition must hold"
  type        = number
  default     = null
}

variable "condition_absent_trigger_count" {
  description = "The number of time series for which the condition must hold"
  type        = number
  default     = null
}

variable "condition_absent_duration" {
  description = "The amount of time that a time series must fail to meet the threshold to be considered failing"
  type        = string
}

variable "condition_absent_filter" {
  description = "The filter that is used to identify a time series"
  type        = string
  default     = null
}

variable "condition_threshold_value" {
  description = "The value to which the time series should be compared"
  type        = number
  default     = null
}

variable "condition_threshold_denominator_filter" {
  description = "A filter that identifies the time series to be used as the denominator of the ratio"
  type        = string
  default     = null
}

variable "denominator_aggregations_per_series_aligner" {
  description = "The alignment of the time series"
  type        = string
  default     = null
}

variable "denominator_aggregations_group_by_fields" {
  description = "The fields by which to group the time series"
  type        = list(string)
  default     = null
}

variable "denominator_aggregations_alignment_period" {
  description = "The alignment period for the time series"
  type        = string
  default     = null
}

variable "denominator_aggregations_cross_series_reducer" {
  description = "The reducer to apply to the time series"
  type        = string
  default     = null
}

variable "condition_threshold_duration" {
  description = "The amount of time that a time series must fail to meet the threshold to be considered failing"
  type        = string
}

variable "forecast_horizon" {
  description = "The length of time into the future to forecast"
  type        = string
  default     = null
}

variable "condition_threshold_comparison" {
  description = "The comparison to apply to the time series"
  type        = string
}

variable "trigger_percent" {
  description = "The percentage of time series for which the condition must hold"
  type        = number
  default     = null
}

variable "trigger_count" {
  description = "The number of time series for which the condition must hold"
  type        = number
  default     = null
}

variable "aggregation_per_series_aligner" {
  description = "The alignment of the time series"
  type        = string
  default     = null
}

variable "aggregation_group_by_fields" {
  description = "The fields by which to group the time series"
  type        = list(string)
  default     = null
}

variable "aggregation_alignment_period" {
  description = "The alignment period for the time series"
  type        = string
  default     = null
}

variable "aggregation_cross_series_reducer" {
  description = "The reducer to apply to the time series"
  type        = string
  default     = null
}

variable "condition_threshold_filter" {
  description = "The filter that is used to identify a time series"
  type        = string
  default     = null
}

variable "condition_threshold_evaluation_missing_data" {
  description = "A condition control that determines how the policy handles missing data"
  type        = string
  default     = null
}

variable "cmql_query" {
  description = "The Monitoring Query Language query"
  type        = string
  default     = null
}

variable "cmql_language_duration" {
  description = "The duration that a time series must hold the threshold"
  type        = string
  default     = null
}

variable "cmql_trigger_percent" {
  description = "The percentage of time series for which the condition must hold"
  type        = number
  default     = null
}

variable "cmql_trigger_count" {
  description = "The number of time series for which the condition must hold"
  type        = number
  default     = null
}

variable "cmql_evaluation_missing_data" {
  description = "A condition control that determines how the policy handles missing data"
  type        = string
  default     = null
}

variable "condition_matched_log_filter" {
  description = "A filter to identify log entries"
  type        = string
}

variable "condition_matched_label_extractors" {
  description = "A map from a label key to an extractor expression"
  type        = map(string)
  default     = null
}

variable "cpql_query" {
  description = "The PromQL query"
  type        = string
}

variable "cpql_duration" {
  description = "The duration that a time series must hold the threshold"
  type        = string
  default     = null
}

variable "cpql_evaluation_interval" {
  description = "How often the time series should be evaluated"
  type        = string
  default     = null
}

variable "cpql_labels" {
  description = "Labels to apply to the time series"
  type        = map(string)
  default     = null
}

variable "cpql_rule_group" {
  description = "The rule group to which the alert belongs"
  type        = string
  default     = null
}

variable "cpql_alert_rule" {
  description = "The alert rule"
  type        = string
  default     = null
}

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
