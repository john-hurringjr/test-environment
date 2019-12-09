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

module "org_sink_bigquery" {
  source                          = "github.com/john-hurringjr/test-modules/org-sinks/bigquery"
  project_id                      = module.org_log_sink_project.project_id
  bigquery_dataset_friendly_name  = "Org Sink"
  bigquery_dataset_id             = var.bigquery_org_sink_data_set_id
  sink_name                       = var.bigquery_org_sink_name
  organization_id                 = var.organization_id
}

/******************************************
  GCS
 *****************************************/

module "org_sink_gcs" {
  source                       = "github.com/john-hurringjr/test-modules/org-sinks/gcs"
  project_id                   = module.org_log_sink_project.project_id
  gcs_bucket_name              = var.gcs_org_sink_bucket_name
  object_age_move_to_nearline  = 180
  object_age_move_to_coldline  = 365
  sink_name                    = var.gcs_org_sink_name
  organization_id              = var.organization_id
}