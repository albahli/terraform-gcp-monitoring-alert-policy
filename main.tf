resource "google_monitoring_alert_policy" "alert_policy" {
  project      = var.project
  display_name = var.display_name
  combiner     = var.combiner

  conditions {
    display_name = var.display_name
    dynamic "condition_absent" {
      for_each = var.condition_absent != null ? [var.condition_absent] : []
      content {
        duration = condition_absent.value.duration
        filter   = condition_absent.value.filter

        dynamic "aggregations" {
          for_each = can(condition_absent.value.aggregations) ? [condition_absent.value.aggregations] : []
          content {
            per_series_aligner   = can(aggregations.value.per_series_aligner) ? aggregations.value.per_series_aligner : null
            group_by_fields      = can(aggregations.value.group_by_fields) ? aggregations.value.group_by_fields : null
            alignment_period     = can(aggregations.value.alignment_period) ? aggregations.value.alignment_period : null
            cross_series_reducer = can(aggregations.value.cross_series_reducer) ? aggregations.value.cross_series_reducer : null
          }
        }

        dynamic "trigger" {
          for_each = can(condition_absent.value.trigger) ? [condition_absent.value.trigger] : []
          content {
            count = can(trigger.value.count) ? trigger.value.count : null
          }
        }
      }
    }

    dynamic "condition_monitoring_query_language" {
      for_each = var.condition_monitoring_query_language != null ? [var.condition_monitoring_query_language] : []
      content {
        query    = condition_monitoring_query_language.value.query
        duration = condition_monitoring_query_language.value.duration

        dynamic "trigger" {
          for_each = can(condition_monitoring_query_language.value.trigger) ? [condition_monitoring_query_language.value.trigger] : []
          content {
            count = can(trigger.value.count) ? trigger.value.count : null
          }
        }
        evaluation_missing_data = condition_monitoring_query_language.value.evaluation_missing_data
      }
    }

    dynamic "condition_threshold" {
      for_each = var.condition_threshold != null ? [var.condition_threshold] : []
      content {
        threshold_value         = condition_threshold.value.threshold_value
        denominator_filter      = condition_threshold.value.denominator_filter
        duration                = condition_threshold.value.duration
        comparison              = condition_threshold.value.comparison
        filter                  = condition_threshold.value.filter
        evaluation_missing_data = condition_threshold.value.evaluation_missing_data

        dynamic "denominator_aggregations" {
          for_each = can(condition_threshold.value.denominator_aggregations) ? [condition_threshold.value.denominator_aggregations] : null
          content {
            per_series_aligner   = can(denominator_aggregations.value.per_series_aligner) ? denominator_aggregations.value.per_series_aligner : null
            group_by_fields      = can(denominator_aggregations.value.group_by_fields) ? denominator_aggregations.value.group_by_fields : null
            alignment_period     = can(denominator_aggregations.value.alignment_period) ? denominator_aggregations.value.alignment_period : null
            cross_series_reducer = can(denominator_aggregations.value.cross_series_reducer) ? denominator_aggregations.value.cross_series_reducer : null
          }
        }

        dynamic "aggregations" {
          for_each = can(condition_threshold.value.aggregations) ? [condition_threshold.value.aggregations] : []
          content {
            per_series_aligner   = can(aggregations.value.per_series_aligner) ? aggregations.value.per_series_aligner : null
            group_by_fields      = can(aggregations.value.group_by_fields) ? aggregations.value.group_by_fields : null
            alignment_period     = can(aggregations.value.alignment_period) ? aggregations.value.alignment_period : null
            cross_series_reducer = can(aggregations.value.cross_series_reducer) ? aggregations.value.cross_series_reducer : null
          }
        }

        dynamic "trigger" {
          for_each = can(condition_threshold.value.trigger) ? [condition_threshold.value.trigger] : []
          content {
            count = can(trigger.value.count) ? trigger.value.count : null
          }
        }
      }
    }

    dynamic "condition_matched_log" {
      for_each = var.condition_matched_log != null ? [var.condition_matched_log] : []
      content {
        filter           = condition_matched_log.value.filter
        label_extractors = condition_matched_log.value.label_extractors
      }
    }

    dynamic "condition_prometheus_query_language" {
      for_each = var.condition_prometheus_query_language != null ? [var.condition_prometheus_query_language] : []
      content {
        query               = condition_prometheus_query_language.value.query
        duration            = condition_prometheus_query_language.value.duration
        evaluation_interval = condition_prometheus_query_language.value.evaluation_interval
        rule_group          = condition_prometheus_query_language.value.rule_group
        alert_rule          = condition_prometheus_query_language.value.alert_rule
        labels              = condition_prometheus_query_language.value.labels
      }
    }
  }

  enabled               = var.alert_settings.enabled
  notification_channels = var.alert_settings.notification_channels

  dynamic "alert_strategy" {
    for_each = var.alert_settings.alert_strategy != null ? [var.alert_settings.alert_strategy] : []
    content {
      auto_close = alert_strategy.value.auto_close

      dynamic "notification_rate_limit" {
        for_each = can(alert_strategy.value.notification_rate_limit) ? [alert_strategy.value.notification_rate_limit] : []
        content {
          period = can(notification_rate_limit.value.period) ? notification_rate_limit.value.period : null
        }
      }

      dynamic "notification_channel_strategy" {
        for_each = can(alert_strategy.value.notification_channel_strategy) ? [alert_strategy.value.notification_channel_strategy] : []
        content {
          notification_channel_names = can(notification_channel_strategy.value.notification_channel_names) ? notification_channel_strategy.value.notification_channel_names : []
          renotify_interval          = can(notification_channel_strategy.value.renotify_interval) ? notification_channel_strategy.value.renotify_interval : null
        }
      }
    }
  }

  user_labels = var.alert_settings.user_labels
  severity    = var.alert_settings.severity

  dynamic "documentation" {
    for_each = var.alert_settings.documentation != null ? [var.alert_settings.documentation] : []
    content {
      content   = documentation.value.content
      mime_type = documentation.value.mime_type
      subject   = documentation.value.subject
    }
  }
}
