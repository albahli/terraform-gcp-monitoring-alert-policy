# terraform-google-monitoring-alert-policy

This module creates a Google Cloud Monitoring Alert Policy.

## Usage

```
module "monitoring_alert_policy" {
  source = "github.com/Albahli/terraform-gcp-monitoring-alert-policy"

  project                     = "your-project-id"
  display_name                = "My Alert Policy"
  condition_display_name      = "Condition Display Name"
  condition_filter            = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
  condition_comparison        = "COMPARISON_GT"
  condition_duration          = "60s"
  condition_threshold_value   = 0.8
  aggregation_alignment_period = "60s"
  aggregation_per_series_aligner = "ALIGN_MEAN"
  aggregation_cross_series_reducer = "REDUCE_MEAN"
  aggregation_group_by_fields = ["resource.zone"]
  notification_channels       = ["projects/your-project-id/notificationChannels/1234567890"]
  combiner                    = "OR"
  enabled                     = true
  documentation_content       = "Alert documentation"
  documentation_mime_type     = "text/markdown"
  user_labels                 = {
    env = "production"
  }
}
```