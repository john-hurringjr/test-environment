/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


/******************************************
  BigQuery
 *****************************************/
module "billing_log_sink_bigquery" {
  source                          = "github.com/john-hurringjr/test-modules/billing-export/bigquery"
  project_id                      = module.billing_export_project.project_id
  bigquery_dataset_friendly_name  = var.billing_export_bigquery_dataset_friendly_name
  bigquery_dataset_location       = var.billing_export_bigquery_dataset_location
  sink_name                       = var.billing_export_bigquery_sink_name
  bigquery_dataset_id             = var.billing_export_bigquery_dataset_id
  organization_id                 = var.organization_id
  billing_account_id              = var.billing_account_id
}

/******************************************
  GCS
 *****************************************/





