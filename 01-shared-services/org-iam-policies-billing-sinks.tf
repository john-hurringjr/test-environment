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
  Org IAM
 *****************************************/

module "org_iam" {
  source                        = "github.com/john-hurringjr/test-modules//org-iam//group-access-allowed?ref=master"
  organization_admins_group     = var.organization_admins_group
  terraform_service_account     = var.terraform_service_account
  network_admins_group          = var.network_admins_group
  security_admins_group         = var.security_admins_group
  sre_group                     = var.sre_group
  organization_id               = var.organization_id
  billing_admins_group          = var.billing_admins_group
  external_user_os_login_group  = var.external_users_os_login_group
}


/******************************************
  Org Policies
 *****************************************/

module "org_policies" {
  source                    = "github.com/john-hurringjr/test-modules//org-policies?ref=master"
  organization_id           = var.organization_id
  domain_identities         = var.domain_identities
}


#/******************************************
#  Org Policies - Folder - Trusted Image
# *****************************************/
#
#resource "google_folder_organization_policy" "define_trusted_image_project" {
#  constraint  = "constraints/compute.trustedImageProjects"
#  folder      = google_folder.business_trusted_image.id
#  list_policy {
#    allow {
#      values = ["projects/${module.os_images_project_prod.project_id}",]
#    }
#  }
#}
#
#/******************************************
#  Org - BigQuery
# *****************************************/
#
#module "org_sink_bigquery" {
#  source                          = "github.com/john-hurringjr/test-modules//org-sinks/bigquery?ref=master"
#  project_id                      = module.org_log_sink_project.project_id
#  bigquery_dataset_friendly_name  = "Org Sink"
#  bigquery_dataset_id             = var.bigquery_org_sink_data_set_id
#  sink_name                       = var.bigquery_org_sink_name
#  organization_id                 = var.organization_id
#}
#
#/******************************************
#  Org - GCS
# *****************************************/
#
#module "org_sink_gcs" {
#  source                       = "github.com/john-hurringjr/test-modules//org-sinks/gcs?ref=master"
#  project_id                   = module.org_log_sink_project.project_id
#  gcs_bucket_name              = var.gcs_org_sink_bucket_name
#  object_age_move_to_nearline  = 180
#  object_age_move_to_coldline  = 365
#  sink_name                    = var.gcs_org_sink_name
#  organization_id              = var.organization_id
#}
#
#/******************************************
#  Billing - PubSub
# *****************************************/
#
#module "billing_sink_pubsub" {
#  source                                 = "github.com/john-hurringjr/test-modules//billing-log-sink/pubsub?ref=master"
#  project_id                             = module.org_log_sink_project.project_id
#  sink_pubsub_topic_name                 = var.billing_sink_pubsub_topic_name
#  sink_pubsub_subscription_name          = var.billing_sink_pubsub_subscription_name
#  sink_name                              = var.billing_pubsub_sink_name
#  sink_subscription_service_account_name = var.billing_sink_subscription_service_account_name
#  billing_account                        = var.billing_account_id
#
#}
#
#/******************************************
#  Billing - GCS
# *****************************************/
#
#module "billing_sink_gcs" {
#  source                       = "github.com/john-hurringjr/test-modules//billing-log-sink/gcs?ref=master"
#  project_id                   = module.org_log_sink_project.project_id
#  gcs_bucket_name              = var.gcs_billing_sink_bucket_name
#  object_age_move_to_nearline  = 180
#  object_age_move_to_coldline  = 365
#  sink_name                    = var.gcs_billing_sink_name
#  billing_account              = var.billing_account_id
#}
#
#/******************************************
#  Billing 2 - PubSub
# *****************************************/
#
#//module "billing_2_sink_pubsub" {
#//  source                                 = "github.com/john-hurringjr/test-modules/billing-log-sink/pubsub"
#//  project_id                             = module.org_log_sink_project.project_id
#//  sink_pubsub_topic_name                 = var.billing_2_sink_pubsub_topic_name
#//  sink_pubsub_subscription_name          = var.billing_2_sink_pubsub_subscription_name
#//  sink_name                              = var.billing_2_pubsub_sink_name
#//  sink_subscription_service_account_name = var.billing_2_sink_subscription_service_account_name
#//  billing_account                        = var.billing_account_id_2
#//
#//}
#
#/******************************************
#  Billing 2 - GCS
# *****************************************/
#
#module "billing_2_sink_gcs" {
#  source                       = "github.com/john-hurringjr/test-modules//billing-log-sink/gcs?ref=master"
#  project_id                   = module.org_log_sink_project.project_id
#  gcs_bucket_name              = var.gcs_billing_2_sink_bucket_name
#  object_age_move_to_nearline  = 180
#  object_age_move_to_coldline  = 365
#  sink_name                    = var.gcs_billing_2_sink_name
#  billing_account              = var.billing_account_id_2
#}