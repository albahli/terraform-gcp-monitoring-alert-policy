# terraform-google-monitoring-alert-policy

This module creates a Google Cloud Monitoring Alert Policy based on the official resource https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy

## Usage

1. Defining the module in `main.tf` file:
``` hcl
module "monitoring_alert_policy" {
  source                           = "albahli/monitoring-alert-policy/gcp"
# version                          = "0.0.9" Optional to use specifc release
  for_each                            = local.monitoring_alert_policies
  project                             = "Your-Project-ID"
  display_name                        = each.key
  combiner                            = lookup(each.value, "combiner", "OR")
  condition_threshold                 = lookup(each.value, "condition_threshold", null)
  condition_absent                    = lookup(each.value, "condition_absent", null)
  condition_monitoring_query_language = lookup(each.value, "condition_monitoring_query_language", null)
  condition_matched_log               = lookup(each.value, "condition_matched_log", null)
  condition_prometheus_query_language = lookup(each.value, "condition_prometheus_query_language", null)
  alert_settings = {
    enabled               = lookup(each.value, "enabled", true)
    notification_channels = lookup(each.value, "notification_channels", [])
    severity              = lookup(each.value, "severity", "WARNING")
    user_labels           = lookup(each.value, "user_labels", null)
    alert_strategy        = lookup(each.value, "alert_strategy", null)
    documentation = {
      content   = lookup(each.value, "description", "")
      mime_type = "text/markdown"
      subject   = each.key
    }
  }
}
```

2. Use it in the `alerts-policies.tf` as below:
```hcl
locals {
  monitoring_alert_policies = {
    ca_certificates_7_days_expiry = {
      description           = "The CA certificate expires in 7 days and should be renewed or retired."
      severity              = "CRITICAL"
      condition_threshold   = local.threshold_conditions.ca_certificates_7_days_expiry
      notification_channels = [data.google_monitoring_notification_channel.pagerduty.name]
    },
    ca_certificates_30_days_expiry = {
      description           = "The CA certificate expires in 30 days and should be renewed or retired."
      severity              = "WARNING"
      condition_threshold   = local.threshold_conditions.ca_certificates_30_days_expiry
      notification_channels = [data.google_monitoring_notification_channel.pagerduty.name]
    }
  }
}

locals {
  threshold_conditions = {
    ca_certificates_7_days_expiry = {
      filter          = "metric.type=\"privateca.googleapis.com/ca/cert_expiration\" AND resource.type=\"privateca.googleapis.com/CertificateAuthority\""
      comparison      = "COMPARISON_LT" # '<' 
      threshold_value = 604800          # 7 Days
      duration        = "0s"
      trigger         = { count = 1 }
    },
    ca_certificates_30_days_expiry = {
      filter          = "metric.type=\"privateca.googleapis.com/ca/cert_expiration\" AND resource.type=\"privateca.googleapis.com/CertificateAuthority\""
      comparison      = "COMPARISON_LT" # '<' 
      threshold_value = 2592000         # 30 Days
      duration        = "0s"
      trigger         = { count = 1 }
    },
  }
  absent_conditions                    = {}
  monitoring_query_language_conditions = {}
  matched_log_conditions               = {}
  prometheus_query_language_conditions = {}
}
```

Note that module variables are fixed, but can be filled/customized based on how you define your `locals` variables.
## Inputs
This is a [Reference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy#argument-reference) for all below inputs and it's sub inputs as well.

| Name                                |	Description                                                                                                                                                                                                                                  | Type         |	Default                                                                                                                        |	Required |
| ------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:| ------------:| ------------------------------------------------------------------------------------------------------------------------------:| ----------|
| project                             | The ID of the project in which to create the alert policy.                       	                                                                                                                                                           | string       | n/a	                                                                                                                           | yes       |
| display_name	                      | The display name of the alert policy.	                                                                                                                                                                                                       | string       | n/a	                                                                                                                           | yes       |
| combiner	                          | How to combine the results of multiple conditions.                                                                                                                                                                                           | string       | `OR`                                                                                                                           | no        |
| condition_threshold     	          | A condition that compares a time series against a threshold.                                                                                                                                                                                 | object       | `null`                                                                                                                         | no        |                                                                                                    
| condition_absent            	      | A condition that checks that a time series continues to receive new data points.                                                                                                                                                             | object       | `null`                                                                                                                         | no        |                                                                                                                                                 
| condition_monitoring_query_language | A Monitoring Query Language query that outputs a boolean stream.                                                                                                                                                                             | object       | `null`                                                                                                                         | no        |                                                                    
| condition_matched_log           	  | A condition that checks for log messages matching given constraints. If set, no other conditions can be present.                                                                                                                             | object       | `null`                                                                                                                         | no        |
| condition_prometheus_query_language | A condition type that allows alert policies to be defined using Prometheus Query Language (PromQL). The PrometheusQueryLanguageCondition message contains information from a Prometheus alerting rule and its associated rule group.         | object       | `null` 	                                                                                                                       | no        |
| alert_settings       	              | An object that contains those official inputs `enabled`, `notification_channels`, `severity`, `user_labels`, `alert_strategy`, and `documentation`.                                                                                          | object       | `enabled=true`, `notification_channels=[]`, `severity=null`, `user_labels={}`, `alert_strategy=null`, and `documentation=null` | no        |

