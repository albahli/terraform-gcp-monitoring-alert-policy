# terraform-google-monitoring-alert-policy

This module creates a Google Cloud Monitoring Alert Policy based on the official resource https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy

Note that not all attributes in the official resource are supported yet.


## Usage

``` hcl
module "monitoring_alert_policy" {
  source                           = "albahli/monitoring-alert-policy/gcp"
# version                          = "0.0.9" Optional to use specifc release
  region                           = "me-central2"
  project                          = local.devops_projects["devops"].project_id
  display_name                     = "My Alert Policy"
  condition_display_name           = "CPU utiliaztion over 0.8 for a minute"
  condition_filter                 = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
  condition_comparison             = "COMPARISON_GT"
  condition_duration               = "60s"
  condition_threshold_value        = 0.8
  aggregation_alignment_period     = "60s"
  aggregation_per_series_aligner   = "ALIGN_MEAN"
  aggregation_cross_series_reducer = "REDUCE_MEAN"
  aggregation_group_by_fields      = ["resource.zone"]
  notification_channels            = ["projects/your-project-id/notificationChannels/1234567890"]
  combiner                         = "OR"
  enabled                          = true
  user_labels = {
    env = "production"
  }
}
```

## Inputs
| Name                               |	Description                                                                                                                                                                                                                                 | Type         |	Default        |	Required |
| ---------------------------------- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:| ------------:| ---------------:| ----------|
| project                            | The ID of the project in which to create the alert policy.                       	                                                                                                                                                          | string       | n/a	           | yes       |
| region	                           | The region in which to create the alert policy.	                                                                                                                                                                                            | string       | "us-central1"   | no        |
| display_name	                     |  The display name of the alert policy.	                                                                                                                                                                                                      | string       | n/a	           | yes       |
| condition_display_name	           |  The display name of the condition.	                                                                                                                                                                                                        | string       | n/a	           | yes       |
| condition_filter	                 |  A filter that identifies which time series should be compared with the threshold.	                                                                                                                                                          | string       | n/a	           | yes       |
| condition_comparison	             |  The comparison to apply between the time series and the threshold.	                                                                                                                                                                        | string       | n/a             | yes       |
| condition_duration	               |  The duration for which the time series must violate the threshold to be considered a match.                                                                                                                                                 |	string       | n/a	           | yes       |
| condition_threshold_value	         |  The value against which to compare the time series.                                                                                                                                                                                         |	number       | n/a	           | yes       |
| aggregation_alignment_period	     |  The alignment period for aggregations.                                                                                                                                                                                                      | string       | n/a             | yes       |
| aggregation_per_series_aligner	   |  The per-series aligner for aggregations.                                                                                                                                                                                                    | string       | n/a             | yes       |
| aggregation_cross_series_reducer	 |  The cross-series reducer for aggregations.                                                                                                                                                                                                  |	string       | n/a             | yes       |
| aggregation_group_by_fields	       |  The fields to group by for aggregations.	                                                                                                                                                                                                  | list(string) | n/a	           | yes       |
| notification_channels	             |  The notification channels to use for the alert policy.                                                                                                                                                                                      |	list(string) | n/a	           | yes       |
| combiner	                         |  How to combine the results of multiple conditions.                                                                                                                                                                                          | string       | n/a             | yes       |
| enabled	                           |  Whether the alert policy is enabled.	                                                                                                                                                                                                      | bool	       | true            | no        |
| user_labels	                       |  User-supplied key/value labels for the alert policy.	                                                                                                                                                                                      | map(string)	 | {}              | no        |
| severity	                         |  The severity of an alert policy indicates how important incidents generated by that policy are. The severity level will be displayed on the Incident detail page and in notifications. Possible values are: `CRITICAL`, `ERROR`, `WARNING`. | string	     | n/a             | no        |