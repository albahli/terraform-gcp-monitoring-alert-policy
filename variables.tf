variable "project" {
  description = "The ID of the project in which to create the alert policy."
  type        = string
}

variable "display_name" {
  description = "The display name of the alert policy."
  type        = string
}

variable "condition_display_name" {
  description = "The display name of the condition."
  type        = string
}

variable "condition_filter" {
  description = "A filter that identifies which time series should be compared with the threshold."
  type        = string
}

variable "condition_comparison" {
  description = "The comparison to apply between the time series and the threshold."
  type        = string
  default     = "COMPARISON_GT"
}

variable "condition_duration" {
  description = "The duration for which the time series must violate the threshold to be considered a match."
  type        = string
  default     = "60s"
}

variable "condition_threshold_value" {
  description = "The value against which to compare the time series."
  type        = number
  default     = 0
}

variable "aggregation_alignment_period" {
  description = "The alignment period for aggregations."
  type        = string
  default     = null
}

variable "aggregation_per_series_aligner" {
  description = "The per-series aligner for aggregations."
  type        = string
  default     = null

}

variable "aggregation_cross_series_reducer" {
  description = "The cross-series reducer for aggregations."
  type        = string
  default     = null
}

variable "aggregation_group_by_fields" {
  description = "The fields to group by for aggregations."
  type        = list(string)
  default     = []
}

variable "notification_channels" {
  description = "The notification channels to use for the alert policy."
  type        = list(string)
  default     = []
}

variable "combiner" {
  description = "How to combine the results of multiple conditions."
  type        = string
  default     = "OR"
}

variable "enabled" {
  description = "Whether the alert policy is enabled."
  type        = bool
  default     = true
}

variable "user_labels" {
  description = "User-supplied key/value labels for the alert policy."
  type        = map(string)
  default     = {}
}