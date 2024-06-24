provider "google" {
  project = var.project
  region  = var.region
}

resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = var.display_name

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

  documentation {
    content = var.documentation_content
    mime_type = var.documentation_mime_type
  }

  user_labels = var.user_labels
}

# resource "google_monitoring_alert_policy" "ca_certificates_30_days_expiry" {
#   project      = local.devops_projects["devops"].project_id
#   display_name = "CA certificates expire in 30 days"
#   combiner     = "OR"
#   conditions {
#     display_name = "CA certificates expire in 30 days or less"
#     condition_threshold {
#       filter          = "metric.type=\"privateca.googleapis.com/ca/cert_expiration\" AND resource.type=\"privateca.googleapis.com/CertificateAuthority\""
#       comparison      = "COMPARISON_LT"
#       threshold_value = 2592000 # 30 Days
#       duration        = "0s"
#       aggregations {
#         alignment_period   = "60s"
#         per_series_aligner = "ALIGN_MEAN"
#       }
#     }
#   }
#   # notification_channels = [data.google_monitoring_notification_channel.pager_duty.name]
#   user_labels = {
#     severity = "high"
#   }
# }
