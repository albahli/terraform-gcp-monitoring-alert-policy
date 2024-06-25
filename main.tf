provider "google" {
  project = var.project
  region  = var.region
}

resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = var.display_name
  project      = var.project
  conditions {
    display_name = var.condition_display_name
    condition_threshold {
      filter          = var.condition_filter
      comparison      = var.condition_comparison
      duration        = var.condition_duration
      threshold_value = var.condition_threshold_value
      aggregations {
        alignment_period     = var.aggregation_alignment_period
        per_series_aligner   = var.aggregation_per_series_aligner
        cross_series_reducer = var.aggregation_cross_series_reducer
        group_by_fields      = var.aggregation_group_by_fields
      }
    }
  }
  notification_channels = var.notification_channels
  combiner              = var.combiner
  enabled               = var.enabled
  user_labels           = var.user_labels
}
